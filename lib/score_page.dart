import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'providers.dart';

class ScorePage extends ConsumerWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scoreProvider);
    final totalQuestions = ref.watch(totalQuestionsProvider);

    double percentage = (score / totalQuestions) * 100;

    // ✅ Animation and Message Based on Score Percentage
    String lottieAsset;
    String message;

    if (percentage == 100) {
      lottieAsset = 'assets/animations/headblow.json';
      message = "PERFECT! 🎯 You nailed every question! Are you even human? 🤯🔥";
    } else if (percentage > 70) {
      lottieAsset = 'assets/animations/celeb.json';
      message = "Woohoo! 🎉 You're a quiz master! Keep flexing that big brain!";
    } else if (percentage >= 30) {
      lottieAsset = 'assets/animations/norm.json';
      message = "Not bad! 🤔 You're getting there. A little more practice and you'll ace it!";
    } else {
      lottieAsset = 'assets/animations/sad.json';
      message = "Oops! 😢 Looks like your brain needs a little warm-up. Try again!";
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2B223E), // ✅ Match theme background
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Lottie Animation
              Lottie.asset(lottieAsset, width: 180, height: 180),
              const SizedBox(height: 20),

              // ✅ Fun Message
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),

              // ✅ Score Display
              const Text(
                'Your Score',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                '$score / $totalQuestions',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // ✅ Buttons
              _buildButton(context, 'View Detailed Score', () {
                context.go('/detailed-score');
              }, const Color(0xFF2ECC71)), // 🟢 Green Progress

              _buildButton(context, 'View Questions', () {
                context.go('/review-questions');
              }, const Color(0xFF35284E)), // 🟣 Purple Button

              _buildButton(context, 'Start Over', () {
                ref.read(scoreProvider.notifier).state = 0;
                context.go('/');
              }, const Color(0xFFE74C3C)), // 🔴 Red Restart
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback onPressed, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          minimumSize: const Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
