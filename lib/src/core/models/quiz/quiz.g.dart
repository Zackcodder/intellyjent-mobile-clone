// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizImpl _$$QuizImplFromJson(Map<String, dynamic> json) => _$QuizImpl(
      id: json['id'] as String,
      user: json['user'] as String,
      score: (json['score'] as num).toDouble(),
      active: json['active'] as bool,
      questions: (json['questions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, QuizCategory.fromJson(e as Map<String, dynamic>)),
      ),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: json['status'] as String,
      points: json['points'] as int,
    );

Map<String, dynamic> _$$QuizImplToJson(_$QuizImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'score': instance.score,
      'active': instance.active,
      'questions': instance.questions,
      'categories': instance.categories,
      'status': instance.status,
      'points': instance.points,
    };

_$QuizCategoryImpl _$$QuizCategoryImplFromJson(Map<String, dynamic> json) =>
    _$QuizCategoryImpl(
      easy: (json['easy'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      moderate: (json['moderate'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      difficult: (json['difficult'] as List<dynamic>)
          .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizCategoryImplToJson(_$QuizCategoryImpl instance) =>
    <String, dynamic>{
      'easy': instance.easy,
      'moderate': instance.moderate,
      'difficult': instance.difficult,
    };

_$QuizQuestionImpl _$$QuizQuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuizQuestionImpl(
      id: json['id'] as String,
      question: json['question'] as String? ?? '',
      option_1: json['option_1'] as String? ?? '',
      option_2: json['option_2'] as String? ?? '',
      option_3: json['option_3'] as String? ?? '',
      option_4: json['option_4'] as String? ?? '',
      date_created: json['date_created'] as String,
      served: json['served'] as int,
      answer: json['answer'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      note_image: json['note_image'] as String? ?? '',
      difficulty: json['difficulty'] as String,
    );

Map<String, dynamic> _$$QuizQuestionImplToJson(_$QuizQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'option_1': instance.option_1,
      'option_2': instance.option_2,
      'option_3': instance.option_3,
      'option_4': instance.option_4,
      'date_created': instance.date_created,
      'served': instance.served,
      'answer': instance.answer,
      'notes': instance.notes,
      'note_image': instance.note_image,
      'difficulty': instance.difficulty,
    };

_$QuizResultImpl _$$QuizResultImplFromJson(Map<String, dynamic> json) =>
    _$QuizResultImpl(
      score: json['score'] as int,
      questionsAnswered: json['questionsAnswered'] as int,
      correct: json['correct'] as int,
      wrong: json['wrong'] as int,
      skipped: json['skipped'] as int,
    );

Map<String, dynamic> _$$QuizResultImplToJson(_$QuizResultImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'questionsAnswered': instance.questionsAnswered,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'skipped': instance.skipped,
    };
