import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'database.dart';
import 'providers.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  int _dotCount = 0; // For animated "..." effect
  bool _showImage = false; // Ensure fade-in happens only once

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();
    _loadQuestions();

    // ✅ Start fade-in effect only once
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          _showImage = true;
        });
      }
    });
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
  final questions = await db.getRandomQuestions(); // ✅ Fetch questions

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
    String generatingText = "Generating" + "." * _dotCount;

    return Scaffold(
      backgroundColor: const Color(0xFF2B223E), // ✅ Match theme background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(), // Push content to center

          // ✅ Animated Fade-in Emoji Image
          AnimatedOpacity(
            opacity: _showImage ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 800),
            child: Image.asset(
              'assets/images/emoji2.png',
              width: 320,
              height: 160,
            ),
          ),

          const SizedBox(height: 20),

          // ✅ Fun loading text (More descriptive & engaging)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Hold on tight! 🚀\nYour brain is about to go on a knowledge adventure. Get ready to test your skills!",
              textAlign: TextAlign.center,
              style: TextStyle(
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
