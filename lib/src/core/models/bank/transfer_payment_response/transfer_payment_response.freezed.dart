// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferPaymentResponse _$TransferPaymentResponseFromJson(
    Map<String, dynamic> json) {
  return _TransferPaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$TransferPaymentResponse {
  String get charge_type => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get payment_channel => throw _privateConstructorUsedError;
  TransferDetails? get transfer => throw _privateConstructorUsedError;
  String get reference_code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferPaymentResponseCopyWith<TransferPaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferPaymentResponseCopyWith<$Res> {
  factory $TransferPaymentResponseCopyWith(TransferPaymentResponse value,
          $Res Function(TransferPaymentResponse) then) =
      _$TransferPaymentResponseCopyWithImpl<$Res, TransferPaymentResponse>;
  @useResult
  $Res call(
      {String charge_type,
      String amount,
      String currency,
      String payment_channel,
      TransferDetails? transfer,
      String reference_code});

  $TransferDetailsCopyWith<$Res>? get transfer;
}

/// @nodoc
class _$TransferPaymentResponseCopyWithImpl<$Res,
        $Val extends TransferPaymentResponse>
    implements $TransferPaymentResponseCopyWith<$Res> {
  _$TransferPaymentResponseCopyWithImpl(this._value, this._then);

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
    Object? transfer = freezed,
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
      transfer: freezed == transfer
          ? _value.transfer
          : transfer // ignore: cast_nullable_to_non_nullable
              as TransferDetails?,
      reference_code: null == reference_code
          ? _value.reference_code
          : reference_code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransferDetailsCopyWith<$Res>? get transfer {
    if (_value.transfer == null) {
      return null;
    }

    return $TransferDetailsCopyWith<$Res>(_value.transfer!, (value) {
      return _then(_value.copyWith(transfer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransferPaymentResponseImplCopyWith<$Res>
    implements $TransferPaymentResponseCopyWith<$Res> {
  factory _$$TransferPaymentResponseImplCopyWith(
          _$TransferPaymentResponseImpl value,
          $Res Function(_$TransferPaymentResponseImpl) then) =
      __$$TransferPaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String charge_type,
      String amount,
      String currency,
      String payment_channel,
      TransferDetails? transfer,
      String reference_code});

  @override
  $TransferDetailsCopyWith<$Res>? get transfer;
}

/// @nodoc
class __$$TransferPaymentResponseImplCopyWithImpl<$Res>
    extends _$TransferPaymentResponseCopyWithImpl<$Res,
        _$TransferPaymentResponseImpl>
    implements _$$TransferPaymentResponseImplCopyWith<$Res> {
  __$$TransferPaymentResponseImplCopyWithImpl(
      _$TransferPaymentResponseImpl _value,
      $Res Function(_$TransferPaymentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? charge_type = null,
    Object? amount = null,
    Object? currency = null,
    Object? payment_channel = null,
    Object? transfer = freezed,
    Object? reference_code = null,
  }) {
    return _then(_$TransferPaymentResponseImpl(
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
      transfer: freezed == transfer
          ? _value.transfer
          : transfer // ignore: cast_nullable_to_non_nullable
              as TransferDetails?,
      reference_code: null == reference_code
          ? _value.reference_code
          : reference_code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferPaymentResponseImpl implements _TransferPaymentResponse {
  const _$TransferPaymentResponseImpl(
      {required this.charge_type,
      required this.amount,
      required this.currency,
      required this.payment_channel,
      required this.transfer,
      required this.reference_code});

  factory _$TransferPaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferPaymentResponseImplFromJson(json);

  @override
  final String charge_type;
  @override
  final String amount;
  @override
  final String currency;
  @override
  final String payment_channel;
  @override
  final TransferDetails? transfer;
  @override
  final String reference_code;

  @override
  String toString() {
    return 'TransferPaymentResponse(charge_type: $charge_type, amount: $amount, currency: $currency, payment_channel: $payment_channel, transfer: $transfer, reference_code: $reference_code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferPaymentResponseImpl &&
            (identical(other.charge_type, charge_type) ||
                other.charge_type == charge_type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.payment_channel, payment_channel) ||
                other.payment_channel == payment_channel) &&
            (identical(other.transfer, transfer) ||
                other.transfer == transfer) &&
            (identical(other.reference_code, reference_code) ||
                other.reference_code == reference_code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, charge_type, amount, currency,
      payment_channel, transfer, reference_code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferPaymentResponseImplCopyWith<_$TransferPaymentResponseImpl>
      get copyWith => __$$TransferPaymentResponseImplCopyWithImpl<
          _$TransferPaymentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferPaymentResponseImplToJson(
      this,
    );
  }
}

abstract class _TransferPaymentResponse implements TransferPaymentResponse {
  const factory _TransferPaymentResponse(
      {required final String charge_type,
      required final String amount,
      required final String currency,
      required final String payment_channel,
      required final TransferDetails? transfer,
      required final String reference_code}) = _$TransferPaymentResponseImpl;

  factory _TransferPaymentResponse.fromJson(Map<String, dynamic> json) =
      _$TransferPaymentResponseImpl.fromJson;

  @override
  String get charge_type;
  @override
  String get amount;
  @override
  String get currency;
  @override
  String get payment_channel;
  @override
  TransferDetails? get transfer;
  @override
  String get reference_code;
  @override
  @JsonKey(ignore: true)
  _$$TransferPaymentResponseImplCopyWith<_$TransferPaymentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransferDetails _$TransferDetailsFromJson(Map<String, dynamic> json) {
  return _TransferDetails.fromJson(json);
}

/// @nodoc
mixin _$TransferDetails {
  String get status => throw _privateConstructorUsedError;
  String get display_text => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get account_name => throw _privateConstructorUsedError;
  String get account_number => throw _privateConstructorUsedError;
  TitanPayStack get bank => throw _privateConstructorUsedError;
  DateTime get account_expires_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferDetailsCopyWith<TransferDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferDetailsCopyWith<$Res> {
  factory $TransferDetailsCopyWith(
          TransferDetails value, $Res Function(TransferDetails) then) =
      _$TransferDetailsCopyWithImpl<$Res, TransferDetails>;
  @useResult
  $Res call(
      {String status,
      String display_text,
      String reference,
      int amount,
      String account_name,
      String account_number,
      TitanPayStack bank,
      DateTime account_expires_at});

  $TitanPayStackCopyWith<$Res> get bank;
}

/// @nodoc
class _$TransferDetailsCopyWithImpl<$Res, $Val extends TransferDetails>
    implements $TransferDetailsCopyWith<$Res> {
  _$TransferDetailsCopyWithImpl(this._value, this._then);

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
    Object? amount = null,
    Object? account_name = null,
    Object? account_number = null,
    Object? bank = null,
    Object? account_expires_at = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      account_name: null == account_name
          ? _value.account_name
          : account_name // ignore: cast_nullable_to_non_nullable
              as String,
      account_number: null == account_number
          ? _value.account_number
          : account_number // ignore: cast_nullable_to_non_nullable
              as String,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as TitanPayStack,
      account_expires_at: null == account_expires_at
          ? _value.account_expires_at
          : account_expires_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TitanPayStackCopyWith<$Res> get bank {
    return $TitanPayStackCopyWith<$Res>(_value.bank, (value) {
      return _then(_value.copyWith(bank: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransferDetailsImplCopyWith<$Res>
    implements $TransferDetailsCopyWith<$Res> {
  factory _$$TransferDetailsImplCopyWith(_$TransferDetailsImpl value,
          $Res Function(_$TransferDetailsImpl) then) =
      __$$TransferDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String display_text,
      String reference,
      int amount,
      String account_name,
      String account_number,
      TitanPayStack bank,
      DateTime account_expires_at});

  @override
  $TitanPayStackCopyWith<$Res> get bank;
}

/// @nodoc
class __$$TransferDetailsImplCopyWithImpl<$Res>
    extends _$TransferDetailsCopyWithImpl<$Res, _$TransferDetailsImpl>
    implements _$$TransferDetailsImplCopyWith<$Res> {
  __$$TransferDetailsImplCopyWithImpl(
      _$TransferDetailsImpl _value, $Res Function(_$TransferDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? display_text = null,
    Object? reference = null,
    Object? amount = null,
    Object? account_name = null,
    Object? account_number = null,
    Object? bank = null,
    Object? account_expires_at = null,
  }) {
    return _then(_$TransferDetailsImpl(
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      account_name: null == account_name
          ? _value.account_name
          : account_name // ignore: cast_nullable_to_non_nullable
              as String,
      account_number: null == account_number
          ? _value.account_number
          : account_number // ignore: cast_nullable_to_non_nullable
              as String,
      bank: null == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as TitanPayStack,
      account_expires_at: null == account_expires_at
          ? _value.account_expires_at
          : account_expires_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransferDetailsImpl implements _TransferDetails {
  const _$TransferDetailsImpl(
      {required this.status,
      required this.display_text,
      required this.reference,
      required this.amount,
      required this.account_name,
      required this.account_number,
      required this.bank,
      required this.account_expires_at});

  factory _$TransferDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransferDetailsImplFromJson(json);

  @override
  final String status;
  @override
  final String display_text;
  @override
  final String reference;
  @override
  final int amount;
  @override
  final String account_name;
  @override
  final String account_number;
  @override
  final TitanPayStack bank;
  @override
  final DateTime account_expires_at;

  @override
  String toString() {
    return 'TransferDetails(status: $status, display_text: $display_text, reference: $reference, amount: $amount, account_name: $account_name, account_number: $account_number, bank: $bank, account_expires_at: $account_expires_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferDetailsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.display_text, display_text) ||
                other.display_text == display_text) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.account_name, account_name) ||
                other.account_name == account_name) &&
            (identical(other.account_number, account_number) ||
                other.account_number == account_number) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.account_expires_at, account_expires_at) ||
                other.account_expires_at == account_expires_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, display_text, reference,
      amount, account_name, account_number, bank, account_expires_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferDetailsImplCopyWith<_$TransferDetailsImpl> get copyWith =>
      __$$TransferDetailsImplCopyWithImpl<_$TransferDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransferDetailsImplToJson(
      this,
    );
  }
}

abstract class _TransferDetails implements TransferDetails {
  const factory _TransferDetails(
      {required final String status,
      required final String display_text,
      required final String reference,
      required final int amount,
      required final String account_name,
      required final String account_number,
      required final TitanPayStack bank,
      required final DateTime account_expires_at}) = _$TransferDetailsImpl;

  factory _TransferDetails.fromJson(Map<String, dynamic> json) =
      _$TransferDetailsImpl.fromJson;

  @override
  String get status;
  @override
  String get display_text;
  @override
  String get reference;
  @override
  int get amount;
  @override
  String get account_name;
  @override
  String get account_number;
  @override
  TitanPayStack get bank;
  @override
  DateTime get account_expires_at;
  @override
  @JsonKey(ignore: true)
  _$$TransferDetailsImplCopyWith<_$TransferDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TitanPayStack _$TitanPayStackFromJson(Map<String, dynamic> json) {
  return _TitanPayStack.fromJson(json);
}

/// @nodoc
mixin _$TitanPayStack {
  int get id => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TitanPayStackCopyWith<TitanPayStack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TitanPayStackCopyWith<$Res> {
  factory $TitanPayStackCopyWith(
          TitanPayStack value, $Res Function(TitanPayStack) then) =
      _$TitanPayStackCopyWithImpl<$Res, TitanPayStack>;
  @useResult
  $Res call({int id, String slug, String name});
}

/// @nodoc
class _$TitanPayStackCopyWithImpl<$Res, $Val extends TitanPayStack>
    implements $TitanPayStackCopyWith<$Res> {
  _$TitanPayStackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TitanPayStackImplCopyWith<$Res>
    implements $TitanPayStackCopyWith<$Res> {
  factory _$$TitanPayStackImplCopyWith(
          _$TitanPayStackImpl value, $Res Function(_$TitanPayStackImpl) then) =
      __$$TitanPayStackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String slug, String name});
}

/// @nodoc
class __$$TitanPayStackImplCopyWithImpl<$Res>
    extends _$TitanPayStackCopyWithImpl<$Res, _$TitanPayStackImpl>
    implements _$$TitanPayStackImplCopyWith<$Res> {
  __$$TitanPayStackImplCopyWithImpl(
      _$TitanPayStackImpl _value, $Res Function(_$TitanPayStackImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? name = null,
  }) {
    return _then(_$TitanPayStackImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TitanPayStackImpl implements _TitanPayStack {
  const _$TitanPayStackImpl(
      {required this.id, required this.slug, required this.name});

  factory _$TitanPayStackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TitanPayStackImplFromJson(json);

  @override
  final int id;
  @override
  final String slug;
  @override
  final String name;

  @override
  String toString() {
    return 'TitanPayStack(id: $id, slug: $slug, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitanPayStackImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, slug, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TitanPayStackImplCopyWith<_$TitanPayStackImpl> get copyWith =>
      __$$TitanPayStackImplCopyWithImpl<_$TitanPayStackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TitanPayStackImplToJson(
      this,
    );
  }
}

abstract class _TitanPayStack implements TitanPayStack {
  const factory _TitanPayStack(
      {required final int id,
      required final String slug,
      required final String name}) = _$TitanPayStackImpl;

  factory _TitanPayStack.fromJson(Map<String, dynamic> json) =
      _$TitanPayStackImpl.fromJson;

  @override
  int get id;
  @override
  String get slug;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TitanPayStackImplCopyWith<_$TitanPayStackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
