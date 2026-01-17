// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {
  String get id => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  Map<String, QuizCategory> get questions => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res, Quiz>;
  @useResult
  $Res call(
      {String id,
      String user,
      double score,
      bool active,
      Map<String, QuizCategory> questions,
      List<String> categories,
      String status,
      int points});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res, $Val extends Quiz>
    implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? score = null,
    Object? active = null,
    Object? questions = null,
    Object? categories = null,
    Object? status = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as Map<String, QuizCategory>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(
          _$QuizImpl value, $Res Function(_$QuizImpl) then) =
      __$$QuizImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String user,
      double score,
      bool active,
      Map<String, QuizCategory> questions,
      List<String> categories,
      String status,
      int points});
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res>
    extends _$QuizCopyWithImpl<$Res, _$QuizImpl>
    implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? score = null,
    Object? active = null,
    Object? questions = null,
    Object? categories = null,
    Object? status = null,
    Object? points = null,
  }) {
    return _then(_$QuizImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as Map<String, QuizCategory>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizImpl implements _Quiz {
  const _$QuizImpl(
      {required this.id,
      required this.user,
      required this.score,
      required this.active,
      required final Map<String, QuizCategory> questions,
      required final List<String> categories,
      required this.status,
      required this.points})
      : _questions = questions,
        _categories = categories;

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizImplFromJson(json);

  @override
  final String id;
  @override
  final String user;
  @override
  final double score;
  @override
  final bool active;
  final Map<String, QuizCategory> _questions;
  @override
  Map<String, QuizCategory> get questions {
    if (_questions is EqualUnmodifiableMapView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_questions);
  }

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String status;
  @override
  final int points;

  @override
  String toString() {
    return 'Quiz(id: $id, user: $user, score: $score, active: $active, questions: $questions, categories: $categories, status: $status, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      score,
      active,
      const DeepCollectionEquality().hash(_questions),
      const DeepCollectionEquality().hash(_categories),
      status,
      points);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizImplToJson(
      this,
    );
  }
}

abstract class _Quiz implements Quiz {
  const factory _Quiz(
      {required final String id,
      required final String user,
      required final double score,
      required final bool active,
      required final Map<String, QuizCategory> questions,
      required final List<String> categories,
      required final String status,
      required final int points}) = _$QuizImpl;

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

  @override
  String get id;
  @override
  String get user;
  @override
  double get score;
  @override
  bool get active;
  @override
  Map<String, QuizCategory> get questions;
  @override
  List<String> get categories;
  @override
  String get status;
  @override
  int get points;
  @override
  @JsonKey(ignore: true)
  _$$QuizImplCopyWith<_$QuizImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizCategory _$QuizCategoryFromJson(Map<String, dynamic> json) {
  return _QuizCategory.fromJson(json);
}

/// @nodoc
mixin _$QuizCategory {
  List<QuizQuestion> get easy => throw _privateConstructorUsedError;
  List<QuizQuestion> get moderate => throw _privateConstructorUsedError;
  List<QuizQuestion> get difficult => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCategoryCopyWith<QuizCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCategoryCopyWith<$Res> {
  factory $QuizCategoryCopyWith(
          QuizCategory value, $Res Function(QuizCategory) then) =
      _$QuizCategoryCopyWithImpl<$Res, QuizCategory>;
  @useResult
  $Res call(
      {List<QuizQuestion> easy,
      List<QuizQuestion> moderate,
      List<QuizQuestion> difficult});
}

/// @nodoc
class _$QuizCategoryCopyWithImpl<$Res, $Val extends QuizCategory>
    implements $QuizCategoryCopyWith<$Res> {
  _$QuizCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? easy = null,
    Object? moderate = null,
    Object? difficult = null,
  }) {
    return _then(_value.copyWith(
      easy: null == easy
          ? _value.easy
          : easy // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      moderate: null == moderate
          ? _value.moderate
          : moderate // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      difficult: null == difficult
          ? _value.difficult
          : difficult // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizCategoryImplCopyWith<$Res>
    implements $QuizCategoryCopyWith<$Res> {
  factory _$$QuizCategoryImplCopyWith(
          _$QuizCategoryImpl value, $Res Function(_$QuizCategoryImpl) then) =
      __$$QuizCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<QuizQuestion> easy,
      List<QuizQuestion> moderate,
      List<QuizQuestion> difficult});
}

/// @nodoc
class __$$QuizCategoryImplCopyWithImpl<$Res>
    extends _$QuizCategoryCopyWithImpl<$Res, _$QuizCategoryImpl>
    implements _$$QuizCategoryImplCopyWith<$Res> {
  __$$QuizCategoryImplCopyWithImpl(
      _$QuizCategoryImpl _value, $Res Function(_$QuizCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? easy = null,
    Object? moderate = null,
    Object? difficult = null,
  }) {
    return _then(_$QuizCategoryImpl(
      easy: null == easy
          ? _value._easy
          : easy // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      moderate: null == moderate
          ? _value._moderate
          : moderate // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
      difficult: null == difficult
          ? _value._difficult
          : difficult // ignore: cast_nullable_to_non_nullable
              as List<QuizQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizCategoryImpl implements _QuizCategory {
  const _$QuizCategoryImpl(
      {required final List<QuizQuestion> easy,
      required final List<QuizQuestion> moderate,
      required final List<QuizQuestion> difficult})
      : _easy = easy,
        _moderate = moderate,
        _difficult = difficult;

  factory _$QuizCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizCategoryImplFromJson(json);

  final List<QuizQuestion> _easy;
  @override
  List<QuizQuestion> get easy {
    if (_easy is EqualUnmodifiableListView) return _easy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_easy);
  }

  final List<QuizQuestion> _moderate;
  @override
  List<QuizQuestion> get moderate {
    if (_moderate is EqualUnmodifiableListView) return _moderate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moderate);
  }

  final List<QuizQuestion> _difficult;
  @override
  List<QuizQuestion> get difficult {
    if (_difficult is EqualUnmodifiableListView) return _difficult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_difficult);
  }

  @override
  String toString() {
    return 'QuizCategory(easy: $easy, moderate: $moderate, difficult: $difficult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizCategoryImpl &&
            const DeepCollectionEquality().equals(other._easy, _easy) &&
            const DeepCollectionEquality().equals(other._moderate, _moderate) &&
            const DeepCollectionEquality()
                .equals(other._difficult, _difficult));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_easy),
      const DeepCollectionEquality().hash(_moderate),
      const DeepCollectionEquality().hash(_difficult));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizCategoryImplCopyWith<_$QuizCategoryImpl> get copyWith =>
      __$$QuizCategoryImplCopyWithImpl<_$QuizCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizCategoryImplToJson(
      this,
    );
  }
}

abstract class _QuizCategory implements QuizCategory {
  const factory _QuizCategory(
      {required final List<QuizQuestion> easy,
      required final List<QuizQuestion> moderate,
      required final List<QuizQuestion> difficult}) = _$QuizCategoryImpl;

  factory _QuizCategory.fromJson(Map<String, dynamic> json) =
      _$QuizCategoryImpl.fromJson;

  @override
  List<QuizQuestion> get easy;
  @override
  List<QuizQuestion> get moderate;
  @override
  List<QuizQuestion> get difficult;
  @override
  @JsonKey(ignore: true)
  _$$QuizCategoryImplCopyWith<_$QuizCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get option_1 => throw _privateConstructorUsedError;
  String get option_2 => throw _privateConstructorUsedError;
  String get option_3 => throw _privateConstructorUsedError;
  String get option_4 => throw _privateConstructorUsedError;
  String get date_created => throw _privateConstructorUsedError;
  int get served => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  String get note_image => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) then) =
      _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call(
      {String id,
      String question,
      String option_1,
      String option_2,
      String option_3,
      String option_4,
      String date_created,
      int served,
      String answer,
      String notes,
      String note_image,
      String difficulty});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? option_1 = null,
    Object? option_2 = null,
    Object? option_3 = null,
    Object? option_4 = null,
    Object? date_created = null,
    Object? served = null,
    Object? answer = null,
    Object? notes = null,
    Object? note_image = null,
    Object? difficulty = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      option_1: null == option_1
          ? _value.option_1
          : option_1 // ignore: cast_nullable_to_non_nullable
              as String,
      option_2: null == option_2
          ? _value.option_2
          : option_2 // ignore: cast_nullable_to_non_nullable
              as String,
      option_3: null == option_3
          ? _value.option_3
          : option_3 // ignore: cast_nullable_to_non_nullable
              as String,
      option_4: null == option_4
          ? _value.option_4
          : option_4 // ignore: cast_nullable_to_non_nullable
              as String,
      date_created: null == date_created
          ? _value.date_created
          : date_created // ignore: cast_nullable_to_non_nullable
              as String,
      served: null == served
          ? _value.served
          : served // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      note_image: null == note_image
          ? _value.note_image
          : note_image // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizQuestionImplCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$QuizQuestionImplCopyWith(
          _$QuizQuestionImpl value, $Res Function(_$QuizQuestionImpl) then) =
      __$$QuizQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      String option_1,
      String option_2,
      String option_3,
      String option_4,
      String date_created,
      int served,
      String answer,
      String notes,
      String note_image,
      String difficulty});
}

