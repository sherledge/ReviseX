import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';

final scoreProvider = StateProvider<int>((ref) => 0); // ✅ Track score
final totalQuestionsProvider = StateProvider<int>((ref) => 0); // ✅ Track total questions
// ✅ Holds the list of quiz questions (Preloaded in LoadingPage)

final quizQuestionsProvider = Provider<List<QuizData>>((ref) {
  return ref.watch(quizQuestionsStateProvider);
});

final quizQuestionsStateProvider = StateProvider<List<QuizData>>((ref) => []);

// Tracks answered questions
class AnsweredQuestion {
  final String question;
  final String userAnswer;
  final String correctAnswer;

  AnsweredQuestion({required this.question, required this.userAnswer, required this.correctAnswer});
}

final answeredQuestionsProvider = StateProvider<List<AnsweredQuestion>>((ref) => []);

// Tracks subject performance
class SubjectStats {
  final int correct;
  final int total;

  SubjectStats({required this.correct, required this.total});
}

final subjectPerformanceProvider = StateProvider<Map<String, SubjectStats>>((ref) => {});
