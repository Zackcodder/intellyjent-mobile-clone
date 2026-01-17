class Gem {
  final String name;
  final String imagePath;

  Gem({required this.name, required this.imagePath});
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Gem &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imagePath == other.imagePath;

  @override
  int get hashCode => name.hashCode ^ imagePath.hashCode;
}
