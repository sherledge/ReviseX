import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'database.dart';
import 'providers.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key});

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  late PageController _pageController;
  int _timeLeft = 60;
  Timer? _timer;
  String? _selectedAnswer;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

void _startTimer() {
  _timer?.cancel();
  _timeLeft = 60;
  _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if (_timeLeft > 0) {
      setState(() {
        _timeLeft--;
      });
    } else {
      timer.cancel();
      _handleTimeout();
    }
  });
}

void _handleTimeout() {
  if (!mounted || _answered) return;

  final questions = ref.read(quizQuestionsProvider);
  final currentIndex = _pageController.page?.toInt() ?? 0;
  final question = questions[currentIndex];

  // Record unanswered question due to timeout
  final answeredQuestions = ref.read(answeredQuestionsProvider);
  ref.read(answeredQuestionsProvider.notifier).state = [
    ...answeredQuestions,
    AnsweredQuestion(
      question: question.question,
      userAnswer: "Unanswered (Timeout)",
      correctAnswer: getCorrectAnswerText(question),
    ),
  ];

  // Update subject performance with timeout (counts towards total)
  final subjectPerformance = ref.read(subjectPerformanceProvider);
  final subject = question.subject;
  subjectPerformance[subject] = SubjectStats(
    correct: subjectPerformance[subject]?.correct ?? 0,
    total: (subjectPerformance[subject]?.total ?? 0) + 1,
  );
  ref.read(subjectPerformanceProvider.notifier).state = {...subjectPerformance};

  // Move to next question
  _goToNextQuestion();
}


  String getCorrectAnswerText(QuizData question) {
    switch (question.correctAnswer) {
      case 'A': return question.optionA;
      case 'B': return question.optionB;
      case 'C': return question.optionC;
      case 'D': return question.optionD;
      default: return '';
    }
  }

 void checkAnswer(String selectedAnswer, QuizData question) {
  if (_answered) return;

  final correctAnswerText = getCorrectAnswerText(question);
  final isCorrect = selectedAnswer == correctAnswerText;

  // ✅ Update Score (before setState)
  if (isCorrect) {
    ref.read(scoreProvider.notifier).state++;
  }

  // ✅ Update Answered Questions Provider (before setState)
  final answeredQuestions = ref.read(answeredQuestionsProvider);
  ref.read(answeredQuestionsProvider.notifier).state = [
    ...answeredQuestions,
    AnsweredQuestion(
      question: question.question,
      userAnswer: selectedAnswer,
      correctAnswer: correctAnswerText,
    ),
  ];

  // ✅ Update Subject Performance Provider (before setState)
  final subjectPerformance = ref.read(subjectPerformanceProvider);
  final subject = question.subject;
  subjectPerformance[subject] = SubjectStats(
    correct: (subjectPerformance[subject]?.correct ?? 0) + (isCorrect ? 1 : 0),
    total: (subjectPerformance[subject]?.total ?? 0) + 1,
  );
  ref.read(subjectPerformanceProvider.notifier).state = {...subjectPerformance};

  // ✅ Update UI state after provider updates
  setState(() {
    _selectedAnswer = selectedAnswer;
    _answered = true;
  });

  // ✅ Delay transition to the next question
  Future.delayed(const Duration(seconds: 2), _goToNextQuestion);
}


  void _goToNextQuestion() {
    if (!mounted) return;

    final totalQuestions = ref.read(quizQuestionsProvider).length;
    final currentIndex = _pageController.page?.toInt() ?? 0;

    if (currentIndex < totalQuestions - 1) {
      setState(() {
        _answered = false;
        _selectedAnswer = null;
      });
      _startTimer();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/score');
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(quizQuestionsProvider);
    if (questions.isEmpty) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      backgroundColor: const Color(0xFF2B223E),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                 mainAxisSize: MainAxisSize.min, // Prevents unnecessary height restrictions
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ✅ Top Row: Close Button - Timer - Progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => context.go('/'),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7A68FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '$_timeLeft',
                          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${index + 1}',
                            style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '/${questions.length}',
                            style: const TextStyle(fontSize: 18, color: Color(0xFF6F6C87), fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
              
                  const SizedBox(height: 40),
              
                  // ✅ Centered Question Text
                  Text(
                    question.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
              
                  const SizedBox(height: 40),
              
                  // ✅ Answer Options
                  for (var option in [question.optionA, question.optionB, question.optionC, question.optionD])
                    _buildOption(option, question),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildOption(String option, QuizData question) {
  final isCorrect = option == getCorrectAnswerText(question);
  final isSelected = option == _selectedAnswer;
  final showCorrect = _answered && isCorrect;
  final showIncorrect = _answered && isSelected && !isCorrect;

  return ValueListenableBuilder(
    valueListenable: ValueNotifier(isSelected),
    builder: (context, isSelected, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: GestureDetector(
          onTap: _answered ? null : () => checkAnswer(option, question),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: showCorrect
                  ? const Color(0xFF284E3E) // ✅ Green for correct
                  : showIncorrect
                      ? const Color(0xFF4E2828) // ❌ Red for incorrect
                      : const Color(0xFF35284E), // Default color
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: showCorrect
                    ? const Color(0xFF29DA30) // ✅ Green border for correct
                    : showIncorrect
                        ? const Color(0xFFD44D4D) // ❌ Red border for incorrect
                        : const Color(0xFF7C63AB), // Default border
                width: 0.5,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: const Offset(0, 2),
                      )
                    ]
                  : [],
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isSelected ? 0.8 : 1.0,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                title: Text(
                  option,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                trailing: _answered
                    ? Icon(
                        showCorrect ? Icons.check_circle : showIncorrect ? Icons.cancel : null,
                        color: showCorrect ? Colors.green : showIncorrect ? Colors.red : null,
                      )
                    : const SizedBox(width: 24, height: 24),
              ),
            ),
          ),
        ),
      );
    },
  );
}

}
