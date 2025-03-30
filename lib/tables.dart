import 'package:drift/drift.dart';


class Quiz extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get subject => text()();
  TextColumn get question => text()();
  TextColumn get optionA => text().named('option_a')();
  TextColumn get optionB => text().named('option_b')();
  TextColumn get optionC => text().named('option_c')();
  TextColumn get optionD => text().named('option_d')();
  TextColumn get correctAnswer => text().named('correct_answer')();
  IntColumn get timesAsked => integer().named('times_asked').withDefault(Constant(0))();
}

@DataClassName("SubjectScore")
class SubjectScores extends Table {
  TextColumn get subject => text()();
  IntColumn get correct => integer().withDefault(Constant(0))();
  IntColumn get total => integer().withDefault(Constant(0))();
  
  @override
  Set<Column> get primaryKey => {subject};
}
