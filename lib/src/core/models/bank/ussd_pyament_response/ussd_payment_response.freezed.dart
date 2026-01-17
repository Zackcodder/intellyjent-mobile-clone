// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ussd_payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

USSDPaymentResponse _$USSDPaymentResponseFromJson(Map<String, dynamic> json) {
  return _USSDPaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$USSDPaymentResponse {
  String get charge_type => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get payment_channel => throw _privateConstructorUsedError;
  USSDInfo get ussd => throw _privateConstructorUsedError;
  String get reference_code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $USSDPaymentResponseCopyWith<USSDPaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $USSDPaymentResponseCopyWith<$Res> {
  factory $USSDPaymentResponseCopyWith(
          USSDPaymentResponse value, $Res Function(USSDPaymentResponse) then) =
      _$USSDPaymentResponseCopyWithImpl<$Res, USSDPaymentResponse>;
  @useResult
  $Res call(
      {String charge_type,
      String amount,
      String currency,
      String payment_channel,
      USSDInfo ussd,
      String reference_code});

  $USSDInfoCopyWith<$Res> get ussd;
}

/// @nodoc
class _$USSDPaymentResponseCopyWithImpl<$Res, $Val extends USSDPaymentResponse>
    implements $USSDPaymentResponseCopyWith<$Res> {
  _$USSDPaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? charge_type = null,
    Object? amount = null,
    Object? currency = null,
    Object? payment_channel = null,
    Object? ussd = null,
    Object? reference_code = null,
  }) {
    return _then(_value.copyWith(
      charge_type: null == charge_type
          ? _value.charge_type
          : charge_type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      payment_channel: null == payment_channel
          ? _value.payment_channel
          : payment_channel // ignore: cast_nullable_to_non_nullable
              as String,
      ussd: null == ussd
          ? _value.ussd
          : ussd // ignore: cast_nullable_to_non_nullable
              as USSDInfo,
      reference_code: null == reference_code
          ? _value.reference_code
          : reference_code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $USSDInfoCopyWith<$Res> get ussd {
    return $USSDInfoCopyWith<$Res>(_value.ussd, (value) {
      return _then(_value.copyWith(ussd: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$USSDPaymentResponseImplCopyWith<$Res>
    implements $USSDPaymentResponseCopyWith<$Res> {
  factory _$$USSDPaymentResponseImplCopyWith(_$USSDPaymentResponseImpl value,
          $Res Function(_$USSDPaymentResponseImpl) then) =
      __$$USSDPaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String charge_type,
      String amount,
      String currency,
      String payment_channel,
      USSDInfo ussd,
      String reference_code});

  @override
  $USSDInfoCopyWith<$Res> get ussd;
}

/// @nodoc
class __$$USSDPaymentResponseImplCopyWithImpl<$Res>
    extends _$USSDPaymentResponseCopyWithImpl<$Res, _$USSDPaymentResponseImpl>
    implements _$$USSDPaymentResponseImplCopyWith<$Res> {
  __$$USSDPaymentResponseImplCopyWithImpl(_$USSDPaymentResponseImpl _value,
      $Res Function(_$USSDPaymentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? charge_type = null,
    Object? amount = null,
    Object? currency = null,
    Object? payment_channel = null,
    Object? ussd = null,
    Object? reference_code = null,
  }) {
    return _then(_$USSDPaymentResponseImpl(
      charge_type: null == charge_type
          ? _value.charge_type
          : charge_type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      payment_channel: null == payment_channel
          ? _value.payment_channel
          : payment_channel // ignore: cast_nullable_to_non_nullable
              as String,
      ussd: null == ussd
          ? _value.ussd
          : ussd // ignore: cast_nullable_to_non_nullable
              as USSDInfo,
      reference_code: null == reference_code
          ? _value.reference_code
          : reference_code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$USSDPaymentResponseImpl implements _USSDPaymentResponse {
  _$USSDPaymentResponseImpl(
      {required this.charge_type,
      required this.amount,
      required this.currency,
      required this.payment_channel,
      required this.ussd,
      required this.reference_code});

  factory _$USSDPaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$USSDPaymentResponseImplFromJson(json);

  @override
  final String charge_type;
  @override
  final String amount;
  @override
  final String currency;
  @override
  final String payment_channel;
  @override
  final USSDInfo ussd;
  @override
  final String reference_code;

  @override
  String toString() {
    return 'USSDPaymentResponse(charge_type: $charge_type, amount: $amount, currency: $currency, payment_channel: $payment_channel, ussd: $ussd, reference_code: $reference_code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$USSDPaymentResponseImpl &&
            (identical(other.charge_type, charge_type) ||
                other.charge_type == charge_type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.payment_channel, payment_channel) ||
                other.payment_channel == payment_channel) &&
            (identical(other.ussd, ussd) || other.ussd == ussd) &&
            (identical(other.reference_code, reference_code) ||
                other.reference_code == reference_code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, charge_type, amount, currency,
      payment_channel, ussd, reference_code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$USSDPaymentResponseImplCopyWith<_$USSDPaymentResponseImpl> get copyWith =>
      __$$USSDPaymentResponseImplCopyWithImpl<_$USSDPaymentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$USSDPaymentResponseImplToJson(
      this,
    );
  }
}

abstract class _USSDPaymentResponse implements USSDPaymentResponse {
  factory _USSDPaymentResponse(
      {required final String charge_type,
      required final String amount,
      required final String currency,
      required final String payment_channel,
      required final USSDInfo ussd,
      required final String reference_code}) = _$USSDPaymentResponseImpl;

  factory _USSDPaymentResponse.fromJson(Map<String, dynamic> json) =
      _$USSDPaymentResponseImpl.fromJson;

  @override
  String get charge_type;
  @override
  String get amount;
  @override
  String get currency;
  @override
  String get payment_channel;
  @override
  USSDInfo get ussd;
  @override
  String get reference_code;
  @override
  @JsonKey(ignore: true)
  _$$USSDPaymentResponseImplCopyWith<_$USSDPaymentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

USSDInfo _$USSDInfoFromJson(Map<String, dynamic> json) {
  return _USSDInfo.fromJson(json);
}

/// @nodoc
mixin _$USSDInfo {
  String get status => throw _privateConstructorUsedError;
  String get display_text => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get ussd_code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $USSDInfoCopyWith<USSDInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $USSDInfoCopyWith<$Res> {
  factory $USSDInfoCopyWith(USSDInfo value, $Res Function(USSDInfo) then) =
      _$USSDInfoCopyWithImpl<$Res, USSDInfo>;
  @useResult
  $Res call(
      {String status, String display_text, String reference, String ussd_code});
}

/// @nodoc
class _$USSDInfoCopyWithImpl<$Res, $Val extends USSDInfo>
    implements $USSDInfoCopyWith<$Res> {
  _$USSDInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? display_text = null,
    Object? reference = null,
    Object? ussd_code = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      display_text: null == display_text
          ? _value.display_text
          : display_text // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      ussd_code: null == ussd_code
          ? _value.ussd_code
          : ussd_code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$USSDInfoImplCopyWith<$Res>
    implements $USSDInfoCopyWith<$Res> {
  factory _$$USSDInfoImplCopyWith(
          _$USSDInfoImpl value, $Res Function(_$USSDInfoImpl) then) =
      __$$USSDInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, String display_text, String reference, String ussd_code});
}

/// @nodoc
class __$$USSDInfoImplCopyWithImpl<$Res>
    extends _$USSDInfoCopyWithImpl<$Res, _$USSDInfoImpl>
    implements _$$USSDInfoImplCopyWith<$Res> {
  __$$USSDInfoImplCopyWithImpl(
      _$USSDInfoImpl _value, $Res Function(_$USSDInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? display_text = null,
    Object? reference = null,
    Object? ussd_code = null,
  }) {
    return _then(_$USSDInfoImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      display_text: null == display_text
          ? _value.display_text
          : display_text // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      ussd_code: null == ussd_code
          ? _value.ussd_code
          : ussd_code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$USSDInfoImpl implements _USSDInfo {
  _$USSDInfoImpl(
      {required this.status,
      required this.display_text,
      required this.reference,
      required this.ussd_code});

  factory _$USSDInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$USSDInfoImplFromJson(json);

  @override
  final String status;
  @override
  final String display_text;
  @override
  final String reference;
  @override
  final String ussd_code;

  @override
  String toString() {
    return 'USSDInfo(status: $status, display_text: $display_text, reference: $reference, ussd_code: $ussd_code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$USSDInfoImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.display_text, display_text) ||
                other.display_text == display_text) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.ussd_code, ussd_code) ||
                other.ussd_code == ussd_code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, display_text, reference, ussd_code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$USSDInfoImplCopyWith<_$USSDInfoImpl> get copyWith =>
      __$$USSDInfoImplCopyWithImpl<_$USSDInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$USSDInfoImplToJson(
      this,
    );
  }
}

abstract class _USSDInfo implements USSDInfo {
  factory _USSDInfo(
      {required final String status,
      required final String display_text,
      required final String reference,
      required final String ussd_code}) = _$USSDInfoImpl;

  factory _USSDInfo.fromJson(Map<String, dynamic> json) =
      _$USSDInfoImpl.fromJson;

  @override
  String get status;
  @override
  String get display_text;
  @override
  String get reference;
  @override
  String get ussd_code;
  @override
  @JsonKey(ignore: true)
  _$$USSDInfoImplCopyWith<_$USSDInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
