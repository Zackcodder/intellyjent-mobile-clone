// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affiliate_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AffiliateInfoImpl _$$AffiliateInfoImplFromJson(Map<String, dynamic> json) =>
    _$AffiliateInfoImpl(
      userId: json['user_id'] as String,
      signupsByDate: SignupsByDate.fromJson(
          json['signups_by_date'] as Map<String, dynamic>),
      commissionByDate: CommissionByDate.fromJson(
          json['commission_by_date'] as Map<String, dynamic>),
      bankCode: json['bank_code'] as String?,
      accountName: json['account_name'] as String?,
      accountNumber: json['account_number'] as String?,
      id: json['id'] as String,
      balance: (json['balance'] as num).toDouble(),
      totalCommissionEarned:
          (json['total_commission_earned'] as num).toDouble(),
      commission: (json['commission'] as num).toDouble(),
      totalSignups: json['total_signups'] as int,
      oldTransferPin: json['old_transfer_pin'] as String?,
      transferPin: json['transfer_pin'] as String?,
      pinStatus: json['pin_status'] as bool?,
    );

Map<String, dynamic> _$$AffiliateInfoImplToJson(_$AffiliateInfoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'signups_by_date': instance.signupsByDate,
      'commission_by_date': instance.commissionByDate,
      'bank_code': instance.bankCode,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
      'id': instance.id,
      'balance': instance.balance,
      'total_commission_earned': instance.totalCommissionEarned,
      'commission': instance.commission,
      'total_signups': instance.totalSignups,
      'old_transfer_pin': instance.oldTransferPin,
      'transfer_pin': instance.transferPin,
      'pin_status': instance.pinStatus,
    };

_$SignupsByDateImpl _$$SignupsByDateImplFromJson(Map<String, dynamic> json) =>
    _$SignupsByDateImpl(
      yearlySignups: json['yearly_signups'] as int,
      monthlySignups: json['monthly_signups'] as int,
      weeklySignups: json['weekly_signups'] as int,
    );

Map<String, dynamic> _$$SignupsByDateImplToJson(_$SignupsByDateImpl instance) =>
    <String, dynamic>{
      'yearly_signups': instance.yearlySignups,
      'monthly_signups': instance.monthlySignups,
      'weekly_signups': instance.weeklySignups,
    };

_$CommissionByDateImpl _$$CommissionByDateImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionByDateImpl(
      yearlyCommission: (json['yearly_commission'] as num).toDouble(),
      monthlyCommission: (json['monthly_commission'] as num).toDouble(),
      weeklyCommission: (json['weekly_commission'] as num).toDouble(),
    );

Map<String, dynamic> _$$CommissionByDateImplToJson(
        _$CommissionByDateImpl instance) =>
    <String, dynamic>{
      'yearly_commission': instance.yearlyCommission,
      'monthly_commission': instance.monthlyCommission,
      'weekly_commission': instance.weeklyCommission,
    };
