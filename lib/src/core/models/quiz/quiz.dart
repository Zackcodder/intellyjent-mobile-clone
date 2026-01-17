import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required String id,
    required String user,
    required double score,
    required bool active,
    required Map<String, QuizCategory> questions,
    required List<String> categories,
    required String status,
    required int points,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class QuizCategory with _$QuizCategory {
  const factory QuizCategory({
    required List<QuizQuestion> easy,
    required List<QuizQuestion> moderate,
    required List<QuizQuestion> difficult,
  }) = _QuizCategory;

  factory QuizCategory.fromJson(Map<String, dynamic> json) =>
      _$QuizCategoryFromJson(json);
}

@freezed
class QuizQuestion with _$QuizQuestion {
  const factory QuizQuestion({
    required String id,
    @Default('') String question,
    @Default('') String option_1,
    @Default('') String option_2,
    @Default('') String option_3,
    @Default('') String option_4,
    required String date_created,
    required int served,
    @Default('') String answer,
    @Default('') String notes,
    @Default('') String note_image,
    required String difficulty,
  }) = _QuizQuestion;

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);
}

@freezed
class QuizResult with _$QuizResult {
  const factory QuizResult({
    required int score,
    required int questionsAnswered,
    required int correct,
    required int wrong,
    required int skipped,
  }) = _QuizResult;

  factory QuizResult.fromJson(Map<String, dynamic> json) =>
      _$QuizResultFromJson(json);
}
