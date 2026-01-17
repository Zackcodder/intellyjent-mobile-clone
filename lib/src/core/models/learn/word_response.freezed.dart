// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WordResponse _$WordResponseFromJson(Map<String, dynamic> json) {
  return _WordResponse.fromJson(json);
}

/// @nodoc
mixin _$WordResponse {
  List<WordData> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordResponseCopyWith<WordResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordResponseCopyWith<$Res> {
  factory $WordResponseCopyWith(
          WordResponse value, $Res Function(WordResponse) then) =
      _$WordResponseCopyWithImpl<$Res, WordResponse>;
  @useResult
  $Res call({List<WordData> results});
}

/// @nodoc
class _$WordResponseCopyWithImpl<$Res, $Val extends WordResponse>
    implements $WordResponseCopyWith<$Res> {
  _$WordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<WordData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordResponseImplCopyWith<$Res>
    implements $WordResponseCopyWith<$Res> {
  factory _$$WordResponseImplCopyWith(
          _$WordResponseImpl value, $Res Function(_$WordResponseImpl) then) =
      __$$WordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WordData> results});
}

/// @nodoc
class __$$WordResponseImplCopyWithImpl<$Res>
    extends _$WordResponseCopyWithImpl<$Res, _$WordResponseImpl>
    implements _$$WordResponseImplCopyWith<$Res> {
  __$$WordResponseImplCopyWithImpl(
      _$WordResponseImpl _value, $Res Function(_$WordResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$WordResponseImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<WordData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordResponseImpl implements _WordResponse {
  const _$WordResponseImpl({required final List<WordData> results})
      : _results = results;

  factory _$WordResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordResponseImplFromJson(json);

  final List<WordData> _results;
  @override
  List<WordData> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'WordResponse(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordResponseImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordResponseImplCopyWith<_$WordResponseImpl> get copyWith =>
      __$$WordResponseImplCopyWithImpl<_$WordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordResponseImplToJson(
      this,
    );
  }
}

abstract class _WordResponse implements WordResponse {
  const factory _WordResponse({required final List<WordData> results}) =
      _$WordResponseImpl;

  factory _WordResponse.fromJson(Map<String, dynamic> json) =
      _$WordResponseImpl.fromJson;

  @override
  List<WordData> get results;
  @override
  @JsonKey(ignore: true)
  _$$WordResponseImplCopyWith<_$WordResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordData _$WordDataFromJson(Map<String, dynamic> json) {
  return _WordData.fromJson(json);
}

/// @nodoc
mixin _$WordData {
  String get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordDataCopyWith<WordData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordDataCopyWith<$Res> {
  factory $WordDataCopyWith(WordData value, $Res Function(WordData) then) =
      _$WordDataCopyWithImpl<$Res, WordData>;
  @useResult
  $Res call({String id, String word, String meaning});
}

/// @nodoc
class _$WordDataCopyWithImpl<$Res, $Val extends WordData>
    implements $WordDataCopyWith<$Res> {
  _$WordDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordDataImplCopyWith<$Res>
    implements $WordDataCopyWith<$Res> {
  factory _$$WordDataImplCopyWith(
          _$WordDataImpl value, $Res Function(_$WordDataImpl) then) =
      __$$WordDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String word, String meaning});
}

/// @nodoc
class __$$WordDataImplCopyWithImpl<$Res>
    extends _$WordDataCopyWithImpl<$Res, _$WordDataImpl>
    implements _$$WordDataImplCopyWith<$Res> {
  __$$WordDataImplCopyWithImpl(
      _$WordDataImpl _value, $Res Function(_$WordDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(_$WordDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordDataImpl implements _WordData {
  const _$WordDataImpl(
      {required this.id, required this.word, required this.meaning});

  factory _$WordDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordDataImplFromJson(json);

  @override
  final String id;
  @override
  final String word;
  @override
  final String meaning;

  @override
  String toString() {
    return 'WordData(id: $id, word: $word, meaning: $meaning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, word, meaning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordDataImplCopyWith<_$WordDataImpl> get copyWith =>
      __$$WordDataImplCopyWithImpl<_$WordDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordDataImplToJson(
      this,
    );
  }
}

abstract class _WordData implements WordData {
  const factory _WordData(
      {required final String id,
      required final String word,
      required final String meaning}) = _$WordDataImpl;

  factory _WordData.fromJson(Map<String, dynamic> json) =
      _$WordDataImpl.fromJson;

  @override
  String get id;
  @override
  String get word;
  @override
  String get meaning;
  @override
  @JsonKey(ignore: true)
  _$$WordDataImplCopyWith<_$WordDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
