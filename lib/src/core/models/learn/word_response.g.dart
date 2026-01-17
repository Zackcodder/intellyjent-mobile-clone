// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordResponseImpl _$$WordResponseImplFromJson(Map<String, dynamic> json) =>
    _$WordResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => WordData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WordResponseImplToJson(_$WordResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

_$WordDataImpl _$$WordDataImplFromJson(Map<String, dynamic> json) =>
    _$WordDataImpl(
      id: json['id'] as String,
      word: json['word'] as String,
      meaning: json['meaning'] as String,
    );

Map<String, dynamic> _$$WordDataImplToJson(_$WordDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'meaning': instance.meaning,
    };
