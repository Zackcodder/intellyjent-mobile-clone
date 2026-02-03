// Constants for gem types to avoid typos
class GemTypes {
  static const String emerald = 'Emerald';
  static const String ruby = 'Ruby';
  static const String diamond = 'Launchpad';
  static const String sapphire = 'Sapphire';

  // Helper method to check if a string is a valid gem type
  static bool isValidGemType(String type) {
    return type == emerald ||
        type == ruby ||
        type == diamond ||
        type == sapphire;
  }

  // Get all gem types as a list
  static List<String> getAllTypes() {
    return [emerald, ruby, diamond, sapphire];
  }
}
