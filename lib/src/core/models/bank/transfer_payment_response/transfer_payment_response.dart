import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_payment_response.freezed.dart';
part 'transfer_payment_response.g.dart';

@freezed
class TransferPaymentResponse with _$TransferPaymentResponse {
  const factory TransferPaymentResponse({
    required String charge_type,
    required String amount,
    required String currency,
    required String payment_channel,
    required TransferDetails? transfer,
    required String reference_code,
  }) = _TransferPaymentResponse;

  factory TransferPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$TransferPaymentResponseFromJson(json);
}

@freezed
class TransferDetails with _$TransferDetails {
  const factory TransferDetails({
    required String status,
    required String display_text,
    required String reference,
    required int amount,
    required String account_name,
    required String account_number,
    required TitanPayStack bank,
    required DateTime account_expires_at,
  }) = _TransferDetails;

  factory TransferDetails.fromJson(Map<String, dynamic> json) =>
      _$TransferDetailsFromJson(json);
}

@freezed
class TitanPayStack with _$TitanPayStack {
  const factory TitanPayStack({
    required int id,
    required String slug,
    required String name,
  }) = _TitanPayStack;

  factory TitanPayStack.fromJson(Map<String, dynamic> json) => _$TitanPayStackFromJson(json);
}
