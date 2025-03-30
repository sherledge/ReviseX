import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'database.dart';
import 'providers.dart';
import 'package:lottie/lottie.dart'; // ✅ Import Lottie

enum QuizType { standard, custom, ai }

class LoadingPage extends ConsumerStatefulWidget {
  final QuizType quizType; // ✅ Accepts quiz type

  const LoadingPage({super.key, required this.quizType});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  int _dotCount = 0; // For animated "..." effect

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();
    _loadQuestions();


  }

  void _startLoadingAnimation() {
    // ✅ Animate dots in "Generating..."
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _dotCount = (_dotCount + 1) % 4; // Cycle through 0,1,2,3 dots
      });
    });
  }

  void _loadQuestions() async {
    final db = ref.read(databaseProvider);

    if (widget.quizType == QuizType.custom) {
      // ✅ Go to Custom Quiz Setup
      await Future.delayed(const Duration(seconds: 2)); // Short delay for animation
      if (mounted) context.go('/custom_quiz_setup');
      return;
    }

    List<QuizData> questions = [];

    if (widget.quizType == QuizType.standard) {
      questions = await db.getRandomQuestions(); // ✅ Standard Quiz Questions
    } else if (widget.quizType == QuizType.ai) {
      questions = await db.generatePersonalizedQuiz(ref); // ✅ AI-Based Questions
    }

    if (questions.isNotEmpty) {
      ref.read(totalQuestionsProvider.notifier).state = questions.length;
      ref.read(quizQuestionsStateProvider.notifier).state = questions; // ✅ Store in StateProvider
    }

    // ✅ Wait for 3 seconds before navigating to Quiz Page
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) context.go('/quiz');
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic dots for animation
    String generatingText = "Loading" + "." * _dotCount;

    return Scaffold(
      backgroundColor: const Color(0xFF2B223E), // ✅ Match theme background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(), // Push content to center


          SizedBox(
            width: 200, 
            height: 200,
            child: Lottie.asset('assets/animations/jumpinganim.json'), // ✅ Animated emoji
          ),
          const SizedBox(height: 20),

          // ✅ Fun loading text (More descriptive & engaging)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              widget.quizType == QuizType.custom
                  ? "Setting up your Custom Quiz 🎛️\nChoose your subjects and preferences!"
                  : "Hold on tight! 🚀\nYour brain is about to go on a knowledge adventure. Get ready to test your skills!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ),

          const SizedBox(height: 10),
          const Spacer(), // Push button to bottom

          // ✅ Fake Button Effect (Pressed Look)
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 327,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF6F6C87), // Pressed button color
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                generatingText, // ✅ Animated text in the button as well
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
