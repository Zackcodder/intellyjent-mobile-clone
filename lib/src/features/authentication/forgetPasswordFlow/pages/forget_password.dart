import 'package:intellyjent/src/core/core.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  ForgetPasswordController controller = Get.put(ForgetPasswordController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        automaticallyImplyLeading: false,
        title: const HeaderWidget(title: 'Forgot Password'),
      ),
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: screenWidth <800
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSizing.h20,
              Text(
                "Please enter the email address you used to sign up, and you will receive a code to reset your password.",
                style: AppTextStyle.bodyMedium(context),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: Form(
                  key: _formKey,
                  child: CustomInputField(
                    controller: controller.emailController,
                    fieldName: " Email Address",
                    hintText: "Type in your email",
                    inputType: TextInputType.emailAddress,
                    prefixIcon: SvgPicture.asset(Assets.assetsPersonal,
                      width: MediaQuery.of(context).size.width < 800 ? null : 100,),
                  ),
                ),
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
                    await controller.submit(context);
                  }
                },
                fontSize: 17,
                textColor: AppColor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
