import 'package:intellyjent/src/core/core.dart';

class OtpController extends GetxController {
  late String email;
  final otpController = TextEditingController();
  final usernameController = TextEditingController();
  RxInt timeToResendCode = 59.obs;
  Timer? _timer;

  void setEmail(String value) {
    email = value;
  }

  _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeToResendCode.value == 0) {
          _timer?.cancel();

          return;
        }
        timeToResendCode.value -= 1;
      },
    );
  }

  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  // Future verifyEmail(BuildContext context, bool fromLogin) async {
  //   // final email = email;
  //   final otp = otpController.text.trim();

  //   print('Sending verification with:');
  //   print('Email: $email');
  //   print('OTP: $otp');
  //   if (email.isEmpty) {
  //     showFeedbackToast(context, 'Email is missing');
  //     return;
  //   }
  //   await HttpHelper.instance.postRequestStatusResponse("accounts/verify",
  //       body: {
  //         "email": email,
  //         "email_token": otpController.text.trim()
  //       }).then((value) {
  //     print('otp value');
  //     print(value);
  //     if (value is SuccessResponse && value.status) {

  //       if (fromLogin) {
  //         UserData.isVerified = true;
  //         Get.off(() => const Root());
  //         return;
  //       } else {
  //         UserData.isVerified = true;
  //         Get.to(() => const UserName(), transition: Transition.upToDown);
  //         UserData.registrationStep = RegistrationStep.username;
  //         return;
  //       }
  //     }
  //   ErrorResponse errors = (value as ErrorResponse);

  //   print(errors);
  //   showFeedbackToast(
  //     context,
  //     'Error confirming OTP, try again',
  //   );
  // });
  // }

  ///
  Future verifyEmail(BuildContext context, bool fromLogin) async {
    final otp = otpController.text.trim();

    print('Sending verification with:');
    print('Email: $email');
    print('OTP: $otp');

    if (email.isEmpty) {
      showFeedbackToast(context, 'Email is missing');
      return;
    }

    final response = await HttpHelper.instance.postRequestStatusResponse(
      "accounts/verify",
      body: {
        "email": email,
        "email_token": otp,
      },
    );

    print("Response from OTP verification: $response");

    if (response is SuccessResponse && response.status) {
      // Extract full user data from the response
      final result = response.result;
      print('Parsed user data: $result');

      if (result is Map<String, dynamic>) {
        final data = result['data'] ?? {};
        // ✅ Save necessary values
        UserData.updateAll(result);
        UserData.token = data['token'] ?? '';
        UserData.userId = data['id'] ?? '';
        UserData.isVerified = data['is_verified'] ?? false;
        UserData.registrationStep = null;

        print('Full result: $result');
        print('Extracted data: $data');

        print('user id ${UserData.userId}');
        print('user token ${UserData.token}');

        if (fromLogin) {
          Get.off(() => const Root());
        } else {
          // ✅ Pass user ID and token to the UserName screen
          Get.to(
            () => UserName(
              userId: result['id'],
              token: result['token'],
            ),
            transition: Transition.upToDown,
          );
        }
        return;
      } else {
        showFeedbackToast(context, "Unexpected response format");
      }
    } else {
      final error = response as ErrorResponse;
      print("OTP verification failed: $error");
      showFeedbackToast(context, error.message);
    }
  }

  ///

  Future updateUsername(BuildContext context) async {
    await HttpHelper.instance.putRequest("accounts/${UserData.userId}",
        body: {"username": usernameController.text.trim()}).then((value) {
      print('user id ${UserData.userId}');
      print('user token ${UserData.token}');
      print('user name ${UserData.username}');
      if (value.status) {
        UserData.username = (value as SuccessResponse).result["username"];
        print('user name22 ${UserData.username}');
        Get.dialog(
            const Dialog(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                clipBehavior: Clip.none,
                insetPadding: EdgeInsets.symmetric(horizontal: 20),
                child: PopScope(canPop: false, child: SuccessWidget())),
            barrierDismissible: false);
        UserData.registrationStep = null;
        return;
      }
      // else {
      //   showFeedbackToast(
      //     context,
      //     header: "Success",
      //     type: ToastType.error,
      //     "You are fully set up to take on the world! ",
      //   );
      //   Get.offAll(() => const Login());
      // }
      ErrorResponse errors = (value as ErrorResponse);

      showFeedbackToast(
        context,
        errors.errors.isEmpty
            ? errors.message
            : errors.errors.first.errorMessage.first,
      );
    });
  }

  Future resendOtp(BuildContext context, String email) async {
    timeToResendCode.value = 59;
    _startTimer();
    await HttpHelper.instance.postRequest("accounts/request-verification",
        body: {"email": email}).then((value) {
      if (value.status) {
        print('otp sent');
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
    usernameController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
