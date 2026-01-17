import 'package:freezed_annotation/freezed_annotation.dart';

part 'ussd_payment_response.freezed.dart';
part 'ussd_payment_response.g.dart';

@freezed
class USSDPaymentResponse with _$USSDPaymentResponse {
  factory USSDPaymentResponse({
    required String charge_type,
    required String amount,
    required String currency,
    required String payment_channel,
    required USSDInfo ussd,
    required String reference_code,
  }) = _USSDPaymentResponse;

  factory USSDPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$USSDPaymentResponseFromJson(json);
}

@freezed
class USSDInfo with _$USSDInfo {
  factory USSDInfo({
    required String status,
    required String display_text,
    required String reference,
    required String ussd_code,
  }) = _USSDInfo;

  factory USSDInfo.fromJson(Map<String, dynamic> json) =>
      _$USSDInfoFromJson(json);
}
