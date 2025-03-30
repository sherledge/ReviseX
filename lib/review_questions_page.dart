import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers.dart';

class ReviewQuestionsPage extends ConsumerWidget {
  const ReviewQuestionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ✅ Get answered questions
    final answeredQuestions = ref.watch(answeredQuestionsProvider);

    // ✅ Map to store the latest attempt for each question
    final Map<String, dynamic> latestQuestionsMap = {};

    for (var question in answeredQuestions) {
      latestQuestionsMap[question.question] =
          question; // This keeps overwriting, keeping the latest one
    }

    // ✅ Get the unique & latest questions
    final uniqueLatestQuestions = latestQuestionsMap.values.toList();

    return Scaffold(
      backgroundColor: const Color(0xFF2B223E),
      body: Column(
        children: [
          const SizedBox(height: 40), // Space for the back button

          // ✅ Custom Back Button
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                onPressed: () => context.go('/score'),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ✅ Title
          const Text(
            "Review Your Answers",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          // ✅ No Questions Message
          if (uniqueLatestQuestions.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  'No questions to review',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ),
            )

          // ✅ List of Unique & Latest Questions
          else
            // ✅ List of Unique & Latest Questions
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: uniqueLatestQuestions.length,
                itemBuilder: (context, index) {
                  final question = uniqueLatestQuestions[index];
                  final isCorrect =
                      question.userAnswer == question.correctAnswer;

                  return Card(
                    elevation: 5,
                    color: const Color(0xFF35284E), // ✅ Match the theme
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isCorrect ? Colors.green : Colors.red,
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ✅ Question Text
                          Text(
                            question.question,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),

                          // ✅ User Answer
                          Text(
                            "Your Answer: ${question.userAnswer}",
                            style: TextStyle(
                              color: isCorrect
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              fontSize: 16,
                            ),
                          ),

                          // ✅ Correct Answer (Shown Only If User Answered Wrong)
                          if (!isCorrect)
                            Text(
                              "Correct Answer: ${question.correctAnswer}",
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
