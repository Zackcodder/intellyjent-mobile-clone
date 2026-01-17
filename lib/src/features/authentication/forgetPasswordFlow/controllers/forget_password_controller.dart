import 'package:intellyjent/src/core/core.dart';
import 'package:intellyjent/src/features/authentication/forgetPasswordFlow/pages/otp_screen_password.dart';

class ForgetPasswordController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();


  Future submit(BuildContext context) async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      await HttpHelper.instance.postRequestStatusResponse("accounts/passwords/forgot/",
          body: {
            "email": emailController.text.trim(),
          }).then((value) {
        print("value $value");
        if (value is SuccessResponse && value.status) {
          Get.to(()=>
              OtpScreenPassword(email: emailController.text.trim()), transition: Transition.upToDown);
          return;
        }
        ErrorResponse errors = (value as ErrorResponse);

        print(errors);
        showFeedbackToast(
          context,
          'Error sending OTP, try again',
        );
      });
    }
    else{
      Fluttertoast.showToast(msg: 'No Internet Connection',
          backgroundColor: AppColor.appColor, textColor: AppColor.white
      );
    }
  }

  Future<void> updatePassword(BuildContext context, String otp) async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      await HttpHelper.instance
          .postRequestStatusResponse("accounts/passwords/reset/", body: {
        "email_token": otp,
        "new_password": confirmPasswordController.text,
      }).then((value) {
        print(value);
        if (value is SuccessResponse && value.status) {
          showFeedbackToast(context, 'Password Updated', type: ToastType.success);
          Get.offAll(()=> const Login());
        }
        else {

          ErrorResponse errors = (value as ErrorResponse);
          showFeedbackToast(context, 'This password is too common.');

          print(errors.errors.isEmpty
              ? errors.message
              : errors.errors.first.errorMessage.first);
        }
      });
    }
    else{
      Fluttertoast.showToast(msg: 'No Internet Connection',
          backgroundColor: AppColor.appColor, textColor: AppColor.white
      );
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}