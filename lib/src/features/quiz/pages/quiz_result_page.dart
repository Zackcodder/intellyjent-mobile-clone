import 'dart:io';
import '../../../core/core.dart';

class QuizResultPage extends StatefulWidget {
  const QuizResultPage({super.key, required this.quizResult});

  final QuizResult quizResult;

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final controller = Get.put(LeaderBoardController());
    controller.onInit();
    final ProfilePageController user = Get.put(ProfilePageController());
    user.getUserData();

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppBg,
      body: SingleChildScrollView(
        child: Container(
          padding: MediaQuery.of(context).size.width < 800
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 51),
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //screenshot area
              Screenshot(
                controller: screenshotController,
                child: Container(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.white
                      : AppColor.darkAppBg,
                  child: Column(
                    children: [
                      Text(
                        'Quiz Results',
                        style: AppTextStyle.h5(context)
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      AppSizing.h32,
                      buildWinArea(screenWidth, screenHeight, context),
                      AppSizing.h32,
                      //stats
                      Container(
                        width: screenWidth,
                        height: screenHeight < 670
                            ? screenHeight * 0.25
                            : screenHeight * 0.2,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.lightYellow,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // questions answered
                                ResultWidget(
                                  alignment: Alignment.topLeft,
                                  title: 'Questions Answered',
                                  score:
                                      '${widget.quizResult.questionsAnswered}',
                                  circleColor: AppColor.appColor,
                                ),
                                ResultWidget(
                                  alignment: Alignment.topLeft,
                                  title: 'Wrong',
                                  score: '${widget.quizResult.wrong}',
                                  circleColor: AppColor.red,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // score and skipped
                                ResultWidget(
                                  alignment: Alignment.topLeft,
                                  title: 'Correct',
                                  score: '${widget.quizResult.correct}',
                                  circleColor: AppColor.green,
                                  scoreFontWeight: FontWeight.bold,
                                ),
                                ResultWidget(
                                  alignment: Alignment.topLeft,
                                  title: 'Skipped',
                                  score: '${widget.quizResult.skipped}',
                                  circleColor: AppColor.appBlack,
                                  scoreFontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSizing.h40,
              // section 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //play again
                  Column(
                    children: [
                      CircleButtons(
                          svgImg: Assets.assetsBackward5Seconds,
                          title: 'Play Again',
                          onTap: () => Get.to(() {
                                Get.delete<QuizQuestionsController>();
                                return const QuizQuestionsPage();
                              })),
                      AppSizing.h42,
                      CircleButtons(
                        svgImg: Assets.assetsHome2,
                        title: 'Home',
                        onTap: () {
                          Get.delete<QuizQuestionsController>();
                          Get.off(() => const Root());
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleButtons(
                        svgImg: Assets.assetsBookSaved,
                        title: 'Review',
                        onTap: () => widget.quizResult.questionsAnswered == 0
                            ? null
                            : Get.to(() {
                                return const QuestionReviewPage();
                              }),
                      ),
                      AppSizing.h42,
                      CircleButtons(
                          svgImg: Assets.assetsBlackAward,
                          title: 'Rank',
                          onTap: () => Get.to(() {
                                return const LeaderboardPage(
                                  showBackButton: true,
                                );
                              })),
                    ],
                  ),
                  Column(
                    children: [
                      CircleButtons(
                        svgImg: Assets.assetsShare,
                        title: 'Share',
                        onTap: () => _screenshotShare(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildWinArea(
      double screenWidth, double screenHeight, BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.appColor
            : AppColor.darkContainer,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // circles
          Positioned(
            top: screenHeight * 0.02,
            right: -screenWidth * 0.12,
            child: GlowingWidget(
                milliseconds: 700,
                child: Container(
                  width: screenWidth < 800 ? 104 : 154,
                  height: screenWidth < 800 ? 104 : 154,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.lightBlue,
                  ),
                )),
          ),
          Positioned(
            bottom: screenHeight * 0.02,
            left: -screenWidth * 0.12,
            child: GlowingWidget(
              milliseconds: 700,
              child: Container(
                width: screenWidth < 800 ? 114 : 164,
                height: screenWidth < 800 ? 114 : 164,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightBlue,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.03,
            left: screenWidth * 0.12,
            child: GlowingWidget(
              milliseconds: 700,
              child: Container(
                width: screenWidth < 800 ? 27 : 87,
                height: screenWidth < 800 ? 27 : 87,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.yellow,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.02,
            right: screenWidth * 0.13,
            child: GlowingWidget(
              milliseconds: 400,
              child: Container(
                width: screenWidth < 800 ? 49 : 99,
                height: screenWidth < 800 ? 49 : 99,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightYellow,
                ),
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                screenHeight < 670 ? AppSizing.h08 : const SizedBox.shrink(),
                SvgPicture.asset(
                  Assets.assetsAward,
                  width: screenHeight < 670 ? 40.0 : 62.0,
                  height: screenHeight < 670 ? 40.0 : 62.0,
                ),
                // congratulations
                Text(
                  widget.quizResult.score <= 5
                      ? 'Try again!'
                      : 'Congratulations!',
                  style: AppTextStyle.h3Regular(context).copyWith(
                      color: Colors.white,
                      fontSize: screenHeight < 670 ? 20 : null),
                ),
                screenHeight < 670 ? AppSizing.h04 : AppSizing.h18,
                Text(
                  'YOUR SCORE',
                  style: AppTextStyle.bodySmallHeavy(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.28),
                ),
                Text(
                  (widget.quizResult.score).toString(),
                  style: AppTextStyle.h4(context).copyWith(
                      fontSize: screenHeight < 670 ? 20 : null,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _screenshotShare() async {
    final imageFile = await screenshotController.capture();
    if (imageFile != null) {
      // Save the image to a temporary file
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/screenshot.png';

      await File(filePath).writeAsBytes(imageFile);

      // Create an XFile from the temporary file
      final xFile = XFile(filePath);

      await Share.shareXFiles([xFile],
          text:
              'I scored ${widget.quizResult.score} on Intellyjent. Download the App to compete for the grand prize! \n https://play.google.com/store/apps/details?id=com.intellyjent.intellyjent');
    } else {
      print('Error capturing screenshot');
    }
  }
}
