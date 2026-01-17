class Idiom {
  final String id;
  final String idiom;
  final String meaning;

  Idiom({required this.id, required this.idiom, required this.meaning});

  factory Idiom.fromJson(Map<String, dynamic> json) {
    return Idiom(
      id: json['id'],
      idiom: json['idiom'],
      meaning: json['meaning'],
    );
  }
}

class IdiomPagination {
  final int count;
  final String? next;
  final String? previous;
  final List<Idiom> results;

  IdiomPagination({required this.count, this.next, this.previous, required this.results});

  factory IdiomPagination.fromJson(Map<String, dynamic> json) {
    return IdiomPagination(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List).map((i) => Idiom.fromJson(i)).toList(),
    );
  }
}
