// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardItemImpl _$$LeaderboardItemImplFromJson(
        Map<String, dynamic> json) =>
    _$LeaderboardItemImpl(
      username: json['username'] as String,
      user_profile_image: json['user_profile_image'] as String?,
      fullname: json['fullname'] as String? ?? 'User',
      country: json['country'] as String? ?? 'Nigeria',
      date: json['date'] as String?,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$LeaderboardItemImplToJson(
        _$LeaderboardItemImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'user_profile_image': instance.user_profile_image,
      'fullname': instance.fullname,
      'country': instance.country,
      'date': instance.date,
      'score': instance.score,
    };

_$LastWeeksWinnersImpl _$$LastWeeksWinnersImplFromJson(
        Map<String, dynamic> json) =>
    _$LastWeeksWinnersImpl(
      username: json['username'] as String,
      user_profile_image: json['user_profile_image'] as String?,
      fullname: json['fullname'] as String,
      country: json['country'] as String? ?? 'Nigeria',
      date: json['date'] as String?,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$LastWeeksWinnersImplToJson(
        _$LastWeeksWinnersImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'user_profile_image': instance.user_profile_image,
      'fullname': instance.fullname,
      'country': instance.country,
      'date': instance.date,
      'score': instance.score,
    };
