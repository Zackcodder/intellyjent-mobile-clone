import '../core/core.dart';

class FooterWidget extends StatelessWidget {
  final String leftText;
  final String buttonText;
  final VoidCallback onPressedButton;
  final VoidCallback onPressedLeft;
  const FooterWidget({
    super.key, required this.leftText, required this.buttonText, required this.onPressedButton, required this.onPressedLeft,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onPressedLeft,
          child: SizedBox(
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.assetsQuitQuiz,
                  width: 24.0,
                  height: 24.0,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColor.grey200 : AppColor.grey400,
                      BlendMode.srcIn,
                    )
                ),
                AppSizing.w08,
                Text(
                  leftText,
                  style: AppTextStyle.bodyMedium(context),
                )
              ],
            ),
          ),
        ),
        SizedBox(
            width: screenWidth < 800 ? 129 : 220,
            child: ButtonWidget(
              buttonText: buttonText,
              onPressed: onPressedButton,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
              borderSideColor: Colors.transparent,
              fontSize: 16,
              backgroundColor:
              const MaterialStatePropertyAll(AppColor.appColor),
            )),
      ],
    );
  }
}

class FooterWidgetQuiz extends StatelessWidget {
  final String leftText;
  final String buttonText;
  final VoidCallback onPressedButton;
  final VoidCallback onPressedLeft;
  final QuizQuestionsController controller;
  const FooterWidgetQuiz({
    super.key, required this.leftText, required this.buttonText, required this.onPressedButton, required this.onPressedLeft, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onPressedLeft,
          child: SizedBox(
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.assetsQuitQuiz,
                  width: 24.0,
                  height: 24.0,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColor.grey200 : AppColor.grey400,
                      BlendMode.srcIn,
                    )
                ),
                AppSizing.w08,
                Text(
                  leftText,
                  style: AppTextStyle.bodyMedium(context),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: ()=> controller.disableTwoButtons(),
                  child: SvgPicture.asset(
                    controller.headOrTail.value < 3 ? Assets.assetsHeadTailIcon : Assets.assetsHeadTailUnselectedIcon,
                    width: 30.0,
                    height: 30.0,
                  ),
                ),
                Obx(
                      () => Text(
                    (controller.headOrTail.value).toString(),
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
            // skipped
            AppSizing.w18,
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    if(controller.skipped.value < 3){

                      controller.skippedQuestion();
                    }
                    },
                  child: SvgPicture.asset(
                    controller.skipped.value < 3 ? Assets.assetsSkipIcon : Assets.assetsSkipUnselectedIcon,
                    width: 30.0,
                    height: 30.0,
                  ),
                ),
                Obx(
                      () => Text(
                    (controller.skipped.value).toString(),
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
    );
  }
}