import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart'; // ✅ Import Lottie
import 'loading_page.dart'; // ✅ Import QuizType

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B223E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
// ✅ Fun Lottie animation inside a circular frame
ClipOval(
  child: SizedBox(
    width: 180,
    height: 180,
    child: Lottie.asset('assets/animations/giraffe.json'),
  ),
),

            const SizedBox(height: 10),
        
            // ✅ Fun heading
            const Text(
              "Pick Your Quiz Mode! 🎯",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
        
            const SizedBox(height: 10),
        
        
        
            // ✅ Buttons with animations
            _buildButton(context, "Standard Quiz", QuizType.standard),
            _buildButton(context, "Custom Quiz", QuizType.custom),
            _buildButton(context, "AI Quiz", QuizType.ai),
        
            const SizedBox(height: 40), // Space at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, QuizType quizType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 260,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF7A68FF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          onPressed: () => _startQuiz(context, quizType),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  void _startQuiz(BuildContext context, QuizType quizType) {
    context.go('/loading', extra: quizType);
  }
}
