import 'package:drift/drift.dart';

class Quiz extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get subject => text()();
  TextColumn get question => text()();
  TextColumn get optionA => text().named('option_a')(); // ✅ Match SQLite name
  TextColumn get optionB => text().named('option_b')(); // ✅ Match SQLite name
  TextColumn get optionC => text().named('option_c')(); // ✅ Match SQLite name
  TextColumn get optionD => text().named('option_d')(); // ✅ Match SQLite name
  TextColumn get correctAnswer => text().named('correct_answer')(); // ✅ Match SQLite name
  IntColumn get timesAsked => integer().named('times_asked').withDefault(const Constant(0))(); // ✅ Match SQLite name
}

