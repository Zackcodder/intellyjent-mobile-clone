import 'package:freezed_annotation/freezed_annotation.dart';

part 'learn.freezed.dart';
// part 'learn.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String id,
    required String title,
    required String body,
    required String category,
    @JsonKey(name: 'image_url', defaultValue: '') required String imageUrl,
    required int likes,
    @Default(0) int views,
    @JsonKey(name: 'idioms_1', defaultValue: '') required String idioms1,
    @JsonKey(name: 'idioms_2', defaultValue: '') required String idioms2,
    @JsonKey(name: 'idioms_3', defaultValue: '') required String idioms3,
    @JsonKey(name: 'new_word_1', defaultValue: '') String? newWord1,
    @JsonKey(name: 'new_word_2', defaultValue: '') String? newWord2,
    @JsonKey(name: 'new_word_3', defaultValue: '') String? newWord3,
    required bool read,
    required bool liked,
    required bool archived,
    @JsonKey(name: 'sillver_count') required int silverCount,
    @JsonKey(name: 'words_idioms_sillver_count') required int wordsIdiomsSillverCount,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) {
    return _Article(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      category: json['category'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      likes: json['likes'] as int? ?? 0,
      views: json['views'] as int? ?? 0,
      idioms1: json['idioms_1'] as String? ?? '',
      idioms2: json['idioms_2'] as String? ?? '',
      idioms3: json['idioms_3'] as String? ?? '',
      newWord1: json['new_word_1'] as String? ?? '',
      newWord2: json['new_word_2'] as String? ?? '',
      newWord3: json['new_word_3'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      liked: json['liked'] as bool? ?? false,
      archived: json['archived'] as bool? ?? false,
      silverCount: json['sillver_count'] as int? ?? 0,
      wordsIdiomsSillverCount: json['words_idioms_sillver_count'] as int? ?? 0,
    );
  }
}
