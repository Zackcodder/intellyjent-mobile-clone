import '../../../core/core.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    Future.delayed(const Duration(seconds: 5), () {
      Get.off(() => decideRoute());
    });

    return Scaffold(
        backgroundColor: AppColor.appColor,
        body: Stack(children: [
          // Animated top right circle
          Positioned(
              top: -screenHeight * 0.1,
              right: -screenWidth * 0.12,
              // child: GlowingWidget(
              //     milliseconds: 700,
              child: Container(
                width: screenWidth < 800 ? 197 : 280,
                height: screenWidth < 800 ? 197 : 280,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightBlue,
                ),
              )),
          // ),
          // Bottom left circle
          Positioned(
            bottom: screenHeight * 0.00,
            left: -screenWidth * 0.21,
            // child: GlowingWidget(
            //   milliseconds: 700,
            child: Container(
              width: screenWidth < 800 ? 161 : 260,
              height: screenWidth < 800 ? 161 : 260,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          // ),
          // small top left circle
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.27,
            // child: GlowingWidget(
            //   milliseconds: 200,
            child: Container(
              width: screenWidth < 800 ? 20 : 80,
              height: screenWidth < 800 ? 20 : 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              // ),
            ),
          ),
          // small top right circle
          Positioned(
            top: screenHeight * 0.327,
            right: screenWidth * 0.052,
            // child: GlowingWidget(
            //   milliseconds: 700,
            child: Container(
              width: screenWidth < 800 ? 60 : 120,
              height: screenWidth < 800 ? 60 : 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          // ),
          // small top left circle
          Positioned(
            top: screenHeight * 0.41,
            left: screenWidth * 0.092,
            // child: GlowingWidget(
            //   milliseconds: 700,
            child: Container(
              width: screenWidth < 800 ? 40 : 60,
              height: screenWidth < 800 ? 40 : 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
            ),
          ),
          // ),
          // small bottom right circle
          Positioned(
            bottom: screenHeight * 0.07,
            right: screenWidth * 0.13,
            // child: GlowingWidget(
            //   milliseconds: 400,
            child: Container(
              width: screenWidth < 800 ? 70 : 130,
              height: screenWidth < 800 ? 70 : 130,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
            ),
          ),
          // ),

          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Row(),
                AnimatedScale(
                  scale: controller.shouldShowLogo.value ? 1 : 0,
                  curve: Curves.bounceInOut,
                  onEnd: () {
                    controller.updateShowLogoText();
                  },
                  duration: const Duration(milliseconds: 600),
                  child: SvgPicture.asset(
                    Assets.assetsLogo,
                    width: 100.0,
                    height: 100.0,
                    alignment: Alignment.center,
                  ),
                ),
                AppSizing.h04,
                AnimatedSlide(
                  offset: Offset(0, controller.showLogoText.value ? 0 : 0.5),
                  duration: const Duration(milliseconds: 700),
                  child: AnimatedOpacity(
                    opacity: controller.showLogoText.value ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'Intellyjent',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.h3(context).copyWith(
                        color: AppColor.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

Widget decideRoute() {
  if (UserData.email != null && UserData.isVerified == false) {
    // return const Root();
    return OtpScreen(email: UserData.email!);
  }
  else if (UserData.token != null && UserData.hasOpenedApp) {
    return const Root();
  }
  else if (UserData.hasOpenedApp && UserData.registrationStep == null) {
    return const Login();
  }
  else if (UserData.registrationStep == RegistrationStep.signUp) {
    return const SignUp();
  }
  else if (UserData.registrationStep == RegistrationStep.otpVerification) {
    return OtpScreen(email: UserData.email ?? "");
  }
  else if (UserData.registrationStep == RegistrationStep.username) {
    return  UserName(userId: UserData.userId ?? '', token: UserData.token ?? '',);
  } else {
    return const OnboardingPage();
  }
}
