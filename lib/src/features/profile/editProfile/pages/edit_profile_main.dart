import 'dart:math';

import 'package:intellyjent/src/core/core.dart';

class EditProfileMain extends StatefulWidget {
  const EditProfileMain({super.key});
  @override
  State<EditProfileMain> createState() => _EditProfileMainState();
}

class _EditProfileMainState extends State<EditProfileMain> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    ProfilePageController cont = Get.find();
    Get.put(EditProfileController());

    return Scaffold(
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
                Assets.assetsArrowLeft,
                color: Get.theme.brightness == Brightness.light
                  ? AppColor.grey200 : AppColor.white,
              ),
            )),
        title: Text(
          "Edit Profile",
          style: AppTextStyle.h3Regular(context),
        ),
      ),
      body: GetBuilder<EditProfileController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).size.width <800
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    UserAvatar2(
                            screenWidth: screenWidth,
                            fullName: cont.userData.value?.fullName ?? "", controller: cont,
                          ),
                    Theme(
                        data: ThemeData().copyWith(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hintColor: Colors.transparent),
                        child: TextButton(
                            onPressed: () {
                              Get.to(() => const ChooseAvatar(), transition: Transition.upToDown);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Assets.assetsEdit,
                                  width: screenWidth < 800 ? null : 50,
                                ),
                                AppSizing.w08,
                                Text(
                                  "Change Avatar",
                                  style: AppTextStyle.h4Regular(context),
                                ),
                              ],
                            )))
                  ],
                ),
                AppSizing.h24,
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomInputField(
                          fieldName: "Name",
                          controller: controller.fullNameController,
                          disabled: true,
                          readOnly: true,
                        ),
                        AppSizing.h20,
                        CustomInputField(
                          fieldName: "Username",
                          controller: controller.usernameController,
                        ),
                        AppSizing.h20,
                        CustomInputField(
                          fieldName: "Email",
                          controller: controller.emailController,
                          inputType: TextInputType.emailAddress,
                        ),
                        AppSizing.h20,
                        CustomInputField(
                          fieldName: "Phone Number",
                          controller: controller.phoneNumberController,
                        ),
                        AppSizing.h20,
                        CustomInputField(
                            fieldName: "Password",
                            controller: controller.passwordController,
                            showRightBorder: false,
                            readOnly: true,
                            onTap: () {
                              Get.to(()=> const ChangePassword(), transition: Transition.upToDown);
                            },
                            showLockIcon: false,
                            isPassword: true,
                            suffixIcon: Transform.rotate(
                              angle: pi,
                              child: SvgPicture.asset(Assets.assetsArrowLeft,
                              color:
                                  Get.theme.brightness == Brightness.light
                                      ? AppColor.grey200 : AppColor.white),
                            )),
                      ],
                    )),
                AppSizing.h56,
                ButtonWidget(
                    buttonText: 'Save',
                    fontSize: 17,
                    shouldShowLoader: true,
                    textColor: AppColor.white,
                    borderSideColor: Colors.transparent,
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColor.appColor),
                    onPressed: () async {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        await controller.submitForm(context);
                      }
                    }),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 30,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
