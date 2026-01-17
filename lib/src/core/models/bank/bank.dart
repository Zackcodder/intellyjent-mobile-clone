import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';

@freezed
class Bank with _$Bank {
  const factory Bank({
    required int id,
    required String name,
    required String slug,
    required String code,
    required String longcode,
    required bool payWithBank,
    required bool supportsTransfer,
    required bool active,
    required String country,
    required String currency,
    required String type,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      code: json['code'] as String,
      longcode: json['longcode'] as String,
      payWithBank: json['pay_with_bank'] as bool,
      supportsTransfer: json['supports_transfer'] as bool,
      active: json['active'] as bool,
      country: json['country'] as String,
      currency: json['currency'] as String,
      type: json['type'] as String,
      isDeleted: json['is_deleted'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

}
