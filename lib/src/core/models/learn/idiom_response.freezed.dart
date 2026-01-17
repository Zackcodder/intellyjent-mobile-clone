// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'idiom_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IdiomResponse _$IdiomResponseFromJson(Map<String, dynamic> json) {
  return _IdiomResponse.fromJson(json);
}

/// @nodoc
mixin _$IdiomResponse {
  List<IdiomData> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdiomResponseCopyWith<IdiomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdiomResponseCopyWith<$Res> {
  factory $IdiomResponseCopyWith(
          IdiomResponse value, $Res Function(IdiomResponse) then) =
      _$IdiomResponseCopyWithImpl<$Res, IdiomResponse>;
  @useResult
  $Res call({List<IdiomData> results});
}

/// @nodoc
class _$IdiomResponseCopyWithImpl<$Res, $Val extends IdiomResponse>
    implements $IdiomResponseCopyWith<$Res> {
  _$IdiomResponseCopyWithImpl(this._value, this._then);

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
              as List<IdiomData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdiomResponseImplCopyWith<$Res>
    implements $IdiomResponseCopyWith<$Res> {
  factory _$$IdiomResponseImplCopyWith(
          _$IdiomResponseImpl value, $Res Function(_$IdiomResponseImpl) then) =
      __$$IdiomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<IdiomData> results});
}

/// @nodoc
class __$$IdiomResponseImplCopyWithImpl<$Res>
    extends _$IdiomResponseCopyWithImpl<$Res, _$IdiomResponseImpl>
    implements _$$IdiomResponseImplCopyWith<$Res> {
  __$$IdiomResponseImplCopyWithImpl(
      _$IdiomResponseImpl _value, $Res Function(_$IdiomResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
  }) {
    return _then(_$IdiomResponseImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<IdiomData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IdiomResponseImpl implements _IdiomResponse {
  const _$IdiomResponseImpl({required final List<IdiomData> results})
      : _results = results;

  factory _$IdiomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdiomResponseImplFromJson(json);

  final List<IdiomData> _results;
  @override
  List<IdiomData> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'IdiomResponse(results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdiomResponseImpl &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdiomResponseImplCopyWith<_$IdiomResponseImpl> get copyWith =>
      __$$IdiomResponseImplCopyWithImpl<_$IdiomResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdiomResponseImplToJson(
      this,
    );
  }
}

abstract class _IdiomResponse implements IdiomResponse {
  const factory _IdiomResponse({required final List<IdiomData> results}) =
      _$IdiomResponseImpl;

  factory _IdiomResponse.fromJson(Map<String, dynamic> json) =
      _$IdiomResponseImpl.fromJson;

  @override
  List<IdiomData> get results;
  @override
  @JsonKey(ignore: true)
  _$$IdiomResponseImplCopyWith<_$IdiomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IdiomData _$IdiomDataFromJson(Map<String, dynamic> json) {
  return _IdiomData.fromJson(json);
}

/// @nodoc
mixin _$IdiomData {
  String get idiom => throw _privateConstructorUsedError;
  String get meaning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IdiomDataCopyWith<IdiomData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdiomDataCopyWith<$Res> {
  factory $IdiomDataCopyWith(IdiomData value, $Res Function(IdiomData) then) =
      _$IdiomDataCopyWithImpl<$Res, IdiomData>;
  @useResult
  $Res call({String idiom, String meaning});
}

/// @nodoc
class _$IdiomDataCopyWithImpl<$Res, $Val extends IdiomData>
    implements $IdiomDataCopyWith<$Res> {
  _$IdiomDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idiom = null,
    Object? meaning = null,
  }) {
    return _then(_value.copyWith(
      idiom: null == idiom
          ? _value.idiom
          : idiom // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdiomDataImplCopyWith<$Res>
    implements $IdiomDataCopyWith<$Res> {
  factory _$$IdiomDataImplCopyWith(
          _$IdiomDataImpl value, $Res Function(_$IdiomDataImpl) then) =
      __$$IdiomDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idiom, String meaning});
}

/// @nodoc
class __$$IdiomDataImplCopyWithImpl<$Res>
    extends _$IdiomDataCopyWithImpl<$Res, _$IdiomDataImpl>
    implements _$$IdiomDataImplCopyWith<$Res> {
  __$$IdiomDataImplCopyWithImpl(
      _$IdiomDataImpl _value, $Res Function(_$IdiomDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idiom = null,
    Object? meaning = null,
  }) {
    return _then(_$IdiomDataImpl(
      idiom: null == idiom
          ? _value.idiom
          : idiom // ignore: cast_nullable_to_non_nullable
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
class _$IdiomDataImpl implements _IdiomData {
  const _$IdiomDataImpl({required this.idiom, required this.meaning});

  factory _$IdiomDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$IdiomDataImplFromJson(json);

  @override
  final String idiom;
  @override
  final String meaning;

  @override
  String toString() {
    return 'IdiomData(idiom: $idiom, meaning: $meaning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdiomDataImpl &&
            (identical(other.idiom, idiom) || other.idiom == idiom) &&
            (identical(other.meaning, meaning) || other.meaning == meaning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idiom, meaning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdiomDataImplCopyWith<_$IdiomDataImpl> get copyWith =>
      __$$IdiomDataImplCopyWithImpl<_$IdiomDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IdiomDataImplToJson(
      this,
    );
  }
}

abstract class _IdiomData implements IdiomData {
  const factory _IdiomData(
      {required final String idiom,
      required final String meaning}) = _$IdiomDataImpl;

  factory _IdiomData.fromJson(Map<String, dynamic> json) =
      _$IdiomDataImpl.fromJson;

  @override
  String get idiom;
  @override
  String get meaning;
  @override
  @JsonKey(ignore: true)
  _$$IdiomDataImplCopyWith<_$IdiomDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
