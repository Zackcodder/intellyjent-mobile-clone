// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeaderboardItem _$LeaderboardItemFromJson(Map<String, dynamic> json) {
  return _LeaderboardItem.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardItem {
  String get username => throw _privateConstructorUsedError;
  String? get user_profile_image => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaderboardItemCopyWith<LeaderboardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardItemCopyWith<$Res> {
  factory $LeaderboardItemCopyWith(
          LeaderboardItem value, $Res Function(LeaderboardItem) then) =
      _$LeaderboardItemCopyWithImpl<$Res, LeaderboardItem>;
  @useResult
  $Res call(
      {String username,
      String? user_profile_image,
      String fullname,
      String? country,
      String? date,
      double score});
}

/// @nodoc
class _$LeaderboardItemCopyWithImpl<$Res, $Val extends LeaderboardItem>
    implements $LeaderboardItemCopyWith<$Res> {
  _$LeaderboardItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? user_profile_image = freezed,
    Object? fullname = null,
    Object? country = freezed,
    Object? date = freezed,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      user_profile_image: freezed == user_profile_image
          ? _value.user_profile_image
          : user_profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardItemImplCopyWith<$Res>
    implements $LeaderboardItemCopyWith<$Res> {
  factory _$$LeaderboardItemImplCopyWith(_$LeaderboardItemImpl value,
          $Res Function(_$LeaderboardItemImpl) then) =
      __$$LeaderboardItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String? user_profile_image,
      String fullname,
      String? country,
      String? date,
      double score});
}

