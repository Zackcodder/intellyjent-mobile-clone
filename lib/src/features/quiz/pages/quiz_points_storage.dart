import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore_for_file: deprecated_member_use

class ScoreStorage {
  static FlutterSecureStorage? storage;

  static init() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    storage = FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  // Save score with explicit gem type
  static Future<void> saveScore(String quizId, int score, String gemType,
      {DateTime? timestamp}) async {
    if (storage == null) {
      init();
    }

    // Enforce correct gem type capitalization
    gemType = _normalizeGemTypeName(gemType);

    print("Saving score for $gemType: $score");

    // Get existing scores for this gem type
    final gemKey = 'gem_${gemType.toLowerCase()}';
    List<Map<String, dynamic>> gemScores = [];

    // Read existing scores for this gem type
    final String? existingScores = await storage!.read(key: gemKey);
    if (existingScores != null && existingScores.isNotEmpty) {
      gemScores = List<Map<String, dynamic>>.from(jsonDecode(existingScores));
    }

    // Add new score
    gemScores.add({
      'quizId': quizId,
      'score': score,
      'timestamp': (timestamp ?? DateTime.now()).toIso8601String(),
    });

    // Save back
    await storage!.write(key: gemKey, value: jsonEncode(gemScores));

    print("Updated scores for $gemType: $gemScores");
  }

  // Get scores for a specific gem type
  static Future<List<Map<String, dynamic>>> getScoresForGemType(
      String gemType) async {
    if (storage == null) {
      init();
    }

    gemType = _normalizeGemTypeName(gemType);
    final gemKey = 'gem_${gemType.toLowerCase()}';

    final String? scoresJson = await storage!.read(key: gemKey);
    if (scoresJson != null && scoresJson.isNotEmpty) {
      return List<Map<String, dynamic>>.from(jsonDecode(scoresJson));
    }

    return [];
  }

  // Get highest score for a specific gem type
  static Future<int> getHighestScoreForGemType(String gemType) async {
    final scores = await getScoresForGemType(gemType);

    int highest = 0;
    for (var score in scores) {
      if (score['score'] > highest) {
        highest = score['score'];
      }
    }

    return highest;
  }

  // Normalize gem type names
  static String _normalizeGemTypeName(String name) {
    if (name.isEmpty) return "Unknown";

    name = name.trim();

    // Capitalize first letter
    name = name[0].toUpperCase() +
        (name.length > 1 ? name.substring(1).toLowerCase() : '');

    // Ensure it's one of our valid gem types
    if (['Emerald', 'Ruby', 'Launchpad', 'Sapphire'].contains(name)) {
      return name;
    }

    // Handle partial matches
    if (name.startsWith('E')) return 'Emerald';
    if (name.startsWith('R')) return 'Ruby';
    if (name.startsWith('L')) return 'Launchpad';
    if (name.startsWith('S')) return 'Sapphire';

    return name; // Return as-is if no match
  }

  // For backward compatibility
  static Future<List<Map<String, dynamic>>> getAllScores() async {
    if (storage == null) {
      init();
    }

    // Get scores for all gem types
    List<String> gemTypes = ['Emerald', 'Ruby', 'Launchpad', 'Sapphire'];
    List<Map<String, dynamic>> allScores = [];

    for (String gemType in gemTypes) {
      List<Map<String, dynamic>> scores = await getScoresForGemType(gemType);

      // Adds game type to each score
      for (var score in scores) {
        score['gameType'] = gemType;
      }

      allScores.addAll(scores);
    }

    // Sort by timestamp (most recent first)
    allScores.sort((a, b) {
      String aTime = a['timestamp'] ?? '';
      String bTime = b['timestamp'] ?? '';
      return bTime.compareTo(aTime);
    });

    return allScores;
  }

  // Migrate old scores
  static Future<void> migrateOldScores() async {
    if (storage == null) {
      init();
    }

    // Check for old format scores
    final String? oldScores = await storage!.read(key: 'saved_scores');
    if (oldScores == null || oldScores.isEmpty) {
      print("No old scores to migrate");
      return;
    }

    List<Map<String, dynamic>> scores =
        List<Map<String, dynamic>>.from(jsonDecode(oldScores));
    print("Found ${scores.length} scores to migrate");

    // Split scores among gem types
    List<String> gemTypes = ['Emerald', 'Ruby', 'Launchpad', 'Sapphire'];

    for (int i = 0; i < scores.length; i++) {
      var score = scores[i];
      // Distribute scores among gem types
      String gemType = gemTypes[i % gemTypes.length];

      await saveScore(
          score['quizId'] ?? 'unknown', score['score'] ?? 0, gemType,
          timestamp: score['timestamp'] != null
              ? DateTime.parse(score['timestamp'])
              : null);
    }

    // Clear old scores
    await storage!.delete(key: 'saved_scores');
    print("Migration complete!");
  }

  // Clear all scores (for testing)
  static Future<void> clearAllScores() async {
    if (storage == null) {
      init();
    }

    await storage!.delete(key: 'saved_scores');

    // Clear gem-specific scores
    for (String gemType in ['Emerald', 'Ruby', 'Launchpad', 'Sapphire']) {
      await storage!.delete(key: 'gem_${gemType.toLowerCase()}');
    }

    print("All scores cleared");
  }
}
