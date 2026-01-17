import 'package:intellyjent/src/core/core.dart';

class OtpControllerForgotPassword extends GetxController {
  final otpController = TextEditingController();
  final usernameController = TextEditingController();
  RxInt timeToResendCode = 59.obs;
  Timer? _timer;

  _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (timeToResendCode.value == 0) {
          _timer?.cancel();

          return;
        }
        timeToResendCode -= 1;
      },
    );
  }

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  Future verifyEmail(BuildContext context, String email) async {
    await HttpHelper.instance.postRequest("accounts/verify",
        body: {
          "email": email,
          "email_token": otpController.text.trim()
        }).then((value) {
      print(value);
      if (value.status) {
        Map<String, dynamic> newUserData = (value as SuccessResponse).result;
        print(newUserData);
        UserData.updateAll(newUserData);
        Get.to(()=> NewPassword(otp: otpController.text.trim(),),
            transition: Transition.upToDown);
        return;
      }
      ErrorResponse errors = (value as ErrorResponse);

      print(errors);
      showFeedbackToast(
        context,
        'Error confirming OTP, try again',
      );
    });
  }

  Future resendOtp(BuildContext context, String email) async {
    timeToResendCode(59);
    _startTimer();
    await HttpHelper.instance.postRequest(
        "accounts/request-verification",
        body: {"email": email}).then((value) {
      if (value.status) {
        Map<String, dynamic> newUserData = (value as SuccessResponse).result;
        print(newUserData);
        UserData.updateAll(newUserData);
        print(value);
        showFeedbackToast(context, "Otp Token sent successfully",
            type: ToastType.success);


        return;
      }

      ErrorResponse errors = (value as ErrorResponse);

      showFeedbackToast(
        context,
        errors.errors.isEmpty
            ? errors.message
            : errors.errors.first.errorMessage.first,
      );
    });
  }

  @override
  void onClose() {
    otpController.dispose();
    // usernameController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
