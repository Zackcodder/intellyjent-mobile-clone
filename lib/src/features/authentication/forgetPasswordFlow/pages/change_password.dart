import 'package:intellyjent/src/core/core.dart';

class NewPassword extends StatefulWidget {
  final String otp;
  const NewPassword({super.key, required this.otp});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  // ForgetPasswordController controller = Get.put(ForgetPasswordController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        automaticallyImplyLeading: false,
        title: const HeaderWidget(
          title: 'Enter a new password',
        ),
      ),
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppBg,
      body: GetBuilder<ForgetPasswordController>(builder: (controller) {
        final screenWidth = MediaQuery.of(context).size.width;
        return SingleChildScrollView(
          child: Padding(
            padding: screenWidth <800
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSizing.h20,
                Text(
                  "Create strong a and secure password that protects your account.",
                  style: AppTextStyle.bodyMedium(context),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppSizing.h20,
                          CustomInputField(
                            controller: controller.passwordController,
                            fieldName: "Password",
                            hintText: "Enter your password",
                            isPassword: true,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "Confirm password cannot be empty";
                                }
                                if (value.toString().length < 8) {
                                  return "Password must contain at least 8 characters";
                                }
                                return null;
                              }
                          ),
                          AppSizing.h20,
                          CustomInputField(
                            controller: controller.confirmPasswordController,
                            fieldName: "Confirm password",
                            hintText: "Confirm new password",
                            isPassword: true,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Confirm password cannot be empty";
                              }
                              if (value.toString() !=
                                  controller.passwordController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                ),
                AppSizing.h20,
                ButtonWidget(
                  buttonText: 'Send',
                  backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                  shouldShowLoader: true,
                  borderSideColor: Colors.transparent,
                  onPressed: () async{
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      await controller.updatePassword(context, widget.otp);
                    }
                  },
                  fontSize: 17,
                  textColor: AppColor.white,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
