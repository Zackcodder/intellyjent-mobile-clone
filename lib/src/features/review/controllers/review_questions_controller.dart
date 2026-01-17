
import '../../../core/core.dart';
class QuestionReviewController extends GetxController {
  final questions = <QuizQuestion>[].obs;
  final answers = <String, dynamic>{}.obs;
  final buttonColorsMap = <String, RxList<Color?>>{}.obs;
  final borderColorsMap = <String, RxList<Color?>>{}.obs;
  RxInt currentQuestionIndex = 0.obs;
  RxBool isLoading = false.obs;

  Future<void> loadQuestions() async {
    isLoading.value = true;
    final List<QuizQuestion> loadedQuestions =
    await QuizQuestionsStorage.retrieveAllQuestions();
    questions.assignAll(loadedQuestions);
    print('answered questions $questions');

    await loadAnswers();
  }
  Future<void> loadAnswers() async {

    isLoading.value = false;
    final Map<String, dynamic> loadedAnswers = UserAnsweredQuestions.retrieveAnsweredQuestions();
    answers.assignAll(loadedAnswers);

    for (var question in questions) {
      buttonColorsMap[question.id] = RxList<Color?>(List.filled(4, Colors.transparent));
      borderColorsMap[question.id] = RxList<Color?>(List.filled(4, AppColor.grey200));

      final correctAnswer = question.answer;
      final userAnswer = answers[question.id]?['answer'];

      // Set user's selected option color
      for (int i = 0; i < 4; i++) {
        final selectedOption = getOptionByIndex(question, i);

        if (correctAnswer == selectedOption) {
          buttonColorsMap[question.id]![i] = AppColor.appColor;
          borderColorsMap[question.id]![i] = AppColor.appColor;
        }

        if (userAnswer == selectedOption) {
          if (userAnswer == correctAnswer) {
            buttonColorsMap[question.id]![i] = AppColor.green;
            borderColorsMap[question.id]![i] = AppColor.green;
          } else {
            buttonColorsMap[question.id]![i] = AppColor.red;
            borderColorsMap[question.id]![i] = AppColor.red;
          }
        }
      }
    }
  }

  // Future<void> loadAnswers() async {
  //   final Map<String, dynamic> loadedAnswers =
  //   UserAnsweredQuestions.retrieveAnsweredQuestions();
  //   answers.assignAll(loadedAnswers);
  //
  //   buttonColorsMap = RxMap<String, RxList<Color?>>(
  //     { for (var question in questions)
  //       question.id : RxList<Color?>() },
  //   );
  //
  //   print('runtyme ${buttonColorsMap.runtimeType}');
  //   // Get the correct answer for the current question
  //   final correctAnswer = questions[currentQuestionIndex.value].answer;
  //
  //   if (buttonColorsMap[questions[currentQuestionIndex.value].id] == null) {
  //     buttonColorsMap[questions[currentQuestionIndex.value].id] =
  //         RxList<Color?>([]);
  //   } else if (buttonColorsMap[questions[currentQuestionIndex.value].id] is! RxList<Color?>) {
  //     print('Error: buttonColorsMap is not an RxList<Color?>');
  //     return;
  //   }
  //
  //   // Compare answers and set button colors
  //   for (int i = 0; i < 4; i++) {
  //     final selectedOption =
  //     getOptionByIndex(questions[currentQuestionIndex.value], i);
  //     final userAnswer = answers[questions[currentQuestionIndex.value].id]['answer'];
  //
  //     if (answers.containsKey(questions[currentQuestionIndex.value].id) &&
  //         userAnswer ==
  //            ( correctAnswer == selectedOption)) {
  //       // User selected the correct answer: Set the button to green
  //       buttonColorsMap[questions[currentQuestionIndex.value].id]!
  //           .add(AppColor.green);
  //       print(buttonColorsMap);
  //     } else if (answers.containsKey(questions[currentQuestionIndex.value].id) &&
  //         (userAnswer == selectedOption ) &&
  //             (correctAnswer != userAnswer) ) {
  //       // User selected the incorrect answer: Set the button to red
  //       buttonColorsMap[questions[currentQuestionIndex.value].id]!
  //           .add(AppColor.red);
  //       print(buttonColorsMap);
  //     } else if (selectedOption != userAnswer && selectedOption != correctAnswer) {
  //       // Other options: Set to transparent
  //       buttonColorsMap[questions[currentQuestionIndex.value].id]!
  //           .add(Colors.transparent);
  //       print(buttonColorsMap);
  //     }else if (answers.containsKey(questions[currentQuestionIndex.value].id) &&
  //         (correctAnswer == selectedOption) && (correctAnswer != userAnswer) ){
  //       // correct option
  //       buttonColorsMap[questions[currentQuestionIndex.value].id]!
  //           .add(AppColor.appColor);
  //       print(buttonColorsMap);
  //     }
  //     else {
  //       // No answer selected: Set to transparent
  //       buttonColorsMap[questions[currentQuestionIndex.value].id]!
  //           .add(Colors.transparent);
  //     }
  //   }
  // }

  List<QuizQuestion> getQuestionsForAnswers() {
    // Create a list of questions based on the IDs in the answers map
    return answers.keys
        .map((id) => questions.firstWhere((question) => question.id == id))
        .toList();
  }

  String getOptionByIndex(QuizQuestion question, int index) {
    switch (index) {
      case 0:
        return question.option_1;
      case 1:
        return question.option_2;
      case 2:
        return question.option_3;
      case 3:
        return question.option_4;
      default:
        return '';
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < answers.length -1) {
      currentQuestionIndex++;
    }
  }
  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
    }
  }

}
