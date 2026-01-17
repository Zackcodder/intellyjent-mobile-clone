import 'package:intellyjent/src/core/core.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void initState() {
    Get.put(EditProfileController());
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        toolbarHeight: 90,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft, color: Get.theme.brightness == Brightness.light
                  ? AppColor.grey200 : AppColor.white,
              ),
            )),
        title: Text(
          "Change password",
          style: AppTextStyle.h3Regular(context),
        ),
      ),
      body: GetBuilder<EditProfileController>(builder: (controller) {
        return Padding(
            padding: MediaQuery.of(context).size.width <800
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Expanded(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppSizing.h20,
                          CustomInputField(
                            controller: controller.oldController,
                            fieldName: "Old password",
                            hintText: "Enter your password",
                            isPassword: true,
                          ),
                          AppSizing.h20,
                          CustomInputField(
                            controller: controller.newController,
                            fieldName: "New password",
                            hintText: "Enter your new password",
                            isPassword: true,
                            validator: (value){
                              if (value.toString().length > 20) {
                                return "New password must be at most 20 characters";
                              }
                              if (value.toString() == controller.oldController.text) {
                                return "New password must be different from the old password";
                              }
                              return null;
                            },
                          ),
                          AppSizing.h20,
                          CustomInputField(
                            controller: controller.confirmController,
                            fieldName: "Confirm password",
                            hintText: "Confirm new password",
                            isPassword: true,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "Confirm password cannot be empty";
                              }
                              if (value.toString() !=
                                  controller.newController.text) {
                                return "Password does not match";
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                ),
                ButtonWidget(
                  buttonText: 'Save',
                  backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                  borderSideColor: Colors.transparent,
                  textColor: AppColor.white,
                  shouldShowLoader: true,
                  fontSize: 17,
                  onPressed: () async{
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      // Get.to(const OtpScreen());
                      await controller.updatePassword(context);
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 30,
                )
              ],
            ));
      }),
    );
  }
}
