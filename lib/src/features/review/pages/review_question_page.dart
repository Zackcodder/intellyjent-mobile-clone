import '../../../core/core.dart';

class QuestionReviewPage extends StatelessWidget {
  const QuestionReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final QuestionReviewController ctl = Get.put(QuestionReviewController());
    ctl.loadQuestions();
    // print(
    //     "this is the image link: ${ctl.questions[ctl.currentQuestionIndex.value].note_image}");

    return Obx(() => Scaffold(
        appBar: !ctl.isLoading.value
            ? (() {
                return AppBar(
                  title: const HeaderWidget(
                    title: 'Review',
                  ),
                  automaticallyImplyLeading: false,
                  toolbarHeight: screenWidth > 800 ? 90 : null,
                  backgroundColor: Get.theme.brightness == Brightness.light
                      ? AppColor.white
                      : AppColor.darkAppBg,
                );
              })()
            : null,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColor.darkAppBg
            : AppColor.white,
        body: SingleChildScrollView(
          child: ctl.isLoading.value || ctl.questions.isEmpty
              ? const GameLoadingPage()
              : (() {
                  return Container(
                    padding: MediaQuery.of(context).size.width < 800
                        ? const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 41)
                        : const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 51),
                    width: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Q',
                              style: AppTextStyle.h3Regular(context),
                            ),
                            Text(
                              (ctl.currentQuestionIndex < ctl.answers.length)
                                  ? (ctl.answers[ctl.answers.keys.toList()[ctl
                                          .currentQuestionIndex
                                          .value]]['questionNumber'])
                                      .toString()
                                  : '',
                              style: AppTextStyle.h4Regular(context),
                            ),
                          ],
                        ),
                        AppSizing.h24,
                        Container(
                          width: screenWidth,
                          alignment: Alignment.center,
                          child: Text(
                            ctl.answers[ctl
                                        .questions[
                                            ctl.currentQuestionIndex.value]
                                        .id] !=
                                    null
                                ? ctl.questions[ctl.currentQuestionIndex.value]
                                    .question
                                : '',
                            style: AppTextStyle.h4Regular(context).copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.appBlack
                                    : AppColor.white),
                          ),
                        ),
                        AppSizing.h80,
                        //options
                        for (int i = 0; i < 4; i++)
                          ReviewButtonWidget(
                            buttonText: ctl.getOptionByIndex(
                                ctl.questions[ctl.currentQuestionIndex.value],
                                i),
                            fontSize: 16,
                            controller: ctl,
                            index: i,
                            buttonColor: ctl.buttonColorsMap[ctl
                                .questions[ctl.currentQuestionIndex.value]
                                .id]?[i],
                            borderColor: ctl.borderColorsMap[ctl
                                .questions[ctl.currentQuestionIndex.value]
                                .id]?[i],
                          ),
                        AppSizing.h40,
                        // image
                        ctl.questions[ctl.currentQuestionIndex.value]
                                        .note_image !=
                                    '' ||
                                ctl.questions[ctl.currentQuestionIndex.value]
                                        .note_image !=
                                    null ||
                                ctl.questions[ctl.currentQuestionIndex.value]
                                        .note_image !=
                                    'null'
                            ? SizedBox(
                                width: screenWidth,
                                height: screenHeight * 0.287,
                                child: Image.network(
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Column(
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: AppColor.red,
                                                ),
                                                Text(
                                                    "Error loading lmage, \nPlease, try again later.!!")
                                              ],
                                            ),
                                    // 'https://res.cloudinary.com/bookchamp/image/upload/v1739973797/dgob93l7hz6xyl1zqtwg.jpg',
                                    "https://res.cloudinary.com/bookchamp/${ctl.questions[ctl.currentQuestionIndex.value].note_image}",
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (
                                      BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress,
                                    ) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Center(
                                          child: LoadingAnimationWidget
                                              .threeArchedCircle(
                                                  color: AppColor.appColor,
                                                  size: 70),
                                        );
                                      }
                                    }),
                              )
                            : Container(),
                        // subtext
                        AppSizing.h16,
                        Text(
                          ctl.questions[ctl.currentQuestionIndex.value].notes,
                          style: AppTextStyle.bodySmallHeavy(context)
                              .copyWith(fontSize: 12),
                        ),
                        AppSizing.h20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => ctl.previousQuestion(),
                              child: SizedBox(
                                child: SvgPicture.asset(
                                  Assets.assetsArrowLeft,
                                  width: screenWidth < 800 ? null : 50,
                                  color: ctl.currentQuestionIndex > 0
                                      ? Get.theme.brightness == Brightness.light
                                          ? AppColor.appBlack
                                          : AppColor.white
                                      : AppColor.grey,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => ctl.nextQuestion(),
                              child: SizedBox(
                                  child: Transform.rotate(
                                angle: 3.141592653589793,
                                child: SvgPicture.asset(
                                  Assets.assetsArrowLeft,
                                  width: screenWidth < 800 ? null : 50,
                                  color: ctl.currentQuestionIndex <
                                          ctl.answers.length - 1
                                      ? Get.theme.brightness == Brightness.light
                                          ? AppColor.appBlack
                                          : AppColor.white
                                      : AppColor.grey,
                                ),
                              )),
                            ),
                          ],
                        ),
                        AppSizing.h56,
                        FooterWidget(
                          leftText: 'End',
                          buttonText: 'Play again',
                          onPressedButton: () => Get.off(
                            () {
                              return const QuizQuestionsPage();
                            },
                          ),
                          onPressedLeft: () {
                            Get.off(() => const Root());
                          },
                        ),
                        AppSizing.h12,
                      ],
                    ),
                  );
                })(),
        )));
  }
}