/// @nodoc
class __$$QuizQuestionImplCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$QuizQuestionImpl>
    implements _$$QuizQuestionImplCopyWith<$Res> {
  __$$QuizQuestionImplCopyWithImpl(
      _$QuizQuestionImpl _value, $Res Function(_$QuizQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? option_1 = null,
    Object? option_2 = null,
    Object? option_3 = null,
    Object? option_4 = null,
    Object? date_created = null,
    Object? served = null,
    Object? answer = null,
    Object? notes = null,
    Object? note_image = null,
    Object? difficulty = null,
  }) {
    return _then(_$QuizQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      option_1: null == option_1
          ? _value.option_1
          : option_1 // ignore: cast_nullable_to_non_nullable
              as String,
      option_2: null == option_2
          ? _value.option_2
          : option_2 // ignore: cast_nullable_to_non_nullable
              as String,
      option_3: null == option_3
          ? _value.option_3
          : option_3 // ignore: cast_nullable_to_non_nullable
              as String,
      option_4: null == option_4
          ? _value.option_4
          : option_4 // ignore: cast_nullable_to_non_nullable
              as String,
      date_created: null == date_created
          ? _value.date_created
          : date_created // ignore: cast_nullable_to_non_nullable
              as String,
      served: null == served
          ? _value.served
          : served // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      note_image: null == note_image
          ? _value.note_image
          : note_image // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionImpl implements _QuizQuestion {
  const _$QuizQuestionImpl(
      {required this.id,
      this.question = '',
      this.option_1 = '',
      this.option_2 = '',
      this.option_3 = '',
      this.option_4 = '',
      required this.date_created,
      required this.served,
      this.answer = '',
      this.notes = '',
      this.note_image = '',
      required this.difficulty});

  factory _$QuizQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String question;
  @override
  @JsonKey()
  final String option_1;
  @override
  @JsonKey()
  final String option_2;
  @override
  @JsonKey()
  final String option_3;
  @override
  @JsonKey()
  final String option_4;
  @override
  final String date_created;
  @override
  final int served;
  @override
  @JsonKey()
  final String answer;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final String note_image;
  @override
  final String difficulty;

  @override
  String toString() {
    return 'QuizQuestion(id: $id, question: $question, option_1: $option_1, option_2: $option_2, option_3: $option_3, option_4: $option_4, date_created: $date_created, served: $served, answer: $answer, notes: $notes, note_image: $note_image, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.option_1, option_1) ||
                other.option_1 == option_1) &&
            (identical(other.option_2, option_2) ||
                other.option_2 == option_2) &&
            (identical(other.option_3, option_3) ||
                other.option_3 == option_3) &&
            (identical(other.option_4, option_4) ||
                other.option_4 == option_4) &&
            (identical(other.date_created, date_created) ||
                other.date_created == date_created) &&
            (identical(other.served, served) || other.served == served) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.note_image, note_image) ||
                other.note_image == note_image) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      option_1,
      option_2,
      option_3,
      option_4,
      date_created,
      served,
      answer,
      notes,
      note_image,
      difficulty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      __$$QuizQuestionImplCopyWithImpl<_$QuizQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionImplToJson(
      this,
    );
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  const factory _QuizQuestion(
      {required final String id,
      final String question,
      final String option_1,
      final String option_2,
      final String option_3,
      final String option_4,
      required final String date_created,
      required final int served,
      final String answer,
      final String notes,
      final String note_image,
      required final String difficulty}) = _$QuizQuestionImpl;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  String get option_1;
  @override
  String get option_2;
  @override
  String get option_3;
  @override
  String get option_4;
  @override
  String get date_created;
  @override
  int get served;
  @override
  String get answer;
  @override
  String get notes;
  @override
  String get note_image;
  @override
  String get difficulty;
  @override
  @JsonKey(ignore: true)
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizResult _$QuizResultFromJson(Map<String, dynamic> json) {
  return _QuizResult.fromJson(json);
}

/// @nodoc
mixin _$QuizResult {
  int get score => throw _privateConstructorUsedError;
  int get questionsAnswered => throw _privateConstructorUsedError;
  int get correct => throw _privateConstructorUsedError;
  int get wrong => throw _privateConstructorUsedError;
  int get skipped => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizResultCopyWith<QuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultCopyWith<$Res> {
  factory $QuizResultCopyWith(
          QuizResult value, $Res Function(QuizResult) then) =
      _$QuizResultCopyWithImpl<$Res, QuizResult>;
  @useResult
  $Res call(
      {int score, int questionsAnswered, int correct, int wrong, int skipped});
}

/// @nodoc
class _$QuizResultCopyWithImpl<$Res, $Val extends QuizResult>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? questionsAnswered = null,
    Object? correct = null,
    Object? wrong = null,
    Object? skipped = null,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      questionsAnswered: null == questionsAnswered
          ? _value.questionsAnswered
          : questionsAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      wrong: null == wrong
          ? _value.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as int,
      skipped: null == skipped
          ? _value.skipped
          : skipped // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizResultImplCopyWith<$Res>
    implements $QuizResultCopyWith<$Res> {
  factory _$$QuizResultImplCopyWith(
          _$QuizResultImpl value, $Res Function(_$QuizResultImpl) then) =
      __$$QuizResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int score, int questionsAnswered, int correct, int wrong, int skipped});
}

