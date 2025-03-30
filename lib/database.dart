import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'tflite_model.dart'; // ✅ Make sure you created `tflite_model.dart` (from my previous response)
import 'providers.dart';

import 'tables.dart'; // ✅ Explicitly import the table file

part 'database.g.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});


@DriftDatabase(tables: [Quiz, SubjectScores]) 
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;




  Future<List<QuizData>> getRandomQuestions() async {
    List<String> subjects = [
      "Formal Languages And Automata Theory",
      "Database Management Systems",
      "Data Structures",
      "Computer Organization And Architecture",
      "Operating Systems",
    ];

    List<QuizData> selectedQuestions = [];

    for (var subject in subjects) {
      final questions = await (select(quiz)
            ..where((tbl) => tbl.subject.equals(subject))
            ..orderBy([(tbl) => OrderingTerm.desc(CustomExpression('RANDOM()'))]) // ✅ Correct way to use RANDOM()
            ..limit(10))
          .get();

      selectedQuestions.addAll(questions);
    }

    debugPrint('✅ Selected ${selectedQuestions.length} random questions.');

    return selectedQuestions;
  }



Future<List<QuizData>> generatePersonalizedQuiz(WidgetRef ref) async {
  debugPrint("🔄 Generating personalized quiz...");

  final subjectStats = ref.read(subjectPerformanceProvider);

  if (subjectStats.isEmpty) {
    debugPrint("⚠️ No subject performance data available. Falling back to random selection.");
    return getRandomQuestions();
  }

  // ✅ Convert subject performance into weakness scores
  List<double> weaknessScores = [
    1 - (subjectStats["Operating Systems"]?.correct ?? 0) / (subjectStats["Operating Systems"]?.total ?? 1),
    1 - (subjectStats["Data Structures"]?.correct ?? 0) / (subjectStats["Data Structures"]?.total ?? 1),
    1 - (subjectStats["Database Management Systems"]?.correct ?? 0) / (subjectStats["Database Management Systems"]?.total ?? 1),
    1 - (subjectStats["Computer Organization And Architecture"]?.correct ?? 0) / (subjectStats["Computer Organization And Architecture"]?.total ?? 1),
    1 - (subjectStats["Formal Languages And Automata Theory"]?.correct ?? 0) / (subjectStats["Formal Languages And Automata Theory"]?.total ?? 1),
  ];

  debugPrint("📊 Weakness Scores: $weaknessScores");

  // ✅ Load AI Model and Predict Question Allocation
  final tfliteModel = await TFLiteModel.create();
  List<int> questionAllocation = tfliteModel.predictQuizAllocation(weaknessScores);

  debugPrint("🎯 AI Predicted Question Allocation: $questionAllocation");

  // ✅ Fetch Questions based on AI output
  List<QuizData> personalizedQuiz = [];
  List<String> subjects = [
    "Operating Systems",
    "Data Structures",
    "Database Management Systems",
    "Computer Organization And Architecture",
    "Formal Languages And Automata Theory"
  ];

  for (int i = 0; i < subjects.length; i++) {
    debugPrint("📚 Fetching ${questionAllocation[i]} questions for ${subjects[i]}...");

    final questions = await (select(quiz)
          ..where((tbl) => tbl.subject.equals(subjects[i]))
          ..orderBy([(tbl) => OrderingTerm.desc(CustomExpression('RANDOM()'))])
          ..limit(questionAllocation[i]))
        .get();

    debugPrint("✅ Retrieved ${questions.length} questions for ${subjects[i]}");
    personalizedQuiz.addAll(questions);
  }

  debugPrint("✅ Total Personalized Questions: ${personalizedQuiz.length}");
  return personalizedQuiz;
}




// ✅ Get distinct subjects (for Custom Quiz Setup)
Future<List<String>> getSubjects() async {
  final query = await customSelect("SELECT DISTINCT subject FROM quiz").get();
  return query.map((row) => row.read<String>('subject')).toList();
}
Future<List<QuizData>> getCustomQuestions(List<String> subjects, int count) async {
  if (subjects.isEmpty || count <= 0) return [];

  int baseCount = count ~/ subjects.length; // Minimum questions per subject
  int extraCount = count % subjects.length; // Remaining questions to distribute

  List<QuizData> allQuestions = [];

  for (var subject in subjects) {
    final query = await (select(quiz)
          ..where((tbl) => tbl.subject.equals(subject))
          ..orderBy([(tbl) => OrderingTerm.desc(CustomExpression('RANDOM()'))])
          ..limit(baseCount + (extraCount > 0 ? 1 : 0))) // Give extra question if remaining
        .get();

    allQuestions.addAll(query);
    if (extraCount > 0) extraCount--; // Reduce extra question count
  }

  return allQuestions;
}




}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dbFolder.path, 'quiz.db');

    // 🛑 Delete any existing database before copying (to prevent Drift from creating a new one)
    if (await File(dbPath).exists()) {
      debugPrint("🗑 Deleting existing database...");
      await File(dbPath).delete();
    }

    // ✅ Copy the preloaded database from assets
    ByteData data = await rootBundle.load('assets/database/quiz.db');
    List<int> bytes = data.buffer.asUint8List();
    await File(dbPath).writeAsBytes(bytes);

    debugPrint("✅ Copied database to: $dbPath");

    return NativeDatabase(File(dbPath));
  });
}



