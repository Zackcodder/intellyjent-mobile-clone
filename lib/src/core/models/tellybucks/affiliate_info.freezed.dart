// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affiliate_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AffiliateInfo _$AffiliateInfoFromJson(Map<String, dynamic> json) {
  return _AffiliateInfo.fromJson(json);
}

/// @nodoc
mixin _$AffiliateInfo {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'signups_by_date')
  SignupsByDate get signupsByDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission_by_date')
  CommissionByDate get commissionByDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_code')
  String? get bankCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_name')
  String? get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_number')
  String? get accountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_commission_earned')
  double get totalCommissionEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'commission')
  double get commission => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_signups')
  int get totalSignups => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_transfer_pin')
  String? get oldTransferPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_pin')
  String? get transferPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'pin_status')
  bool? get pinStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AffiliateInfoCopyWith<AffiliateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffiliateInfoCopyWith<$Res> {
  factory $AffiliateInfoCopyWith(
          AffiliateInfo value, $Res Function(AffiliateInfo) then) =
      _$AffiliateInfoCopyWithImpl<$Res, AffiliateInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'signups_by_date') SignupsByDate signupsByDate,
      @JsonKey(name: 'commission_by_date') CommissionByDate commissionByDate,
      @JsonKey(name: 'bank_code') String? bankCode,
      @JsonKey(name: 'account_name') String? accountName,
      @JsonKey(name: 'account_number') String? accountNumber,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'balance') double balance,
      @JsonKey(name: 'total_commission_earned') double totalCommissionEarned,
      @JsonKey(name: 'commission') double commission,
      @JsonKey(name: 'total_signups') int totalSignups,
      @JsonKey(name: 'old_transfer_pin') String? oldTransferPin,
      @JsonKey(name: 'transfer_pin') String? transferPin,
      @JsonKey(name: 'pin_status') bool? pinStatus});

  $SignupsByDateCopyWith<$Res> get signupsByDate;
  $CommissionByDateCopyWith<$Res> get commissionByDate;
}

