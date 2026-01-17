import 'package:intellyjent/src/core/core.dart';

class UserName extends StatelessWidget {
  final String userId;
  final String token;
  const UserName({super.key, required this.userId, required this.token});
  bool validateRoute() {
    if (UserData.registrationStep != null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
  UserData.userId = userId;
  UserData.token = token;
    OtpController controller = Get.put(OtpController());
    return PopScope(
      canPop: validateRoute(),
      onPopInvoked: (value) async {
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
          automaticallyImplyLeading: false,
          title: const HeaderWidget(title: 'User Name'),
        ),
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        body: Padding(
          padding: MediaQuery.of(context).size.width <800
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 40),
          child: ListView(
            children: [
              AppSizing.h20,
              CustomInputField(
                  fieldName: "Username",
                  hintText: "Enter your unique username",
                  controller: controller.usernameController),
              AppSizing.h48,
              ButtonWidget(
                  buttonText: 'Save',
                  fontSize: 17,
                  shouldShowLoader: true,
                  textColor: AppColor.white,
                  borderSideColor: Colors.transparent,
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.appColor),
                  onPressed: () async {
                    if (controller.usernameController.text.length >= 2) {
                      await controller.updateUsername(context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