/// @nodoc
class __$$LeaderboardItemImplCopyWithImpl<$Res>
    extends _$LeaderboardItemCopyWithImpl<$Res, _$LeaderboardItemImpl>
    implements _$$LeaderboardItemImplCopyWith<$Res> {
  __$$LeaderboardItemImplCopyWithImpl(
      _$LeaderboardItemImpl _value, $Res Function(_$LeaderboardItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? user_profile_image = freezed,
    Object? fullname = null,
    Object? country = freezed,
    Object? date = freezed,
    Object? score = null,
  }) {
    return _then(_$LeaderboardItemImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      user_profile_image: freezed == user_profile_image
          ? _value.user_profile_image
          : user_profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardItemImpl implements _LeaderboardItem {
  const _$LeaderboardItemImpl(
      {required this.username,
      required this.user_profile_image,
      this.fullname = 'User',
      this.country = 'Nigeria',
      required this.date,
      required this.score});

  factory _$LeaderboardItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardItemImplFromJson(json);

  @override
  final String username;
  @override
  final String? user_profile_image;
  @override
  @JsonKey()
  final String fullname;
  @override
  @JsonKey()
  final String? country;
  @override
  final String? date;
  @override
  final double score;

  @override
  String toString() {
    return 'LeaderboardItem(username: $username, user_profile_image: $user_profile_image, fullname: $fullname, country: $country, date: $date, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardItemImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.user_profile_image, user_profile_image) ||
                other.user_profile_image == user_profile_image) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, user_profile_image,
      fullname, country, date, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardItemImplCopyWith<_$LeaderboardItemImpl> get copyWith =>
      __$$LeaderboardItemImplCopyWithImpl<_$LeaderboardItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardItemImplToJson(
      this,
    );
  }
}

abstract class _LeaderboardItem implements LeaderboardItem {
  const factory _LeaderboardItem(
      {required final String username,
      required final String? user_profile_image,
      final String fullname,
      final String? country,
      required final String? date,
      required final double score}) = _$LeaderboardItemImpl;

  factory _LeaderboardItem.fromJson(Map<String, dynamic> json) =
      _$LeaderboardItemImpl.fromJson;

  @override
  String get username;
  @override
  String? get user_profile_image;
  @override
  String get fullname;
  @override
  String? get country;
  @override
  String? get date;
  @override
  double get score;
  @override
  @JsonKey(ignore: true)
  _$$LeaderboardItemImplCopyWith<_$LeaderboardItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LastWeeksWinners _$LastWeeksWinnersFromJson(Map<String, dynamic> json) {
  return _LastWeeksWinners.fromJson(json);
}

/// @nodoc
mixin _$LastWeeksWinners {
  String get username => throw _privateConstructorUsedError;
  String? get user_profile_image => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastWeeksWinnersCopyWith<LastWeeksWinners> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastWeeksWinnersCopyWith<$Res> {
  factory $LastWeeksWinnersCopyWith(
          LastWeeksWinners value, $Res Function(LastWeeksWinners) then) =
      _$LastWeeksWinnersCopyWithImpl<$Res, LastWeeksWinners>;
  @useResult
  $Res call(
      {String username,
      String? user_profile_image,
      String fullname,
      String? country,
      String? date,
      double score});
}

/// @nodoc
class _$LastWeeksWinnersCopyWithImpl<$Res, $Val extends LastWeeksWinners>
    implements $LastWeeksWinnersCopyWith<$Res> {
  _$LastWeeksWinnersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? user_profile_image = freezed,
    Object? fullname = null,
    Object? country = freezed,
    Object? date = freezed,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      user_profile_image: freezed == user_profile_image
          ? _value.user_profile_image
          : user_profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LastWeeksWinnersImplCopyWith<$Res>
    implements $LastWeeksWinnersCopyWith<$Res> {
  factory _$$LastWeeksWinnersImplCopyWith(_$LastWeeksWinnersImpl value,
          $Res Function(_$LastWeeksWinnersImpl) then) =
      __$$LastWeeksWinnersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String? user_profile_image,
      String fullname,
      String? country,
      String? date,
      double score});
}

/// @nodoc
class __$$LastWeeksWinnersImplCopyWithImpl<$Res>
    extends _$LastWeeksWinnersCopyWithImpl<$Res, _$LastWeeksWinnersImpl>
    implements _$$LastWeeksWinnersImplCopyWith<$Res> {
  __$$LastWeeksWinnersImplCopyWithImpl(_$LastWeeksWinnersImpl _value,
      $Res Function(_$LastWeeksWinnersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? user_profile_image = freezed,
    Object? fullname = null,
    Object? country = freezed,
    Object? date = freezed,
    Object? score = null,
  }) {
    return _then(_$LastWeeksWinnersImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      user_profile_image: freezed == user_profile_image
          ? _value.user_profile_image
          : user_profile_image // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LastWeeksWinnersImpl implements _LastWeeksWinners {
  const _$LastWeeksWinnersImpl(
      {required this.username,
      required this.user_profile_image,
      required this.fullname,
      this.country = 'Nigeria',
      required this.date,
      required this.score});

  factory _$LastWeeksWinnersImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastWeeksWinnersImplFromJson(json);

  @override
  final String username;
  @override
  final String? user_profile_image;
  @override
  final String fullname;
  @override
  @JsonKey()
  final String? country;
  @override
  final String? date;
  @override
  final double score;

  @override
  String toString() {
    return 'LastWeeksWinners(username: $username, user_profile_image: $user_profile_image, fullname: $fullname, country: $country, date: $date, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastWeeksWinnersImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.user_profile_image, user_profile_image) ||
                other.user_profile_image == user_profile_image) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, username, user_profile_image,
      fullname, country, date, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastWeeksWinnersImplCopyWith<_$LastWeeksWinnersImpl> get copyWith =>
      __$$LastWeeksWinnersImplCopyWithImpl<_$LastWeeksWinnersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastWeeksWinnersImplToJson(
      this,
    );
  }
}

abstract class _LastWeeksWinners implements LastWeeksWinners {
  const factory _LastWeeksWinners(
      {required final String username,
      required final String? user_profile_image,
      required final String fullname,
      final String? country,
      required final String? date,
      required final double score}) = _$LastWeeksWinnersImpl;

  factory _LastWeeksWinners.fromJson(Map<String, dynamic> json) =
      _$LastWeeksWinnersImpl.fromJson;

  @override
  String get username;
  @override
  String? get user_profile_image;
  @override
  String get fullname;
  @override
  String? get country;
  @override
  String? get date;
  @override
  double get score;
  @override
  @JsonKey(ignore: true)
  _$$LastWeeksWinnersImplCopyWith<_$LastWeeksWinnersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