/// @nodoc
class _$AffiliateInfoCopyWithImpl<$Res, $Val extends AffiliateInfo>
    implements $AffiliateInfoCopyWith<$Res> {
  _$AffiliateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? signupsByDate = null,
    Object? commissionByDate = null,
    Object? bankCode = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? id = null,
    Object? balance = null,
    Object? totalCommissionEarned = null,
    Object? commission = null,
    Object? totalSignups = null,
    Object? oldTransferPin = freezed,
    Object? transferPin = freezed,
    Object? pinStatus = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      signupsByDate: null == signupsByDate
          ? _value.signupsByDate
          : signupsByDate // ignore: cast_nullable_to_non_nullable
              as SignupsByDate,
      commissionByDate: null == commissionByDate
          ? _value.commissionByDate
          : commissionByDate // ignore: cast_nullable_to_non_nullable
              as CommissionByDate,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalCommissionEarned: null == totalCommissionEarned
          ? _value.totalCommissionEarned
          : totalCommissionEarned // ignore: cast_nullable_to_non_nullable
              as double,
      commission: null == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double,
      totalSignups: null == totalSignups
          ? _value.totalSignups
          : totalSignups // ignore: cast_nullable_to_non_nullable
              as int,
      oldTransferPin: freezed == oldTransferPin
          ? _value.oldTransferPin
          : oldTransferPin // ignore: cast_nullable_to_non_nullable
              as String?,
      transferPin: freezed == transferPin
          ? _value.transferPin
          : transferPin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinStatus: freezed == pinStatus
          ? _value.pinStatus
          : pinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignupsByDateCopyWith<$Res> get signupsByDate {
    return $SignupsByDateCopyWith<$Res>(_value.signupsByDate, (value) {
      return _then(_value.copyWith(signupsByDate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommissionByDateCopyWith<$Res> get commissionByDate {
    return $CommissionByDateCopyWith<$Res>(_value.commissionByDate, (value) {
      return _then(_value.copyWith(commissionByDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AffiliateInfoImplCopyWith<$Res>
    implements $AffiliateInfoCopyWith<$Res> {
  factory _$$AffiliateInfoImplCopyWith(
          _$AffiliateInfoImpl value, $Res Function(_$AffiliateInfoImpl) then) =
      __$$AffiliateInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'signups_by_date') SignupsByDate signupsByDate,
      @JsonKey(name: 'commission_by_date') CommissionByDate commissionByDate,
      @JsonKey(name: 'bank_code') String? bankCode,
      @JsonKey(name: 'account_name') String? accountName,
      @JsonKey(name: 'account_number') String? accountNumber,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'balance') double balance,
      @JsonKey(name: 'total_commission_earned') double totalCommissionEarned,
      @JsonKey(name: 'commission') double commission,
      @JsonKey(name: 'total_signups') int totalSignups,
      @JsonKey(name: 'old_transfer_pin') String? oldTransferPin,
      @JsonKey(name: 'transfer_pin') String? transferPin,
      @JsonKey(name: 'pin_status') bool? pinStatus});

  @override
  $SignupsByDateCopyWith<$Res> get signupsByDate;
  @override
  $CommissionByDateCopyWith<$Res> get commissionByDate;
}

/// @nodoc
class __$$AffiliateInfoImplCopyWithImpl<$Res>
    extends _$AffiliateInfoCopyWithImpl<$Res, _$AffiliateInfoImpl>
    implements _$$AffiliateInfoImplCopyWith<$Res> {
  __$$AffiliateInfoImplCopyWithImpl(
      _$AffiliateInfoImpl _value, $Res Function(_$AffiliateInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? signupsByDate = null,
    Object? commissionByDate = null,
    Object? bankCode = freezed,
    Object? accountName = freezed,
    Object? accountNumber = freezed,
    Object? id = null,
    Object? balance = null,
    Object? totalCommissionEarned = null,
    Object? commission = null,
    Object? totalSignups = null,
    Object? oldTransferPin = freezed,
    Object? transferPin = freezed,
    Object? pinStatus = freezed,
  }) {
    return _then(_$AffiliateInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      signupsByDate: null == signupsByDate
          ? _value.signupsByDate
          : signupsByDate // ignore: cast_nullable_to_non_nullable
              as SignupsByDate,
      commissionByDate: null == commissionByDate
          ? _value.commissionByDate
          : commissionByDate // ignore: cast_nullable_to_non_nullable
              as CommissionByDate,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      totalCommissionEarned: null == totalCommissionEarned
          ? _value.totalCommissionEarned
          : totalCommissionEarned // ignore: cast_nullable_to_non_nullable
              as double,
      commission: null == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double,
      totalSignups: null == totalSignups
          ? _value.totalSignups
          : totalSignups // ignore: cast_nullable_to_non_nullable
              as int,
      oldTransferPin: freezed == oldTransferPin
          ? _value.oldTransferPin
          : oldTransferPin // ignore: cast_nullable_to_non_nullable
              as String?,
      transferPin: freezed == transferPin
          ? _value.transferPin
          : transferPin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinStatus: freezed == pinStatus
          ? _value.pinStatus
          : pinStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AffiliateInfoImpl implements _AffiliateInfo {
  const _$AffiliateInfoImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'signups_by_date') required this.signupsByDate,
      @JsonKey(name: 'commission_by_date') required this.commissionByDate,
      @JsonKey(name: 'bank_code') this.bankCode,
      @JsonKey(name: 'account_name') this.accountName,
      @JsonKey(name: 'account_number') this.accountNumber,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'balance') required this.balance,
      @JsonKey(name: 'total_commission_earned')
      required this.totalCommissionEarned,
      @JsonKey(name: 'commission') required this.commission,
      @JsonKey(name: 'total_signups') required this.totalSignups,
      @JsonKey(name: 'old_transfer_pin') required this.oldTransferPin,
      @JsonKey(name: 'transfer_pin') required this.transferPin,
      @JsonKey(name: 'pin_status') required this.pinStatus});

  factory _$AffiliateInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AffiliateInfoImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'signups_by_date')
  final SignupsByDate signupsByDate;
  @override
  @JsonKey(name: 'commission_by_date')
  final CommissionByDate commissionByDate;
  @override
  @JsonKey(name: 'bank_code')
  final String? bankCode;
  @override
  @JsonKey(name: 'account_name')
  final String? accountName;
  @override
  @JsonKey(name: 'account_number')
  final String? accountNumber;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'balance')
  final double balance;
  @override
  @JsonKey(name: 'total_commission_earned')
  final double totalCommissionEarned;
  @override
  @JsonKey(name: 'commission')
  final double commission;
  @override
  @JsonKey(name: 'total_signups')
  final int totalSignups;
  @override
  @JsonKey(name: 'old_transfer_pin')
  final String? oldTransferPin;
  @override
  @JsonKey(name: 'transfer_pin')
  final String? transferPin;
  @override
  @JsonKey(name: 'pin_status')
  final bool? pinStatus;

  @override
  String toString() {
    return 'AffiliateInfo(userId: $userId, signupsByDate: $signupsByDate, commissionByDate: $commissionByDate, bankCode: $bankCode, accountName: $accountName, accountNumber: $accountNumber, id: $id, balance: $balance, totalCommissionEarned: $totalCommissionEarned, commission: $commission, totalSignups: $totalSignups, oldTransferPin: $oldTransferPin, transferPin: $transferPin, pinStatus: $pinStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AffiliateInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.signupsByDate, signupsByDate) ||
                other.signupsByDate == signupsByDate) &&
            (identical(other.commissionByDate, commissionByDate) ||
                other.commissionByDate == commissionByDate) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.totalCommissionEarned, totalCommissionEarned) ||
                other.totalCommissionEarned == totalCommissionEarned) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.totalSignups, totalSignups) ||
                other.totalSignups == totalSignups) &&
            (identical(other.oldTransferPin, oldTransferPin) ||
                other.oldTransferPin == oldTransferPin) &&
            (identical(other.transferPin, transferPin) ||
                other.transferPin == transferPin) &&
            (identical(other.pinStatus, pinStatus) ||
                other.pinStatus == pinStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      signupsByDate,
      commissionByDate,
      bankCode,
      accountName,
      accountNumber,
      id,
      balance,
      totalCommissionEarned,
      commission,
      totalSignups,
      oldTransferPin,
      transferPin,
      pinStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AffiliateInfoImplCopyWith<_$AffiliateInfoImpl> get copyWith =>
      __$$AffiliateInfoImplCopyWithImpl<_$AffiliateInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AffiliateInfoImplToJson(
      this,
    );
  }
}

