import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'providers.dart';

class ScorePage extends ConsumerWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scoreProvider);
    final totalQuestions = ref.watch(totalQuestionsProvider);

    double percentage = (score / totalQuestions) * 100;

    // ✅ Emoji and Message Based on Score Percentage
    String emojiPath;
    String message;

    if (percentage == 100) {
      emojiPath = 'assets/images/excellentemoji.png';
      message = "PERFECT! 🎯 You nailed every question! Are you even human? 🤯🔥";
    } else if (percentage > 70) {
      emojiPath = 'assets/images/bestemoji.png';
      message = "Woohoo! 🎉 You're a quiz master! Keep flexing that big brain!";
    } else if (percentage >= 30) {
      emojiPath = 'assets/images/goodemoji.png';
      message = "Not bad! 🤔 You're getting there. A little more practice and you'll ace it!";
    } else {
      emojiPath = 'assets/images/sademoji.png';
      message = "Oops! 😢 Looks like your brain needs a little warm-up. Try again!";
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2B223E), // ✅ Match theme background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ✅ Score Emoji
          Image.asset(
            emojiPath,
            width: 180,
            height: 180,
          ),
          const SizedBox(height: 20),

          // ✅ Fun Message
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 30),

          // ✅ Score Display
          Text(
            'Your Score',
            style: const TextStyle(fontSize: 24, color: Colors.white),
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
          _buildButton(context, 'View Detailed Score', () {
            context.go('/detailed-score');
          }, const Color(0xFF2ECC71)), // 🟢 Green Progress

          _buildButton(context, 'View Questions', () {
            context.go('/review-questions');
          }, const Color(0xFF35284E)), 
                    // ✅ Buttons with New Colors
          _buildButton(context, 'Start Over', () {
            ref.read(scoreProvider.notifier).state = 0;
            context.go('/');
          }, const Color(0xFFE74C3C)), // 🔴 Red Restart

        ],
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
