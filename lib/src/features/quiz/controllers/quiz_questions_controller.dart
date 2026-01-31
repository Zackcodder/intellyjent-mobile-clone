import '../../../core/core.dart';

// ignore_for_file: curly_braces_in_flow_control_structures

class QuizQuestionsController extends GetxController {
  RxInt currentQuestionIndex = 0.obs;
  RxInt updateScoreCount = 0.obs;
  RxBool isQuizOver = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSillverFinished = false.obs;
  bool disableButtonsExecuted = false;

  RxList<RxBool> buttonStates = List.generate(
    4,
    (index) => false.obs,
  ).obs;
  RxBool enableButtons = true.obs;

  late RxList<QuizQuestion> quizQuestions = <QuizQuestion>[].obs;
  late Quiz quiz = Quiz.fromJson({}); //quiz questions from api

  late Rx<QuizResult> quizResult = QuizResult(
    score: score.value,
    questionsAnswered: questionsAnswered.value,
    correct: correct.value,
    wrong: wrong.value,
    skipped: skipped.value,
  ).obs; //total result that keeps incrementing as questions are answered

  late RxList<String> answeredQuestionIds = <String>[].obs;

  // Variables for the countdown timer
  Rx<Duration> countdown = const Duration(minutes: 5).obs;

  bool timerExpired = false;
  @override
  void onInit() {
    super.onInit();
    loadQuiz();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkQuizStatusOnResume();
    });
  }

  Future<void> checkQuizStatusOnResume() async {
    if (isQuizOver.value) {
      // Quiz is already over, navigate to the result page
      Get.off(() => QuizResultPage(quizResult: quizResult.value));
      await quitQuiz();
    } else if (countdown.value.inSeconds <= 0) {
      // Quiz time has already expired, end the quiz
      endQuizDueToExpiredTime();
    } else {
      // Resume the countdown
    }
  }

  Future<void> endQuizDueToExpiredTime() async {
    await quitQuiz();
    isQuizOver.value = true;
  }

  //load quis function
  Future<void> loadQuiz() async {
    print("loading quiz");
    isLoading.value = true;

    Map<String, dynamic> requestQuery = {
      "user": UserData.userId,
    };

    try {
      // Use this controller's selectedGem, not the profile controller
      String quizPath;
      final ProfilePageController profileController = Get.find();
      String gemType = profileController.selectedGem.value.name.toLowerCase();

      print("Loading quiz for gem type: $gemType"); // Debug print

      switch (gemType) {
        case 'ruby':
          quizPath = 'start-game-ruby-mode';
          break;
        case 'launchpad':
          quizPath = 'start-game-launchpad-mode';
          break;
        case 'sapphire':
          quizPath = 'start-game-sapphire-mode';
          break;
        default:
          quizPath = 'start-game';
      }
      print('Response from API start');

      ///https://test.intellyjent.com/api/v1/bookchamp/games/start-game

      var response = await HttpHelper.instance.postRequestQuizQuestions(
        "bookchamp/games/$quizPath",
        body: requestQuery,
      );

      print('Response from API: $response');

      if (response is Map<String, dynamic> &&
          response.containsKey("status") &&
          response["status"] == 201) {
        Map<String, dynamic> responseData = response["message"] ?? {};

        if (responseData.isNotEmpty && responseData.containsKey('questions')) {
          quiz = Quiz.fromJson(responseData);

          final List<QuizQuestion> arrangedQuestions = [];
          final Set<String> usedQuestionIds = {};

          final List<String> categories = categorySequence();
          final List<String> difficulties =
              difficultySequence(39); // you can change total here

          int addedCount = 0;

          for (String category in categories) {
            if (quiz.questions.containsKey(category)) {
              final categoryData = quiz.questions[category];

              for (String difficulty in difficulties) {
                List<QuizQuestion> pool = [];

                if (difficulty == 'easy')
                  pool = categoryData!.easy;
                else if (difficulty == 'moderate')
                  pool = categoryData!.moderate;
                else if (difficulty == 'difficult')
                  pool = categoryData!.difficult;

                for (QuizQuestion question in pool) {
                  if (!usedQuestionIds.contains(question.id)) {
                    arrangedQuestions.add(question);
                    usedQuestionIds.add(question.id);
                    addedCount++;
                    break; // Add one question per difficulty per category
                  }
                }

                if (addedCount >= difficulties.length) break;
              }
            }

            if (addedCount >= difficulties.length) break;
          }

          if (arrangedQuestions.isEmpty) {
            throw Exception(
                "No questions matched the category/difficulty pattern.");
          }

          quizQuestions.value = List.from(arrangedQuestions);
          await QuizQuestionsStorage.clearAllQuestions();
          await UserAnsweredQuestions.clearAnsweredQuestions();

          final List<Map<String, dynamic>> questionMaps =
              arrangedQuestions.map((q) => q.toJson()).toList();
          await QuizQuestionsStorage.saveAllQuestions(questionMaps);

          print('✅ Arranged quiz questions: ${arrangedQuestions.length}');
          startCountdown();
        } else {
          // Get.dialog(
          // Dialog(
          // backgroundColor: Colors.transparent,
          // surfaceTintColor: Colors.transparent,
          // clipBehavior: Clip.none,
          // insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          // child: PopScope(
          // canPop: false,
          // child: AppDialog(
          // msg: 'Sorry 😢, you are out of Silver',
          // buttonText: 'Top up',
          // height: 230,
          // onTap: () {
          // Get.to(() => const TopUpPage());
          // },
          // isCancelButton: false,
          // ),
          // ),
          // ),
          // barrierDismissible: true,
          // );
        }
      } else {
        print('❌ Error response: $response');
      }
    } catch (e) {
      print('🚨 Error loading quiz: $e');
    } finally {
      isLoading.value = false;
    }
  }

  ///

  Future<void> checkAnswer(int selectedOptionIndex) async {
    final QuizQuestion currentQuestion =
        quizQuestions[currentQuestionIndex.value];

    print("===========");
    print("Current Index: ${currentQuestionIndex.value}");
    print("Total Questions: ${quizQuestions.length}");
    print("Question: ${currentQuestion.question}");
    print("Selected Option Index: $selectedOptionIndex");
    print(
        "Selected Option: ${getOptionByIndex(currentQuestion, selectedOptionIndex)}");
    print("Correct Answer: ${currentQuestion.answer}");
    print("question difficulty: ${currentQuestion.difficulty}");

    if (!answeredQuestionIds.contains(currentQuestion.id)) {
      answeredQuestionIds.add(currentQuestion.id);

      await UserAnsweredQuestions.addAnsweredQuestion(
        currentQuestion.id,
        getOptionByIndex(currentQuestion, selectedOptionIndex),
        currentQuestionIndex.value,
      );

      if (selectedOptionIndex >= 0 &&
          selectedOptionIndex < 4 &&
          getOptionByIndex(currentQuestion, selectedOptionIndex) ==
              currentQuestion.answer) {
        // ✅ Correct answer logic
        score.value += 5;
        correct.value++;
      } else {
        // ❌ Incorrect answer logic
        if (score.value > 0) score.value -= 1;
        wrong.value++;
      }

      questionsAnswered.value++;
      enableButtons.value = true;
      resetTapped();

      // ✅ Move to the next question if possible
      if (currentQuestionIndex.value < quizQuestions.length - 1) {
        currentQuestionIndex.value++;
        print("✅ Moving to question index: ${currentQuestionIndex.value}");
      } else {
        print("⚠️ Reached the last question. Ending quiz.");
        quizResult.value = QuizResult(
          score: score.value,
          questionsAnswered: questionsAnswered.value,
          correct: correct.value,
          wrong: wrong.value,
          skipped: skipped.value,
        );

        await quitQuiz();
        Get.off(() => QuizResultPage(quizResult: quizResult.value));
      }
    } else {
      print("⚠️ This question was already answered, skipping logic.");
    }
  }

  List<String> categorySequence() {
    return [
      'Academics',
      'Sports',
      'History',
      'Socials',
      'Science and Technology',
      'Lifestyle',
      'Finance',
      'Entertainment',
      'Politics',
      'Art',
      'Geography'
    ];
  }

  //algorithm to arrange the questions in a sequence
  List<String> difficultySequence(int totalQuestions) {
    List<String> sequence = [];
    int questionCounter = 0;
    while (questionCounter <= totalQuestions) {
      if (questionCounter <= 5) {
        sequence.add('easy');
      } else if (questionCounter <= 10) {
        sequence.add('moderate');
      } else if (questionCounter <= 15) {
        sequence.add('easy');
      } else if (questionCounter <= 20) {
        sequence.add('moderate');
      } else {
        sequence.add('difficult');
      }
      questionCounter++;
    }
    return sequence;
  }

  void startCountdown() {
    if (!isQuizOver.value) {
      countdown.value = const Duration(minutes: 3, seconds: 30);
      print('count down value ${countdown.value}');
      updateCountdown();
    }
  }

  Future<void> updateCountdown() async {
    while (countdown.value.inSeconds > 0 && !isQuizOver.value) {
      await Future.delayed(const Duration(seconds: 1));
      countdown.value = countdown.value - const Duration(seconds: 1);
      print('count down value ${countdown.value}');
    }

    if (!timerExpired) {
      isQuizOver.value = true;

      if (countdown.value.inSeconds <= 0 && isQuizOver.value) {
        countdown.value = Duration.zero;
        print('timer');
        await quitQuiz();
      }
    }
  }

  // Variables for scoring
  RxInt score = 0.obs;
  RxInt questionsAnswered = 0.obs;
  RxInt correct = 0.obs;
  RxInt wrong = 0.obs;
  RxInt skipped = 0.obs;
  RxInt headOrTail = 0.obs;

  bool isOptionCorrect(int optionIndex) {
    final QuizQuestion currentQuestion =
        quizQuestions[currentQuestionIndex.value];
    final String option = getOptionByIndex(currentQuestion, optionIndex);
    return option == currentQuestion.answer;
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

  void resetTapped() {
    for (var buttonState in buttonStates) {
      buttonState.value = false;
    }
    disableButtonsExecuted = false;
  }

  Future<void> skippedQuestion() async {
    if (currentQuestionIndex < quizQuestions.length - 1) {
      if (skipped.value < 3) {
        skipped.value++;
        currentQuestionIndex++;

        final QuizQuestion currentQuestion =
            quizQuestions[currentQuestionIndex.value];

        // Store the answered question
        await UserAnsweredQuestions.addAnsweredQuestion(
            currentQuestion.id, '', currentQuestionIndex.value);
        resetTapped();
      }
    } else {
      // Save the quiz result
      await quitQuiz();
    }
  }

  Future<void> disableTwoButtons() async {
    if (currentQuestionIndex.value < quizQuestions.length) {
      // Check if the disable operation has already been executed for the current question
      if (disableButtonsExecuted) {
        return; // Exit if buttons have already been disabled for this question
      }

      if (headOrTail < 3) {
        headOrTail++;

        // Get the current question
        final QuizQuestion currentQuestion =
            quizQuestions[currentQuestionIndex.value];

        // List to hold the indices of incorrect options
        List<int> incorrectOptions = [];

        // Populate the incorrectOptions list with indices of incorrect answers
        for (int i = 0; i < 4; i++) {
          final String option = getOptionByIndex(currentQuestion, i);
          if (option != currentQuestion.answer) {
            incorrectOptions.add(i);
          }
        }

        // Shuffle the list and disable two of the incorrect options
        if (incorrectOptions.length >= 2) {
          incorrectOptions.shuffle();
          buttonStates[incorrectOptions[0]].value =
              true; // Disable first incorrect option
          buttonStates[incorrectOptions[1]].value =
              true; // Disable second incorrect option
        }

        // Mark that the buttons have been disabled for this question
        disableButtonsExecuted = true;
      }
    } else {
      // Save the quiz result
      await quitQuiz();
    }
  }

  Future<void> resetQuiz() async {
    bool isScoreSaved = await updateScore();
    int count = 0;
    print(isScoreSaved);

    while (isScoreSaved == false && count < 2) {
      isScoreSaved = await updateScore();
      count++;
    }

    if (isScoreSaved) {
      if (questionsAnswered.value == 0 && score.value == 0) {
        quizResult.value = QuizResult(
          score: score.value,
          questionsAnswered: questionsAnswered.value,
          correct: correct.value,
          wrong: wrong.value,
          skipped: skipped.value,
        );
        Get.offAll(() => QuizResultPage(quizResult: quizResult.value));
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to update score after $count attempts.',
        backgroundColor: AppColor.red,
        textColor: AppColor.white,
      );
    }

    // Resetting quiz state
    currentQuestionIndex.value = 0;
    score.value = 0;
    questionsAnswered.value = 0;
    correct.value = 0;
    wrong.value = 0;
    skipped.value = 0;
    updateScoreCount.value = 0;
    isQuizOver.value = true;
    timerExpired = true;
    countdown.value = Duration.zero;
    resetTapped();
  }

  Future<void> quitQuiz() async {
    print('quit');
    quizResult.value = QuizResult(
      score: score.value,
      questionsAnswered: questionsAnswered.value,
      correct: correct.value,
      wrong: wrong.value,
      skipped: skipped.value,
    );

    Get.off(() => QuizResultPage(quizResult: quizResult.value));
    await resetQuiz();

    countdown.value = Duration.zero;
  }

  Future<bool> updateScore() async {
    await HttpHelper.instance.patchRequest(
      "bookchamp/games/${quiz.id}/end-game",
      body: {"score": score.value},
    ).then((value) async {
      if (value.status) {
        dynamic newScore = (value as SuccessResponse).result["score"];

        // Check if the new score is greater than the current UserData.score
        if (newScore != null) {
          Fluttertoast.showToast(
            msg: 'Score saved!',
            backgroundColor: AppColor.appColor,
            textColor: AppColor.white,
          );
          return true;
        }
      } else {
        Fluttertoast.showToast(
          msg: 'Error Saving score!',
          backgroundColor: AppColor.red,
          textColor: AppColor.white,
        );
        ErrorResponse errors = (value as ErrorResponse);

        print(errors.errors.isEmpty
            ? errors.message
            : errors.errors.first.errorMessage.first);
        return false;
      }
    });
    return true;
  }
}