abstract class _AffiliateInfo implements AffiliateInfo {
  const factory _AffiliateInfo(
      {@JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'signups_by_date')
      required final SignupsByDate signupsByDate,
      @JsonKey(name: 'commission_by_date')
      required final CommissionByDate commissionByDate,
      @JsonKey(name: 'bank_code') final String? bankCode,
      @JsonKey(name: 'account_name') final String? accountName,
      @JsonKey(name: 'account_number') final String? accountNumber,
      @JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'balance') required final double balance,
      @JsonKey(name: 'total_commission_earned')
      required final double totalCommissionEarned,
      @JsonKey(name: 'commission') required final double commission,
      @JsonKey(name: 'total_signups') required final int totalSignups,
      @JsonKey(name: 'old_transfer_pin') required final String? oldTransferPin,
      @JsonKey(name: 'transfer_pin') required final String? transferPin,
      @JsonKey(name: 'pin_status')
      required final bool? pinStatus}) = _$AffiliateInfoImpl;

  factory _AffiliateInfo.fromJson(Map<String, dynamic> json) =
      _$AffiliateInfoImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'signups_by_date')
  SignupsByDate get signupsByDate;
  @override
  @JsonKey(name: 'commission_by_date')
  CommissionByDate get commissionByDate;
  @override
  @JsonKey(name: 'bank_code')
  String? get bankCode;
  @override
  @JsonKey(name: 'account_name')
  String? get accountName;
  @override
  @JsonKey(name: 'account_number')
  String? get accountNumber;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'balance')
  double get balance;
  @override
  @JsonKey(name: 'total_commission_earned')
  double get totalCommissionEarned;
  @override
  @JsonKey(name: 'commission')
  double get commission;
  @override
  @JsonKey(name: 'total_signups')
  int get totalSignups;
  @override
  @JsonKey(name: 'old_transfer_pin')
  String? get oldTransferPin;
  @override
  @JsonKey(name: 'transfer_pin')
  String? get transferPin;
  @override
  @JsonKey(name: 'pin_status')
  bool? get pinStatus;
  @override
  @JsonKey(ignore: true)
  _$$AffiliateInfoImplCopyWith<_$AffiliateInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignupsByDate _$SignupsByDateFromJson(Map<String, dynamic> json) {
  return _SignupsByDate.fromJson(json);
}