/// @nodoc
class __$$QuizResultImplCopyWithImpl<$Res>
    extends _$QuizResultCopyWithImpl<$Res, _$QuizResultImpl>
    implements _$$QuizResultImplCopyWith<$Res> {
  __$$QuizResultImplCopyWithImpl(
      _$QuizResultImpl _value, $Res Function(_$QuizResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? questionsAnswered = null,
    Object? correct = null,
    Object? wrong = null,
    Object? skipped = null,
  }) {
    return _then(_$QuizResultImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      questionsAnswered: null == questionsAnswered
          ? _value.questionsAnswered
          : questionsAnswered // ignore: cast_nullable_to_non_nullable
              as int,
      correct: null == correct
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      wrong: null == wrong
          ? _value.wrong
          : wrong // ignore: cast_nullable_to_non_nullable
              as int,
      skipped: null == skipped
          ? _value.skipped
          : skipped // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultImpl implements _QuizResult {
  const _$QuizResultImpl(
      {required this.score,
      required this.questionsAnswered,
      required this.correct,
      required this.wrong,
      required this.skipped});

  factory _$QuizResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultImplFromJson(json);

  @override
  final int score;
  @override
  final int questionsAnswered;
  @override
  final int correct;
  @override
  final int wrong;
  @override
  final int skipped;

  @override
  String toString() {
    return 'QuizResult(score: $score, questionsAnswered: $questionsAnswered, correct: $correct, wrong: $wrong, skipped: $skipped)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.questionsAnswered, questionsAnswered) ||
                other.questionsAnswered == questionsAnswered) &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.wrong, wrong) || other.wrong == wrong) &&
            (identical(other.skipped, skipped) || other.skipped == skipped));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, score, questionsAnswered, correct, wrong, skipped);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultImplCopyWith<_$QuizResultImpl> get copyWith =>
      __$$QuizResultImplCopyWithImpl<_$QuizResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultImplToJson(
      this,
    );
  }
}

abstract class _QuizResult implements QuizResult {
  const factory _QuizResult(
      {required final int score,
      required final int questionsAnswered,
      required final int correct,
      required final int wrong,
      required final int skipped}) = _$QuizResultImpl;

  factory _QuizResult.fromJson(Map<String, dynamic> json) =
      _$QuizResultImpl.fromJson;

  @override
  int get score;
  @override
  int get questionsAnswered;
  @override
  int get correct;
  @override
  int get wrong;
  @override
  int get skipped;
  @override
  @JsonKey(ignore: true)
  _$$QuizResultImplCopyWith<_$QuizResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
