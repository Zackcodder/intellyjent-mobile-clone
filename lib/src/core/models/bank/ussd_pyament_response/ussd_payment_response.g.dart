// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ussd_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$USSDPaymentResponseImpl _$$USSDPaymentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$USSDPaymentResponseImpl(
      charge_type: json['charge_type'] as String,
      amount: json['amount'] as String,
      currency: json['currency'] as String,
      payment_channel: json['payment_channel'] as String,
      ussd: USSDInfo.fromJson(json['ussd'] as Map<String, dynamic>),
      reference_code: json['reference_code'] as String,
    );

Map<String, dynamic> _$$USSDPaymentResponseImplToJson(
        _$USSDPaymentResponseImpl instance) =>
    <String, dynamic>{
      'charge_type': instance.charge_type,
      'amount': instance.amount,
      'currency': instance.currency,
      'payment_channel': instance.payment_channel,
      'ussd': instance.ussd,
      'reference_code': instance.reference_code,
    };

_$USSDInfoImpl _$$USSDInfoImplFromJson(Map<String, dynamic> json) =>
    _$USSDInfoImpl(
      status: json['status'] as String,
      display_text: json['display_text'] as String,
      reference: json['reference'] as String,
      ussd_code: json['ussd_code'] as String,
    );

Map<String, dynamic> _$$USSDInfoImplToJson(_$USSDInfoImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'display_text': instance.display_text,
      'reference': instance.reference,
      'ussd_code': instance.ussd_code,
    };
