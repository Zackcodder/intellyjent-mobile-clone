import '../../../core/core.dart';

class QuizQuestionsPage extends StatelessWidget {
  const QuizQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final ctl = Get.put(QuizQuestionsController());
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Obx(
      ()=> Scaffold(
        appBar: ctl.isLoading.value
            ? null
            : (() { return AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          backgroundColor: Get.theme.brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkAppBg,
                title:
                //question and timer row
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Q',
                          style: AppTextStyle.h3Regular(context),
                        ),
                        Obx(
                          () {
                            final qtn = ctl.currentQuestionIndex.value + 1;
                            return Text(
                              qtn.toString(),
                              style: AppTextStyle.h4Regular(context),
                            );
                          },
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.appColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: MediaQuery.of(context).size.width < 850
                          ? const EdgeInsets.fromLTRB(6, 6, 8, 6)
                          : const EdgeInsets.fromLTRB(12, 12, 16, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            Assets.assetsClock,
                            width: 30.0,
                            height: 30.0,
                          ),
                          AppSizing.w04,
                          Obx(() {
                            final minutes = (ctl.countdown.value.inMinutes % 60)
                                .toString()
                                .padLeft(2, '0');
                            final seconds = (ctl.countdown.value.inSeconds % 60)
                                .toString()
                                .padLeft(2, '0');
                            return Text(
                              '$minutes:$seconds',
                              style: AppTextStyle.h4Regular(context)
                                  .copyWith(color: Colors.white),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ); })(),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        body: SingleChildScrollView(
          child: ctl.isLoading.value
              ? 
              ///loading screen
              const GameLoadingPage()
              : (() {
                  if (ctl.quizQuestions.isEmpty &&
                      ctl.isSillverFinished.value == false) {
                    // Handle error state
                    Future.microtask(() {
                      Get.to(
                        () => const Root(), transition: Transition.upToDown
                      );
                    });
                    return Container();
                  } else if (ctl.isSillverFinished.value == true) {
                    return Container();
                  } else {
                    return buildMainContent(screenWidth, context, ctl);
                  }
                })(),
        ),
      ),
    );
  }

  Container buildMainContent(
      double screenWidth, BuildContext context, QuizQuestionsController ctl) {
    return Container(
      width: screenWidth,
      padding: MediaQuery.of(context).size.width <800
          ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
          : const EdgeInsets.symmetric(horizontal: 40, vertical: 41),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///flutter aniation progress bar for showing the
          ///progress of the questions as the user answers
          Obx(
            ()=> FAProgressBar(
              currentValue: ((5 * 60) - ctl.countdown.value.inSeconds).toDouble(),
              size: 10,
              maxValue: (5 * 60).toDouble(),
              backgroundColor: Colors.white,
              progressColor: ctl.countdown.value.inSeconds <= 60
                  ? AppColor.red
                  : AppColor.appColor,
              border: Border.all(
                color: AppColor.grey,
              ),
              animatedDuration: const Duration(milliseconds: 300),
              direction: Axis.horizontal,
            ),
          ),
          
          AppSizing.h40,
          /// 50/50 button and skip question button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    /// button and function for removing 2 wrng answers
                    /// and leaving 1 coorect and 1 wrng answers (50/50)
                   
                  Column(
                    children: [
                        ///50/50 button
                      GestureDetector(
                        onTap: ()=> ctl.disableTwoButtons(),
                        child: SvgPicture.asset(
                          ctl.headOrTail.value < 3 ? Assets.assetsHeadTailIcon : Assets.assetsHeadTailUnselectedIcon,
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                     ///text display
                      Obx(
                            () => Text(
                          (ctl.headOrTail.value).toString(),
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.appNumbers
                                  : AppColor.white,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  // skipped function
                  AppSizing.w18,
                  Column(
                    children: [
                        ///skip button
                      GestureDetector(
                        onTap: (){
                          if(ctl.skipped.value < 3){

                            ctl.skippedQuestion();
                          }
                          } ,
                        child: SvgPicture.asset(
                          ctl.skipped.value < 3 ? Assets.assetsSkipIcon : Assets.assetsSkipUnselectedIcon,
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      Obx(
                            () => Text(
                          (ctl.skipped.value).toString(),
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColor.appNumbers
                                  : AppColor.white,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //correct
                  Column(
                    children: [
                      Text(
                        'Correct',
                        style: AppTextStyle.bodySmallHeavy(context)
                            .copyWith(color: AppColor.green),
                      ),
                      Obx(
                        () => Text(
                          (ctl.correct.value).toString(),
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? AppColor.appNumbers
                                      : AppColor.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  AppSizing.w18,
                  // failed
                  Column(
                    children: [
                      Text(
                        'Failed',
                        style: AppTextStyle.bodySmallHeavy(context)
                            .copyWith(color: AppColor.red),
                      ),
                      Obx(
                        () => Text(
                          (ctl.wrong.value).toString(),
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? AppColor.appNumbers
                                      : AppColor.white,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  AppSizing.w18,
                  // points
                  Column(
                    children: [
                      Text(
                        'Points',
                        style: AppTextStyle.bodySmallHeavy(context)
                            .copyWith(color: AppColor.appColor),
                      ),
                      Obx(
                        () => Text(
                          (ctl.score.value).toString(),
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              color:
                                  Theme.of(context).brightness == Brightness.light
                                      ? AppColor.appNumbers
                                      : AppColor.white,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          AppSizing.h20,
          
          ///quiz questions display text
          /// this is where the quiz question are displayed
          SizedBox(
            child: Text(
              textAlign: TextAlign.justify,
              ctl.quizQuestions[ctl.currentQuestionIndex.value].question,
              // "${ctl.currentQuestionIndex.value + 1}/${ctl.quizQuestions.length}",
              style: AppTextStyle.h5(context).copyWith(
                fontWeight: FontWeight.w100,
                // letterSpacing: 0.4,
              ),
            ),
          ),
          AppSizing.h32,
           /// this is where the options to the questions are shown
          /// for the user to be able to tap on it to selecte the option
          
          for (int i = 0; i < 4; i++)
            QuizButtonWidget(
              buttonText: ctl.getOptionByIndex(
                  ctl.quizQuestions[ctl.currentQuestionIndex.value], i),
              fontSize: 16,
              onPressed: () {
                ctl.checkAnswer(i);
              },
              controller: ctl,
              index: i,
              correctOption: ctl.isOptionCorrect(i),
            ),
          AppSizing.h40,
          //quite quiz skip
          FooterWidgetQuiz(
            leftText: 'Quit Quiz',
            buttonText: 'Skip',
            onPressedButton: () => ctl.skippedQuestion(),
            onPressedLeft: () => ctl.quitQuiz(),
            controller: ctl,
          ),
          AppSizing.h20,
        ],
      ),
    );
  }
}
