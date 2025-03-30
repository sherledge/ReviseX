import 'package:ReviseX/custom_quiz_setup.dart';
import 'package:ReviseX/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ReviseX/intro_page.dart';
import 'package:ReviseX/loading_page.dart'; // ✅ New loading page
import 'package:ReviseX/quiz_page.dart';
import 'package:ReviseX/score_page.dart';
import 'package:ReviseX/review_questions_page.dart'; // ✅ New Review Questions Page
import 'package:ReviseX/detailed_score_page.dart'; // ✅ New Detailed Score Page
import 'theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, // ✅ Hides the debug banner
      title: 'Quiz App',
      theme: AppTheme.themeData,
      routerConfig: _router,
    );
  }
}

// ✅ Custom Fade Transition for smooth navigation
CustomTransitionPage _fadeTransition(Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

// ✅ Updated GoRouter with all screens
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => _fadeTransition(const IntroPage()),
    ),
    GoRoute(
      path: '/loading',
      builder: (context, state) {
        final quizType = state.extra as QuizType;
        return LoadingPage(quizType: quizType);
      },
    ),
    GoRoute(
      path: '/quiz',
      pageBuilder: (context, state) => _fadeTransition(const QuizPage()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => _fadeTransition(const HomePage()),
    ),
    GoRoute(
      path: '/score',
      pageBuilder: (context, state) => _fadeTransition(const ScorePage()),
    ),
    GoRoute(
      path: '/review-questions',
      pageBuilder: (context, state) =>
          _fadeTransition(const ReviewQuestionsPage()),
    ),
    GoRoute(
      path: '/detailed-score',
      pageBuilder: (context, state) =>
          _fadeTransition(const DetailedScorePage()),
    ),
        GoRoute(
      path: '/custom_quiz_setup',
      pageBuilder: (context, state) =>
          _fadeTransition(const CustomQuizSetupPage()),
    ),
  ],
);
