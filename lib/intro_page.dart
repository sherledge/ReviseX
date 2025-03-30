import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart'; // ✅ Import Lottie

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool _isPressed = false; // ✅ Button press effect

  void _startQuiz(BuildContext context) {
    setState(() {
      _isPressed = true;
    });

    // ✅ Slight delay to simulate button press effect before navigating
    Future.delayed(const Duration(milliseconds: 150), () {
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B223E), // ✅ Matches theme
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(), // Push content towards the center

          SizedBox(
            width: 200, 
            height: 200,
            child: Lottie.asset('assets/animations/think.json'), // ✅ Animated emoji
          ),


          // ✅ Main title (fun heading)
          const Text(
            "Test Your Knowledge!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          // ✅ Fun short description
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Think you're a genius? Or just lucky? There's only one way to find out! \n\nGood luck! 🍀",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const Spacer(), // Push button to bottom

          // ✅ "Start Quiz" button with press effect
          SizedBox(
            width: 327,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isPressed
                    ? const Color(0xFF6F6C87) // ✅ Pressed color
                    : const Color(0xFF7A68FF), // ✅ Normal color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => _startQuiz(context),
              child: const Text(
                "Start Quiz",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, // ✅ Matches theme
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40), // Add space at the bottom
        ],
      ),
    );
  }
}
