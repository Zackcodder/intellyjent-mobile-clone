import 'package:freezed_annotation/freezed_annotation.dart';

part 'idiom_response.freezed.dart';
part 'idiom_response.g.dart';

@freezed
class IdiomResponse with _$IdiomResponse {
  const factory IdiomResponse({
    required List<IdiomData> results,
  }) = _IdiomResponse;

  factory IdiomResponse.fromJson(Map<String, dynamic> json) => _$IdiomResponseFromJson(json);
}

@freezed
class IdiomData with _$IdiomData {
  const factory IdiomData({
    required String idiom,
    required String meaning,
  }) = _IdiomData;

  factory IdiomData.fromJson(Map<String, dynamic> json) => _$IdiomDataFromJson(json);
}
