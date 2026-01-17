import 'package:intellyjent/src/core/core.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  final bool fromLogin;
  const OtpScreen({super.key, required this.email, this.fromLogin = false});
  bool validateRoute() {
    if (UserData.registrationStep != null) {
      // Get.off(const Login());
      // UserData.registrationStep = null;
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.put(OtpController());
    controller.setEmail(email);
    final screenWidth = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: validateRoute(),
      onPopInvoked: (value) async {
        if (fromLogin) {
          await controller.resendOtp(context, email);
          UserData.registrationStep = null;
          return;
        }
        if (!value) {
          Get.off(const SignUp());
          UserData.registrationStep = RegistrationStep.signUp;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: Get.theme.brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkAppBg,
          centerTitle: true,
          // backgroundColor: Colors.transparent,
          leading: GestureDetector(
              onTap: () {
                if (UserData.registrationStep != null) {
                  Get.off(() => const SignUp());
                  UserData.registrationStep = RegistrationStep.signUp;
                  return;
                }
                Get.off(() => const Login());
              },
              child: Container(
                padding: screenWidth < 800
                    ? const EdgeInsets.only(right: 25)
                    : const EdgeInsets.only(right: 10),
                child: SvgPicture.asset(
                  Assets.assetsArrowLeft,
                  color: Get.theme.brightness == Brightness.light
                      ? AppColor.grey200
                      : AppColor.white,
                ),
              )),
          title: Text("Verification",
              style: screenWidth < 850
                  ? AppTextStyle.h5(context)
                      .copyWith(fontWeight: FontWeight.w800)
                  : AppTextStyle.h4(context)
                      .copyWith(fontWeight: FontWeight.w500)),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        body: Padding(
          padding: screenWidth < 800
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              AppSizing.h20,
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                        text:
                            "Please enter the 5-digit verification code sent to "),
                    TextSpan(
                        text: email,
                        style: AppTextStyle.bodyMedium(context).copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.appColor))
                  ],
                  style: AppTextStyle.bodyMedium(context),
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: Pinput(
                  length: 5,
                  preFilledWidget: Container(
                    width: screenWidth < 800 ? 10 : 20,
                    height: screenWidth < 800 ? 3 : 6,
                    color: AppColor.grey200,
                  ),
                  controller: controller.otpController,
                  defaultPinTheme: PinTheme(
                      height: screenWidth < 800 ? 40 : 80,
                      width: screenWidth < 800 ? 60 : 100,
                      textStyle: AppTextStyle.h5(context),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: AppColor.grey))),
                ),
              ),
              Text(
                "If you didn’t get the code, ensure the email above is correct. Also check your spam messages. If you can’t find the code, please hit Resend.",
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyMedium(context).copyWith(fontSize: 14),
              ),
              Obx(() => TextButton(
                  onPressed: () {
                    controller.resendOtp(context, email);
                  },
                  child: Text(
                    controller.timeToResendCode.value > 0
                        ? 'Resend in ${controller.timeToResendCode.value}s'
                        : "Resend code.",
                    style: AppTextStyle.bodyMedium(context).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: controller.timeToResendCode.value > 0
                            ? AppColor.grey400
                            : AppColor.appColor),
                  ))),
              AppSizing.h48,
              ButtonWidget(
                  buttonText: 'Verify',
                  fontSize: 17,
                  shouldShowLoader: true,
                  textColor: AppColor.white,
                  borderSideColor: Colors.transparent,
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.appColor),
                  onPressed: () async {
                    if (controller.otpController.text.length >= 5) {
                      await controller.verifyEmail(context, fromLogin);
                    }
                  }),

              // InkWell(
              //   onTap: () async{
              //     if (controller.otpController.text.length >= 5) {
              //       await controller.verifyEmail(context);
              //     }

              //   },
              //   child: Container(
              //     width: double.maxFinite,
              //     height: 55,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: AppColor.appColor),
              //     child: Text("Verify",
              //         style: AppTextStyle.h4Regular(context).copyWith(
              //             color: Theme.of(context).brightness == Brightness.dark
              //                 ? Colors.black
              //                 : Colors.white,
              //             fontSize: 17,
              //             fontWeight: FontWeight.w400)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