/// @nodoc
mixin _$SignupsByDate {
  @JsonKey(name: 'yearly_signups')
  int get yearlySignups => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_signups')
  int get monthlySignups => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_signups')
  int get weeklySignups => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupsByDateCopyWith<SignupsByDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupsByDateCopyWith<$Res> {
  factory $SignupsByDateCopyWith(
          SignupsByDate value, $Res Function(SignupsByDate) then) =
      _$SignupsByDateCopyWithImpl<$Res, SignupsByDate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'yearly_signups') int yearlySignups,
      @JsonKey(name: 'monthly_signups') int monthlySignups,
      @JsonKey(name: 'weekly_signups') int weeklySignups});
}

/// @nodoc
class _$SignupsByDateCopyWithImpl<$Res, $Val extends SignupsByDate>
    implements $SignupsByDateCopyWith<$Res> {
  _$SignupsByDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearlySignups = null,
    Object? monthlySignups = null,
    Object? weeklySignups = null,
  }) {
    return _then(_value.copyWith(
      yearlySignups: null == yearlySignups
          ? _value.yearlySignups
          : yearlySignups // ignore: cast_nullable_to_non_nullable
              as int,
      monthlySignups: null == monthlySignups
          ? _value.monthlySignups
          : monthlySignups // ignore: cast_nullable_to_non_nullable
              as int,
      weeklySignups: null == weeklySignups
          ? _value.weeklySignups
          : weeklySignups // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupsByDateImplCopyWith<$Res>
    implements $SignupsByDateCopyWith<$Res> {
  factory _$$SignupsByDateImplCopyWith(
          _$SignupsByDateImpl value, $Res Function(_$SignupsByDateImpl) then) =
      __$$SignupsByDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'yearly_signups') int yearlySignups,
      @JsonKey(name: 'monthly_signups') int monthlySignups,
      @JsonKey(name: 'weekly_signups') int weeklySignups});
}

