import '../../core/core.dart';
import 'dart:convert'; // Import this to use jsonEncode and jsonDecode
// ignore_for_file: deprecated_member_use

class QuizQuestionsStorage {
  static FlutterSecureStorage? storage;

  static init() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    storage = FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  static Future<List<QuizQuestion>> retrieveAllQuestions() async {
    if (storage == null) {
      init();
    }
    final String? questionsString = await storage!.read(key: 'all_questions');
    if (questionsString != null && questionsString.isNotEmpty) {
      final List<Map<String, dynamic>> questionMaps =
          List<Map<String, dynamic>>.from(jsonDecode(questionsString));

      print(questionMaps);
      return questionMaps
          .map((questionMap) => QuizQuestion.fromJson(questionMap))
          .toList();
    } else {
      return [];
    }
  }

  static Future<void> saveAllQuestions(
      List<Map<String, dynamic>> questions) async {
    if (storage == null) {
      init();
    }
    await storage!.write(key: 'all_questions', value: jsonEncode(questions));
  }

  static Future<void> clearAllQuestions() async {
    if (storage == null) {
      init();
    }
    await storage!.delete(key: 'all_questions');
  }
}
