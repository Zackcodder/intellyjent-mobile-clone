// ignore_for_file: depend_on_referenced_packages

import 'package:device_info_plus/device_info_plus.dart';
import 'package:intellyjent/src/core/core.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final referralCodeController = TextEditingController();
  final genderGroupValue = "male".obs;
  final countryController = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  List<Country> countries = [];
  final selectedCountry = Rx<Country?>(null);
  final dob = Rx<DateTime>(DateTime.now());
  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  final Uri _urlPp = Uri.parse('https://www.intellyjent.com/privacy_policy');

  String _deviceID = '';

  Future<void> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    _deviceID = androidInfo.id;
    print(_deviceID);
  }

  Future<void> launchPp() async {
    if (!await launchUrl(_urlPp)) {
      throw Exception('Could not launch $_urlPp');
    }
  }

  final Uri _urlTc = Uri.parse('https://www.intellyjent.com/terms');

  Future<void> launchTc() async {
    if (!await launchUrl(_urlTc)) {
      throw Exception('Could not launch $_urlTc');
    }
  }

  updateGenderValue(value) {
    genderGroupValue(value);
  }

  updateCounty(value) {
    countries = value;
  }

  selectCountry(Country country) {
    selectedCountry(country);
    countryController(TextEditingController(text: country.name));
    Get.back();
  }

  updateDob(DateTime? date) {
    if (date == null) return;
    dob(date);
    dobController(
        TextEditingController(text: '${date.day}/${date.month}/${date.year}'));
  }

  // Future<void> submit(BuildContext context) async {
  //   print('calling the signup function');
  //   final isConnected = await InternetConnectionChecker().hasConnection;

  //   if (isConnected) {
  //     await HttpHelper.instance
  //         .signupPostRequestNoAuth(
  //       "accounts/sign-up/",
  //       body: buildSignUpBody(),
  //     )
  //         .then((value) async {
  //       print('This is the value from signup controller $value');
  //       print("Formatted DOB: ${formatDate(dob.value)}");
  //       print(value);
  //       if (value.status) {
  //         // ✅ This means signup was successful (201)
  //         // final result = (value as SuccessResponse).result;

  //         // // Optionally show the detail message
  //         // if (result != null && result['detail'] != null) {
  //         //   showFeedbackToast(context, result['detail']);
  //         // }

  //         // // Proceed to OTP step
  //         // UserData.registrationStep = RegistrationStep.otpVerification;
  //         // OneSignal.login(UserData.username!);
  //         // UserData.deviceId = _deviceID;

  //         // Get.to(() => OtpScreen(email: emailController.text),
  //         //     transition: Transition.rightToLeftWithFade);
  //         // return;
  //         Map<String, dynamic> newUserData = (value as SuccessResponse).result;
  //         UserData.updateAll(newUserData);
  //         UserData.registrationStep = RegistrationStep.otpVerification;
  //         OneSignal.login(UserData.username!);
  //         UserData.deviceId = _deviceID;
  //         Get.to(
  //             () => OtpScreen(
  //                   email: emailController.text,
  //                 ),
  //             transition: Transition.rightToLeftWithFade);
  //         return;
  //       }
  //       ErrorResponse errors = (value as ErrorResponse);
  //       // print(errors.errors.isEmpty? errors.message:errors.errors.first.errorMessage.first);

  //       // Check for specific error code
  //       for (HttpError error in errors.errors) {
  //         print('God oooo');
  //         if (error.errorTitle == "code" &&
  //             error.errorMessage.first == "duplicate_entity") {
  //           // Handle the duplicate entity error here
  //           showFeedbackToast(context, "A user with this email already exists");
  //           OtpController controller = Get.put(OtpController());
  //           await controller.resendOtp(context, emailController.text.trim());
  //           Get.to(() => const Login(), transition: Transition.upToDown);
  //           return;
  //         } else {
  //         print('chai rGod oooo');
  //           showFeedbackToast(
  //               context,
  //               errors.errors.isEmpty
  //                   ? errors.message
  //                   : errors.errors.first.errorMessage.first);
  //         }
  //       }
  //       // showFeedbackToast(context, "An error occurred.");
  //     });
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: 'No Internet Connection',
  //         backgroundColor: AppColor.appColor,
  //         textColor: AppColor.white);
  //   }
  // }

  ///testing
  Future<void> submit(BuildContext context) async {
    print('calling the signup function');
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      Fluttertoast.showToast(
        msg: 'No Internet Connection',
        backgroundColor: AppColor.appColor,
        textColor: AppColor.white,
      );
      return;
    }

    final response = await HttpHelper.instance.signupPostRequestNoAuth(
      "accounts/sign-up/",
      body: buildSignUpBody(),
    );

    print('This is the value from signup controller $response');
    print("Formatted DOB: ${formatDate(dob.value)}");

    if (response.status) {
      // ✅ Success Case
      Map<String, dynamic> newUserData = (response as SuccessResponse).result;

      // final newUserData = (response as SuccessResponse).result;

      // ✅ Show success toast
      showFeedbackToast(context, newUserData['detail'] ?? "Signup successful",
          type: ToastType.success);

      // Proceed to OTP screen
      // UserData.updateAll(newUserData);
      UserData.email = emailController.text.trim();
      UserData.registrationStep = RegistrationStep.otpVerification;
      // OneSignal.login(UserData.username!);
      UserData.deviceId = _deviceID;

      Get.to(
        () => OtpScreen(email: emailController.text.trim()),
        transition: Transition.rightToLeftWithFade,
      );
      return;
    }

    // ❌ Error Case
    final error = (response as ErrorResponse);

    // Check for specific known error
    bool isEmailExists = error.message
            .contains("A user with this email already exists") ||
        error.errors.any((e) => e.errorMessage.any(
            (msg) => msg.contains("A user with this email already exists")));

    if (isEmailExists) {
      showFeedbackToast(context, "A user with this email already exists");
      final controller = Get.put(OtpController());
      await controller.resendOtp(context, emailController.text.trim());
      Get.to(() => const Login(), transition: Transition.upToDown);
      return;
    }

    // Generic fallback
    String errorMessage;
    if (error.errors.isNotEmpty) {
      errorMessage =
          error.errors.map((e) => e.errorMessage.join(', ')).join('; ');
    } else {
      errorMessage = error.message;
    }
    showFeedbackToast(context, errorMessage);
  }

  ///

  Map<String, dynamic> buildSignUpBody() {
    final signUpBody = {
      "username": "intelly-${emailToUniqueString(emailController.text.trim())}"
          .replaceAll(' ', '_'),
      "first_name": fullNameController.text.trim().split(" ").first,
      "last_name": fullNameController.text.trim().split(" ").length > 1
          ? fullNameController.text.trim().split(" ").skip(1).join(" ")
          : fullNameController.text.trim().split(" ").first,
      "email": emailController.text.trim(),
      "password": passwordController.text,
      "date_of_birth": dob.value.toIso8601String(),

      ///formatDate(dob.value),
      "gender": genderGroupValue.value,
      "phone_number":
          '${selectedCountry.value?.phoneCode}${phoneNumberController.text.trim()}',
      "country": selectedCountry.value!.name
    };

    if (referralCodeController.text.isNotEmpty) {
      signUpBody["referrer"] = referralCodeController.text;
    }

    return signUpBody;
  }

  String emailToUniqueString(String email) {
    var bytes = utf8.encode(email);
    var digest = md5.convert(bytes);

    return digest.toString().substring(0, 5);
  }

  @override
  void onInit() async {
    super.onInit();
    List<Country> country = CountryService().getAll();
    updateCounty(country);
  }

  @override
  void onClose() {
    // fullNameController.dispose();
    // passwordController.dispose();
    // confirmPasswordController.dispose();
    // emailController.dispose();
    // countryController.value.dispose();
    // dobController.value.dispose();
    // phoneNumberController.dispose();
    super.onClose();
  }
}
