import 'package:freezed_annotation/freezed_annotation.dart';

part 'affiliate_info.freezed.dart';
part 'affiliate_info.g.dart';

@freezed
class AffiliateInfo with _$AffiliateInfo {
  const factory AffiliateInfo({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'signups_by_date') required SignupsByDate signupsByDate,
    @JsonKey(name: 'commission_by_date') required CommissionByDate commissionByDate,
    @JsonKey(name: 'bank_code') String? bankCode,
    @JsonKey(name: 'account_name') String? accountName,
    @JsonKey(name: 'account_number') String? accountNumber,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'balance') required double balance,
    @JsonKey(name: 'total_commission_earned') required double totalCommissionEarned,
    @JsonKey(name: 'commission') required double commission,
    @JsonKey(name: 'total_signups') required int totalSignups,
    @JsonKey(name: 'old_transfer_pin') required String? oldTransferPin,
    @JsonKey(name: 'transfer_pin') required String? transferPin,
    @JsonKey(name: 'pin_status') required bool? pinStatus,
  }) = _AffiliateInfo;

  factory AffiliateInfo.fromJson(Map<String, dynamic> json) => AffiliateInfo(
    userId: json['user_id'] as String,
    signupsByDate: SignupsByDate.fromJson(json['signups_by_date'] as Map<String, dynamic>),
    commissionByDate: CommissionByDate.fromJson(json['commission_by_date'] as Map<String, dynamic>),
    bankCode: json['bank_code'] as String?,
    accountName: json['account_name'] as String?,
    accountNumber: json['account_number'] as String?,
    id: json['id'] as String,
    balance: double.parse(json['balance'] as String),
    oldTransferPin: json['old_transfer_pin'] as String?,
    transferPin: json['transfer_pin'] as String?,
    pinStatus: json['pin_status'] as bool?,
    totalCommissionEarned: double.parse(json['total_commission_earned'] as String),
    commission: double.parse(json['commission'] as String),
    totalSignups: json['total_signups'] as int,
  );
}

@freezed
class SignupsByDate with _$SignupsByDate {
  const factory SignupsByDate({
    @JsonKey(name: 'yearly_signups') required int yearlySignups,
    @JsonKey(name: 'monthly_signups') required int monthlySignups,
    @JsonKey(name: 'weekly_signups') required int weeklySignups,
  }) = _SignupsByDate;

  factory SignupsByDate.fromJson(Map<String, dynamic> json) => _$SignupsByDateFromJson(json);
}

@freezed
class CommissionByDate with _$CommissionByDate {
  const factory CommissionByDate({
    @JsonKey(name: 'yearly_commission') required double yearlyCommission,
    @JsonKey(name: 'monthly_commission') required double monthlyCommission,
    @JsonKey(name: 'weekly_commission') required double weeklyCommission,
  }) = _CommissionByDate;

  factory CommissionByDate.fromJson(Map<String, dynamic> json) => _$CommissionByDateFromJson(json);
}
