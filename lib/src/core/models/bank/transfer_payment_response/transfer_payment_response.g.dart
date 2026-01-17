// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferPaymentResponseImpl _$$TransferPaymentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferPaymentResponseImpl(
      charge_type: json['charge_type'] as String,
      amount: json['amount'] as String,
      currency: json['currency'] as String,
      payment_channel: json['payment_channel'] as String,
      transfer: json['transfer'] == null
          ? null
          : TransferDetails.fromJson(json['transfer'] as Map<String, dynamic>),
      reference_code: json['reference_code'] as String,
    );

Map<String, dynamic> _$$TransferPaymentResponseImplToJson(
        _$TransferPaymentResponseImpl instance) =>
    <String, dynamic>{
      'charge_type': instance.charge_type,
      'amount': instance.amount,
      'currency': instance.currency,
      'payment_channel': instance.payment_channel,
      'transfer': instance.transfer,
      'reference_code': instance.reference_code,
    };

_$TransferDetailsImpl _$$TransferDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$TransferDetailsImpl(
      status: json['status'] as String,
      display_text: json['display_text'] as String,
      reference: json['reference'] as String,
      amount: json['amount'] as int,
      account_name: json['account_name'] as String,
      account_number: json['account_number'] as String,
      bank: TitanPayStack.fromJson(json['bank'] as Map<String, dynamic>),
      account_expires_at: DateTime.parse(json['account_expires_at'] as String),
    );

Map<String, dynamic> _$$TransferDetailsImplToJson(
        _$TransferDetailsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'display_text': instance.display_text,
      'reference': instance.reference,
      'amount': instance.amount,
      'account_name': instance.account_name,
      'account_number': instance.account_number,
      'bank': instance.bank,
      'account_expires_at': instance.account_expires_at.toIso8601String(),
    };

_$TitanPayStackImpl _$$TitanPayStackImplFromJson(Map<String, dynamic> json) =>
    _$TitanPayStackImpl(
      id: json['id'] as int,
      slug: json['slug'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$TitanPayStackImplToJson(_$TitanPayStackImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
    };
