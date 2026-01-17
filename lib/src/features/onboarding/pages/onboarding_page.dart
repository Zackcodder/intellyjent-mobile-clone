import '../../../core/core.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor:Theme.of(context).brightness == Brightness.light
              ? AppColor.appColor
              : AppColor.darkAppBg,
      body: Stack(
        children: [
          // Animated top right circle
          Positioned(
            top: -screenHeight * 0.1,
            right: -screenWidth * 0.12,
            child: GlowingWidget(
                milliseconds: 2000,
                child: Container(
                  width: screenWidth < 800 ? 197 : 257,
                  height: screenWidth < 800 ? 197 : 257,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.lightBlue,
                  ),
                )),
          ),
          // Bottom left circle
          Positioned(
            bottom: screenHeight * 0.00,
            left: -screenWidth * 0.21,
            child: GlowingWidget(
              milliseconds: 700,
              child: Container(
                width: screenWidth < 800 ? 161 : 211,
                height: screenWidth < 800 ? 161 : 211,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightBlue,
                ),
              ),
            ),
          ),
          // small top left circle
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.27,
            child: GlowingWidget(
              milliseconds: 1500,
              child: Container(
                width: screenWidth < 800 ? 20 : 80,
                height: screenWidth < 800 ? 20 : 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
          // small top right circle
          Positioned(
            top: screenHeight * 0.327,
            right: screenWidth * 0.052,
            child: GlowingWidget(
              milliseconds: 1000,
              child: Container(
                width: screenWidth < 800 ? 60 : 120,
                height: screenWidth < 800 ? 60 : 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightBlue,
                ),
              ),
            ),
          ),
          // small top left circle
          Positioned(
            top: screenHeight * 0.41,
            left: screenWidth * 0.092,
            child: GlowingWidget(
              milliseconds: 1600,
              child: Container(
                width: screenWidth < 800 ? 40 : 100,
                height: screenWidth < 800 ? 40 : 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.yellow,
                ),
              ),
            ),
          ),
          // small bottom right circle
          Positioned(
            bottom: screenHeight * 0.07,
            right: screenWidth * 0.13,
            child: GlowingWidget(
              milliseconds: 900,
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.yellow,
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: mediaQuery.padding.bottom + 20),
              // padding: EdgeInsets.symmetric(vertical:AppSizing.padding.vertical),
              child: GetBuilder<OnBoardingController>(initState: (state) {
              }, builder: (controller) {
                return PageView.builder(
                    controller: controller.pageController.value,
                    itemCount: pageInfo.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => OnboardingSlide(
                          illustration: pageInfo[index]["illustration"]!.lsvg,
                          text: pageInfo[index]["text"]!,
                        ));
              }))
        ],
      ),
    );
  }
}

const List<Map<String, String>> pageInfo = [
  {
    "illustration": "onboarding1",
    "text": "Play quizzes wherever and whenever you want."
  },
  {
    "illustration": "onboarding2",
    "text": "Prove your brilliance on a global stage."
  },
  {"illustration": "onboarding3", "text": "Earn cash rewards for coming tops."}
];