/// @nodoc
class __$$SignupsByDateImplCopyWithImpl<$Res>
    extends _$SignupsByDateCopyWithImpl<$Res, _$SignupsByDateImpl>
    implements _$$SignupsByDateImplCopyWith<$Res> {
  __$$SignupsByDateImplCopyWithImpl(
      _$SignupsByDateImpl _value, $Res Function(_$SignupsByDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearlySignups = null,
    Object? monthlySignups = null,
    Object? weeklySignups = null,
  }) {
    return _then(_$SignupsByDateImpl(
      yearlySignups: null == yearlySignups
          ? _value.yearlySignups
          : yearlySignups // ignore: cast_nullable_to_non_nullable
              as int,
      monthlySignups: null == monthlySignups
          ? _value.monthlySignups
          : monthlySignups // ignore: cast_nullable_to_non_nullable
              as int,
      weeklySignups: null == weeklySignups
          ? _value.weeklySignups
          : weeklySignups // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupsByDateImpl implements _SignupsByDate {
  const _$SignupsByDateImpl(
      {@JsonKey(name: 'yearly_signups') required this.yearlySignups,
      @JsonKey(name: 'monthly_signups') required this.monthlySignups,
      @JsonKey(name: 'weekly_signups') required this.weeklySignups});

  factory _$SignupsByDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupsByDateImplFromJson(json);

  @override
  @JsonKey(name: 'yearly_signups')
  final int yearlySignups;
  @override
  @JsonKey(name: 'monthly_signups')
  final int monthlySignups;
  @override
  @JsonKey(name: 'weekly_signups')
  final int weeklySignups;

  @override
  String toString() {
    return 'SignupsByDate(yearlySignups: $yearlySignups, monthlySignups: $monthlySignups, weeklySignups: $weeklySignups)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupsByDateImpl &&
            (identical(other.yearlySignups, yearlySignups) ||
                other.yearlySignups == yearlySignups) &&
            (identical(other.monthlySignups, monthlySignups) ||
                other.monthlySignups == monthlySignups) &&
            (identical(other.weeklySignups, weeklySignups) ||
                other.weeklySignups == weeklySignups));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, yearlySignups, monthlySignups, weeklySignups);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupsByDateImplCopyWith<_$SignupsByDateImpl> get copyWith =>
      __$$SignupsByDateImplCopyWithImpl<_$SignupsByDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupsByDateImplToJson(
      this,
    );
  }
}

abstract class _SignupsByDate implements SignupsByDate {
  const factory _SignupsByDate(
          {@JsonKey(name: 'yearly_signups') required final int yearlySignups,
          @JsonKey(name: 'monthly_signups') required final int monthlySignups,
          @JsonKey(name: 'weekly_signups') required final int weeklySignups}) =
      _$SignupsByDateImpl;

  factory _SignupsByDate.fromJson(Map<String, dynamic> json) =
      _$SignupsByDateImpl.fromJson;

  @override
  @JsonKey(name: 'yearly_signups')
  int get yearlySignups;
  @override
  @JsonKey(name: 'monthly_signups')
  int get monthlySignups;
  @override
  @JsonKey(name: 'weekly_signups')
  int get weeklySignups;
  @override
  @JsonKey(ignore: true)
  _$$SignupsByDateImplCopyWith<_$SignupsByDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommissionByDate _$CommissionByDateFromJson(Map<String, dynamic> json) {
  return _CommissionByDate.fromJson(json);
}

/// @nodoc
mixin _$CommissionByDate {
  @JsonKey(name: 'yearly_commission')
  double get yearlyCommission => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_commission')
  double get monthlyCommission => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_commission')
  double get weeklyCommission => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommissionByDateCopyWith<CommissionByDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionByDateCopyWith<$Res> {
  factory $CommissionByDateCopyWith(
          CommissionByDate value, $Res Function(CommissionByDate) then) =
      _$CommissionByDateCopyWithImpl<$Res, CommissionByDate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'yearly_commission') double yearlyCommission,
      @JsonKey(name: 'monthly_commission') double monthlyCommission,
      @JsonKey(name: 'weekly_commission') double weeklyCommission});
}

