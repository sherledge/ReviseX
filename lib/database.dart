import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tables.dart'; // ✅ Explicitly import the table file

part 'database.g.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// ✅ Include the correct table reference
@DriftDatabase(tables: [Quiz]) // ✅ Make sure "Quiz" matches the table class name
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



