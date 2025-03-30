// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $QuizTable extends Quiz with TableInfo<$QuizTable, QuizData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionAMeta =
      const VerificationMeta('optionA');
  @override
  late final GeneratedColumn<String> optionA = GeneratedColumn<String>(
      'option_a', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionBMeta =
      const VerificationMeta('optionB');
  @override
  late final GeneratedColumn<String> optionB = GeneratedColumn<String>(
      'option_b', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionCMeta =
      const VerificationMeta('optionC');
  @override
  late final GeneratedColumn<String> optionC = GeneratedColumn<String>(
      'option_c', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionDMeta =
      const VerificationMeta('optionD');
  @override
  late final GeneratedColumn<String> optionD = GeneratedColumn<String>(
      'option_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctAnswerMeta =
      const VerificationMeta('correctAnswer');
  @override
  late final GeneratedColumn<String> correctAnswer = GeneratedColumn<String>(
      'correct_answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timesAskedMeta =
      const VerificationMeta('timesAsked');
  @override
  late final GeneratedColumn<int> timesAsked = GeneratedColumn<int>(
      'times_asked', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        subject,
        question,
        optionA,
        optionB,
        optionC,
        optionD,
        correctAnswer,
        timesAsked
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quiz';
  @override
  VerificationContext validateIntegrity(Insertable<QuizData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('option_a')) {
      context.handle(_optionAMeta,
          optionA.isAcceptableOrUnknown(data['option_a']!, _optionAMeta));
    } else if (isInserting) {
      context.missing(_optionAMeta);
    }
    if (data.containsKey('option_b')) {
      context.handle(_optionBMeta,
          optionB.isAcceptableOrUnknown(data['option_b']!, _optionBMeta));
    } else if (isInserting) {
      context.missing(_optionBMeta);
    }
    if (data.containsKey('option_c')) {
      context.handle(_optionCMeta,
          optionC.isAcceptableOrUnknown(data['option_c']!, _optionCMeta));
    } else if (isInserting) {
      context.missing(_optionCMeta);
    }
    if (data.containsKey('option_d')) {
      context.handle(_optionDMeta,
          optionD.isAcceptableOrUnknown(data['option_d']!, _optionDMeta));
    } else if (isInserting) {
      context.missing(_optionDMeta);
    }
    if (data.containsKey('correct_answer')) {
      context.handle(
          _correctAnswerMeta,
          correctAnswer.isAcceptableOrUnknown(
              data['correct_answer']!, _correctAnswerMeta));
    } else if (isInserting) {
      context.missing(_correctAnswerMeta);
    }
    if (data.containsKey('times_asked')) {
      context.handle(
          _timesAskedMeta,
          timesAsked.isAcceptableOrUnknown(
              data['times_asked']!, _timesAskedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuizData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuizData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      optionA: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_a'])!,
      optionB: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_b'])!,
      optionC: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_c'])!,
      optionD: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_d'])!,
      correctAnswer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}correct_answer'])!,
      timesAsked: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}times_asked'])!,
    );
  }

  @override
  $QuizTable createAlias(String alias) {
    return $QuizTable(attachedDatabase, alias);
  }
}

class QuizData extends DataClass implements Insertable<QuizData> {
  final int id;
  final String subject;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String correctAnswer;
  final int timesAsked;
  const QuizData(
      {required this.id,
      required this.subject,
      required this.question,
      required this.optionA,
      required this.optionB,
      required this.optionC,
      required this.optionD,
      required this.correctAnswer,
      required this.timesAsked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject'] = Variable<String>(subject);
    map['question'] = Variable<String>(question);
    map['option_a'] = Variable<String>(optionA);
    map['option_b'] = Variable<String>(optionB);
    map['option_c'] = Variable<String>(optionC);
    map['option_d'] = Variable<String>(optionD);
    map['correct_answer'] = Variable<String>(correctAnswer);
    map['times_asked'] = Variable<int>(timesAsked);
    return map;
  }

  QuizCompanion toCompanion(bool nullToAbsent) {
    return QuizCompanion(
      id: Value(id),
      subject: Value(subject),
      question: Value(question),
      optionA: Value(optionA),
      optionB: Value(optionB),
      optionC: Value(optionC),
      optionD: Value(optionD),
      correctAnswer: Value(correctAnswer),
      timesAsked: Value(timesAsked),
    );
  }

  factory QuizData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuizData(
      id: serializer.fromJson<int>(json['id']),
      subject: serializer.fromJson<String>(json['subject']),
      question: serializer.fromJson<String>(json['question']),
      optionA: serializer.fromJson<String>(json['optionA']),
      optionB: serializer.fromJson<String>(json['optionB']),
      optionC: serializer.fromJson<String>(json['optionC']),
      optionD: serializer.fromJson<String>(json['optionD']),
      correctAnswer: serializer.fromJson<String>(json['correctAnswer']),
      timesAsked: serializer.fromJson<int>(json['timesAsked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subject': serializer.toJson<String>(subject),
      'question': serializer.toJson<String>(question),
      'optionA': serializer.toJson<String>(optionA),
      'optionB': serializer.toJson<String>(optionB),
      'optionC': serializer.toJson<String>(optionC),
      'optionD': serializer.toJson<String>(optionD),
      'correctAnswer': serializer.toJson<String>(correctAnswer),
      'timesAsked': serializer.toJson<int>(timesAsked),
    };
  }

  QuizData copyWith(
          {int? id,
          String? subject,
          String? question,
          String? optionA,
          String? optionB,
          String? optionC,
          String? optionD,
          String? correctAnswer,
          int? timesAsked}) =>
      QuizData(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        question: question ?? this.question,
        optionA: optionA ?? this.optionA,
        optionB: optionB ?? this.optionB,
        optionC: optionC ?? this.optionC,
        optionD: optionD ?? this.optionD,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        timesAsked: timesAsked ?? this.timesAsked,
      );
  QuizData copyWithCompanion(QuizCompanion data) {
    return QuizData(
      id: data.id.present ? data.id.value : this.id,
      subject: data.subject.present ? data.subject.value : this.subject,
      question: data.question.present ? data.question.value : this.question,
      optionA: data.optionA.present ? data.optionA.value : this.optionA,
      optionB: data.optionB.present ? data.optionB.value : this.optionB,
      optionC: data.optionC.present ? data.optionC.value : this.optionC,
      optionD: data.optionD.present ? data.optionD.value : this.optionD,
      correctAnswer: data.correctAnswer.present
          ? data.correctAnswer.value
          : this.correctAnswer,
      timesAsked:
          data.timesAsked.present ? data.timesAsked.value : this.timesAsked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuizData(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('question: $question, ')
          ..write('optionA: $optionA, ')
          ..write('optionB: $optionB, ')
          ..write('optionC: $optionC, ')
          ..write('optionD: $optionD, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('timesAsked: $timesAsked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subject, question, optionA, optionB,
      optionC, optionD, correctAnswer, timesAsked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuizData &&
          other.id == this.id &&
          other.subject == this.subject &&
          other.question == this.question &&
          other.optionA == this.optionA &&
          other.optionB == this.optionB &&
          other.optionC == this.optionC &&
          other.optionD == this.optionD &&
          other.correctAnswer == this.correctAnswer &&
          other.timesAsked == this.timesAsked);
}

class QuizCompanion extends UpdateCompanion<QuizData> {
  final Value<int> id;
  final Value<String> subject;
  final Value<String> question;
  final Value<String> optionA;
  final Value<String> optionB;
  final Value<String> optionC;
  final Value<String> optionD;
  final Value<String> correctAnswer;
  final Value<int> timesAsked;
  const QuizCompanion({
    this.id = const Value.absent(),
    this.subject = const Value.absent(),
    this.question = const Value.absent(),
    this.optionA = const Value.absent(),
    this.optionB = const Value.absent(),
    this.optionC = const Value.absent(),
    this.optionD = const Value.absent(),
    this.correctAnswer = const Value.absent(),
    this.timesAsked = const Value.absent(),
  });
  QuizCompanion.insert({
    this.id = const Value.absent(),
    required String subject,
    required String question,
    required String optionA,
    required String optionB,
    required String optionC,
    required String optionD,
    required String correctAnswer,
    this.timesAsked = const Value.absent(),
  })  : subject = Value(subject),
        question = Value(question),
        optionA = Value(optionA),
        optionB = Value(optionB),
        optionC = Value(optionC),
        optionD = Value(optionD),
        correctAnswer = Value(correctAnswer);
  static Insertable<QuizData> custom({
    Expression<int>? id,
    Expression<String>? subject,
    Expression<String>? question,
    Expression<String>? optionA,
    Expression<String>? optionB,
    Expression<String>? optionC,
    Expression<String>? optionD,
    Expression<String>? correctAnswer,
    Expression<int>? timesAsked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subject != null) 'subject': subject,
      if (question != null) 'question': question,
      if (optionA != null) 'option_a': optionA,
      if (optionB != null) 'option_b': optionB,
      if (optionC != null) 'option_c': optionC,
      if (optionD != null) 'option_d': optionD,
      if (correctAnswer != null) 'correct_answer': correctAnswer,
      if (timesAsked != null) 'times_asked': timesAsked,
    });
  }

  QuizCompanion copyWith(
      {Value<int>? id,
      Value<String>? subject,
      Value<String>? question,
      Value<String>? optionA,
      Value<String>? optionB,
      Value<String>? optionC,
      Value<String>? optionD,
      Value<String>? correctAnswer,
      Value<int>? timesAsked}) {
    return QuizCompanion(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      question: question ?? this.question,
      optionA: optionA ?? this.optionA,
      optionB: optionB ?? this.optionB,
      optionC: optionC ?? this.optionC,
      optionD: optionD ?? this.optionD,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      timesAsked: timesAsked ?? this.timesAsked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (optionA.present) {
      map['option_a'] = Variable<String>(optionA.value);
    }
    if (optionB.present) {
      map['option_b'] = Variable<String>(optionB.value);
    }
    if (optionC.present) {
      map['option_c'] = Variable<String>(optionC.value);
    }
    if (optionD.present) {
      map['option_d'] = Variable<String>(optionD.value);
    }
    if (correctAnswer.present) {
      map['correct_answer'] = Variable<String>(correctAnswer.value);
    }
    if (timesAsked.present) {
      map['times_asked'] = Variable<int>(timesAsked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizCompanion(')
          ..write('id: $id, ')
          ..write('subject: $subject, ')
          ..write('question: $question, ')
          ..write('optionA: $optionA, ')
          ..write('optionB: $optionB, ')
          ..write('optionC: $optionC, ')
          ..write('optionD: $optionD, ')
          ..write('correctAnswer: $correctAnswer, ')
          ..write('timesAsked: $timesAsked')
          ..write(')'))
        .toString();
  }
}

class $SubjectScoresTable extends SubjectScores
    with TableInfo<$SubjectScoresTable, SubjectScore> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _subjectMeta =
      const VerificationMeta('subject');
  @override
  late final GeneratedColumn<String> subject = GeneratedColumn<String>(
      'subject', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctMeta =
      const VerificationMeta('correct');
  @override
  late final GeneratedColumn<int> correct = GeneratedColumn<int>(
      'correct', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: Constant(0));
  @override
  List<GeneratedColumn> get $columns => [subject, correct, total];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subject_scores';
  @override
  VerificationContext validateIntegrity(Insertable<SubjectScore> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('subject')) {
      context.handle(_subjectMeta,
          subject.isAcceptableOrUnknown(data['subject']!, _subjectMeta));
    } else if (isInserting) {
      context.missing(_subjectMeta);
    }
    if (data.containsKey('correct')) {
      context.handle(_correctMeta,
          correct.isAcceptableOrUnknown(data['correct']!, _correctMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {subject};
  @override
  SubjectScore map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubjectScore(
      subject: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subject'])!,
      correct: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
    );
  }

  @override
  $SubjectScoresTable createAlias(String alias) {
    return $SubjectScoresTable(attachedDatabase, alias);
  }
}

class SubjectScore extends DataClass implements Insertable<SubjectScore> {
  final String subject;
  final int correct;
  final int total;
  const SubjectScore(
      {required this.subject, required this.correct, required this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['subject'] = Variable<String>(subject);
    map['correct'] = Variable<int>(correct);
    map['total'] = Variable<int>(total);
    return map;
  }

  SubjectScoresCompanion toCompanion(bool nullToAbsent) {
    return SubjectScoresCompanion(
      subject: Value(subject),
      correct: Value(correct),
      total: Value(total),
    );
  }

  factory SubjectScore.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubjectScore(
      subject: serializer.fromJson<String>(json['subject']),
      correct: serializer.fromJson<int>(json['correct']),
      total: serializer.fromJson<int>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'subject': serializer.toJson<String>(subject),
      'correct': serializer.toJson<int>(correct),
      'total': serializer.toJson<int>(total),
    };
  }

  SubjectScore copyWith({String? subject, int? correct, int? total}) =>
      SubjectScore(
        subject: subject ?? this.subject,
        correct: correct ?? this.correct,
        total: total ?? this.total,
      );
  SubjectScore copyWithCompanion(SubjectScoresCompanion data) {
    return SubjectScore(
      subject: data.subject.present ? data.subject.value : this.subject,
      correct: data.correct.present ? data.correct.value : this.correct,
      total: data.total.present ? data.total.value : this.total,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubjectScore(')
          ..write('subject: $subject, ')
          ..write('correct: $correct, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(subject, correct, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectScore &&
          other.subject == this.subject &&
          other.correct == this.correct &&
          other.total == this.total);
}

class SubjectScoresCompanion extends UpdateCompanion<SubjectScore> {
  final Value<String> subject;
  final Value<int> correct;
  final Value<int> total;
  final Value<int> rowid;
  const SubjectScoresCompanion({
    this.subject = const Value.absent(),
    this.correct = const Value.absent(),
    this.total = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SubjectScoresCompanion.insert({
    required String subject,
    this.correct = const Value.absent(),
    this.total = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : subject = Value(subject);
  static Insertable<SubjectScore> custom({
    Expression<String>? subject,
    Expression<int>? correct,
    Expression<int>? total,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (subject != null) 'subject': subject,
      if (correct != null) 'correct': correct,
      if (total != null) 'total': total,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SubjectScoresCompanion copyWith(
      {Value<String>? subject,
      Value<int>? correct,
      Value<int>? total,
      Value<int>? rowid}) {
    return SubjectScoresCompanion(
      subject: subject ?? this.subject,
      correct: correct ?? this.correct,
      total: total ?? this.total,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (subject.present) {
      map['subject'] = Variable<String>(subject.value);
    }
    if (correct.present) {
      map['correct'] = Variable<int>(correct.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectScoresCompanion(')
          ..write('subject: $subject, ')
          ..write('correct: $correct, ')
          ..write('total: $total, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $QuizTable quiz = $QuizTable(this);
  late final $SubjectScoresTable subjectScores = $SubjectScoresTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [quiz, subjectScores];
}

typedef $$QuizTableCreateCompanionBuilder = QuizCompanion Function({
  Value<int> id,
  required String subject,
  required String question,
  required String optionA,
  required String optionB,
  required String optionC,
  required String optionD,
  required String correctAnswer,
  Value<int> timesAsked,
});
typedef $$QuizTableUpdateCompanionBuilder = QuizCompanion Function({
  Value<int> id,
  Value<String> subject,
  Value<String> question,
  Value<String> optionA,
  Value<String> optionB,
  Value<String> optionC,
  Value<String> optionD,
  Value<String> correctAnswer,
  Value<int> timesAsked,
});

class $$QuizTableFilterComposer extends Composer<_$AppDatabase, $QuizTable> {
  $$QuizTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionA => $composableBuilder(
      column: $table.optionA, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionB => $composableBuilder(
      column: $table.optionB, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionC => $composableBuilder(
      column: $table.optionC, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionD => $composableBuilder(
      column: $table.optionD, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timesAsked => $composableBuilder(
      column: $table.timesAsked, builder: (column) => ColumnFilters(column));
}

class $$QuizTableOrderingComposer extends Composer<_$AppDatabase, $QuizTable> {
  $$QuizTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionA => $composableBuilder(
      column: $table.optionA, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionB => $composableBuilder(
      column: $table.optionB, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionC => $composableBuilder(
      column: $table.optionC, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionD => $composableBuilder(
      column: $table.optionD, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timesAsked => $composableBuilder(
      column: $table.timesAsked, builder: (column) => ColumnOrderings(column));
}

class $$QuizTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuizTable> {
  $$QuizTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get optionA =>
      $composableBuilder(column: $table.optionA, builder: (column) => column);

  GeneratedColumn<String> get optionB =>
      $composableBuilder(column: $table.optionB, builder: (column) => column);

  GeneratedColumn<String> get optionC =>
      $composableBuilder(column: $table.optionC, builder: (column) => column);

  GeneratedColumn<String> get optionD =>
      $composableBuilder(column: $table.optionD, builder: (column) => column);

  GeneratedColumn<String> get correctAnswer => $composableBuilder(
      column: $table.correctAnswer, builder: (column) => column);

  GeneratedColumn<int> get timesAsked => $composableBuilder(
      column: $table.timesAsked, builder: (column) => column);
}

class $$QuizTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuizTable,
    QuizData,
    $$QuizTableFilterComposer,
    $$QuizTableOrderingComposer,
    $$QuizTableAnnotationComposer,
    $$QuizTableCreateCompanionBuilder,
    $$QuizTableUpdateCompanionBuilder,
    (QuizData, BaseReferences<_$AppDatabase, $QuizTable, QuizData>),
    QuizData,
    PrefetchHooks Function()> {
  $$QuizTableTableManager(_$AppDatabase db, $QuizTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> subject = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> optionA = const Value.absent(),
            Value<String> optionB = const Value.absent(),
            Value<String> optionC = const Value.absent(),
            Value<String> optionD = const Value.absent(),
            Value<String> correctAnswer = const Value.absent(),
            Value<int> timesAsked = const Value.absent(),
          }) =>
              QuizCompanion(
            id: id,
            subject: subject,
            question: question,
            optionA: optionA,
            optionB: optionB,
            optionC: optionC,
            optionD: optionD,
            correctAnswer: correctAnswer,
            timesAsked: timesAsked,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String subject,
            required String question,
            required String optionA,
            required String optionB,
            required String optionC,
            required String optionD,
            required String correctAnswer,
            Value<int> timesAsked = const Value.absent(),
          }) =>
              QuizCompanion.insert(
            id: id,
            subject: subject,
            question: question,
            optionA: optionA,
            optionB: optionB,
            optionC: optionC,
            optionD: optionD,
            correctAnswer: correctAnswer,
            timesAsked: timesAsked,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$QuizTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuizTable,
    QuizData,
    $$QuizTableFilterComposer,
    $$QuizTableOrderingComposer,
    $$QuizTableAnnotationComposer,
    $$QuizTableCreateCompanionBuilder,
    $$QuizTableUpdateCompanionBuilder,
    (QuizData, BaseReferences<_$AppDatabase, $QuizTable, QuizData>),
    QuizData,
    PrefetchHooks Function()>;
typedef $$SubjectScoresTableCreateCompanionBuilder = SubjectScoresCompanion
    Function({
  required String subject,
  Value<int> correct,
  Value<int> total,
  Value<int> rowid,
});
typedef $$SubjectScoresTableUpdateCompanionBuilder = SubjectScoresCompanion
    Function({
  Value<String> subject,
  Value<int> correct,
  Value<int> total,
  Value<int> rowid,
});

class $$SubjectScoresTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectScoresTable> {
  $$SubjectScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correct => $composableBuilder(
      column: $table.correct, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnFilters(column));
}

class $$SubjectScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectScoresTable> {
  $$SubjectScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get subject => $composableBuilder(
      column: $table.subject, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correct => $composableBuilder(
      column: $table.correct, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get total => $composableBuilder(
      column: $table.total, builder: (column) => ColumnOrderings(column));
}

class $$SubjectScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectScoresTable> {
  $$SubjectScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get subject =>
      $composableBuilder(column: $table.subject, builder: (column) => column);

  GeneratedColumn<int> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);
}

class $$SubjectScoresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubjectScoresTable,
    SubjectScore,
    $$SubjectScoresTableFilterComposer,
    $$SubjectScoresTableOrderingComposer,
    $$SubjectScoresTableAnnotationComposer,
    $$SubjectScoresTableCreateCompanionBuilder,
    $$SubjectScoresTableUpdateCompanionBuilder,
    (
      SubjectScore,
      BaseReferences<_$AppDatabase, $SubjectScoresTable, SubjectScore>
    ),
    SubjectScore,
    PrefetchHooks Function()> {
  $$SubjectScoresTableTableManager(_$AppDatabase db, $SubjectScoresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> subject = const Value.absent(),
            Value<int> correct = const Value.absent(),
            Value<int> total = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SubjectScoresCompanion(
            subject: subject,
            correct: correct,
            total: total,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String subject,
            Value<int> correct = const Value.absent(),
            Value<int> total = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SubjectScoresCompanion.insert(
            subject: subject,
            correct: correct,
            total: total,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubjectScoresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubjectScoresTable,
    SubjectScore,
    $$SubjectScoresTableFilterComposer,
    $$SubjectScoresTableOrderingComposer,
    $$SubjectScoresTableAnnotationComposer,
    $$SubjectScoresTableCreateCompanionBuilder,
    $$SubjectScoresTableUpdateCompanionBuilder,
    (
      SubjectScore,
      BaseReferences<_$AppDatabase, $SubjectScoresTable, SubjectScore>
    ),
    SubjectScore,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$QuizTableTableManager get quiz => $$QuizTableTableManager(_db, _db.quiz);
  $$SubjectScoresTableTableManager get subjectScores =>
      $$SubjectScoresTableTableManager(_db, _db.subjectScores);
}