/// @nodoc
class _$CommissionByDateCopyWithImpl<$Res, $Val extends CommissionByDate>
    implements $CommissionByDateCopyWith<$Res> {
  _$CommissionByDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearlyCommission = null,
    Object? monthlyCommission = null,
    Object? weeklyCommission = null,
  }) {
    return _then(_value.copyWith(
      yearlyCommission: null == yearlyCommission
          ? _value.yearlyCommission
          : yearlyCommission // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyCommission: null == monthlyCommission
          ? _value.monthlyCommission
          : monthlyCommission // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyCommission: null == weeklyCommission
          ? _value.weeklyCommission
          : weeklyCommission // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionByDateImplCopyWith<$Res>
    implements $CommissionByDateCopyWith<$Res> {
  factory _$$CommissionByDateImplCopyWith(_$CommissionByDateImpl value,
          $Res Function(_$CommissionByDateImpl) then) =
      __$$CommissionByDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'yearly_commission') double yearlyCommission,
      @JsonKey(name: 'monthly_commission') double monthlyCommission,
      @JsonKey(name: 'weekly_commission') double weeklyCommission});
}

/// @nodoc
class __$$CommissionByDateImplCopyWithImpl<$Res>
    extends _$CommissionByDateCopyWithImpl<$Res, _$CommissionByDateImpl>
    implements _$$CommissionByDateImplCopyWith<$Res> {
  __$$CommissionByDateImplCopyWithImpl(_$CommissionByDateImpl _value,
      $Res Function(_$CommissionByDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearlyCommission = null,
    Object? monthlyCommission = null,
    Object? weeklyCommission = null,
  }) {
    return _then(_$CommissionByDateImpl(
      yearlyCommission: null == yearlyCommission
          ? _value.yearlyCommission
          : yearlyCommission // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyCommission: null == monthlyCommission
          ? _value.monthlyCommission
          : monthlyCommission // ignore: cast_nullable_to_non_nullable
              as double,
      weeklyCommission: null == weeklyCommission
          ? _value.weeklyCommission
          : weeklyCommission // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionByDateImpl implements _CommissionByDate {
  const _$CommissionByDateImpl(
      {@JsonKey(name: 'yearly_commission') required this.yearlyCommission,
      @JsonKey(name: 'monthly_commission') required this.monthlyCommission,
      @JsonKey(name: 'weekly_commission') required this.weeklyCommission});

  factory _$CommissionByDateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionByDateImplFromJson(json);

  @override
  @JsonKey(name: 'yearly_commission')
  final double yearlyCommission;
  @override
  @JsonKey(name: 'monthly_commission')
  final double monthlyCommission;
  @override
  @JsonKey(name: 'weekly_commission')
  final double weeklyCommission;

  @override
  String toString() {
    return 'CommissionByDate(yearlyCommission: $yearlyCommission, monthlyCommission: $monthlyCommission, weeklyCommission: $weeklyCommission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionByDateImpl &&
            (identical(other.yearlyCommission, yearlyCommission) ||
                other.yearlyCommission == yearlyCommission) &&
            (identical(other.monthlyCommission, monthlyCommission) ||
                other.monthlyCommission == monthlyCommission) &&
            (identical(other.weeklyCommission, weeklyCommission) ||
                other.weeklyCommission == weeklyCommission));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, yearlyCommission, monthlyCommission, weeklyCommission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionByDateImplCopyWith<_$CommissionByDateImpl> get copyWith =>
      __$$CommissionByDateImplCopyWithImpl<_$CommissionByDateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionByDateImplToJson(
      this,
    );
  }
}

abstract class _CommissionByDate implements CommissionByDate {
  const factory _CommissionByDate(
      {@JsonKey(name: 'yearly_commission')
      required final double yearlyCommission,
      @JsonKey(name: 'monthly_commission')
      required final double monthlyCommission,
      @JsonKey(name: 'weekly_commission')
      required final double weeklyCommission}) = _$CommissionByDateImpl;

  factory _CommissionByDate.fromJson(Map<String, dynamic> json) =
      _$CommissionByDateImpl.fromJson;

  @override
  @JsonKey(name: 'yearly_commission')
  double get yearlyCommission;
  @override
  @JsonKey(name: 'monthly_commission')
  double get monthlyCommission;
  @override
  @JsonKey(name: 'weekly_commission')
  double get weeklyCommission;
  @override
  @JsonKey(ignore: true)
  _$$CommissionByDateImplCopyWith<_$CommissionByDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
