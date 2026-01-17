import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_response.freezed.dart';
part 'word_response.g.dart';

@freezed
class WordResponse with _$WordResponse {
  const factory WordResponse({
    required List<WordData> results,
  }) = _WordResponse;

  factory WordResponse.fromJson(Map<String, dynamic> json) => _$WordResponseFromJson(json);
}

@freezed
class WordData with _$WordData {
  const factory WordData({
    required String id,
    required String word,
    required String meaning,
  }) = _WordData;

  factory WordData.fromJson(Map<String, dynamic> json) => _$WordDataFromJson(json);
}
