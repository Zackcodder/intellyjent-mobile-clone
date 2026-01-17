class Word {
  final String id;
  final String word;
  final String meaning;

  Word({required this.id, required this.word, required this.meaning});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'],
      word: json['word'],
      meaning: json['meaning'],
    );
  }
}

class WordPagination {
  final int count;
  final String? next;
  final String? previous;
  final List<Word> results;

  WordPagination({required this.count, this.next, this.previous, required this.results});

  factory WordPagination.fromJson(Map<String, dynamic> json) {
    return WordPagination(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List).map((i) => Word.fromJson(i)).toList(),
    );
  }
}
