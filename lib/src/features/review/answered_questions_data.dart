import 'package:get_storage/get_storage.dart';

class UserAnsweredQuestions {
  static GetStorage? storage;

  static init() async {
    GetStorage.init();
    storage = GetStorage();
  }


  static Map<String, dynamic> retrieveAnsweredQuestions() {
    if (storage == null) {
      init();
    }

    final Map<String, dynamic>? questionsMap = storage!.read('answered_questions');

    if (questionsMap == null || questionsMap.isEmpty) {
      storage!.write('answered_questions', {});
      return {};
    }

    return questionsMap;
  }

  static Future<void> addAnsweredQuestion(String questionId, String userAnswer, int questionNumber) async {
    if (storage == null) {
      init();
    }

    final Map<String, dynamic> answeredQuestions = retrieveAnsweredQuestions();

    answeredQuestions[questionId] = {
      'answer': userAnswer,
      'questionNumber': questionNumber + 1,
    };

    await storage!.write('answered_questions', answeredQuestions);
    print('map answers ${answeredQuestions[questionId]}');
  }
  static Future<void> clearAnsweredQuestions() async {
    if (storage == null) {
      init();
    }
    await storage!.remove('answered_questions');
  }
}
