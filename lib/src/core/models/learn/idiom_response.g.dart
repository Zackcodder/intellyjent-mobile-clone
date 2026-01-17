// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idiom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IdiomResponseImpl _$$IdiomResponseImplFromJson(Map<String, dynamic> json) =>
    _$IdiomResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => IdiomData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IdiomResponseImplToJson(_$IdiomResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

_$IdiomDataImpl _$$IdiomDataImplFromJson(Map<String, dynamic> json) =>
    _$IdiomDataImpl(
      idiom: json['idiom'] as String,
      meaning: json['meaning'] as String,
    );

Map<String, dynamic> _$$IdiomDataImplToJson(_$IdiomDataImpl instance) =>
    <String, dynamic>{
      'idiom': instance.idiom,
      'meaning': instance.meaning,
    };
