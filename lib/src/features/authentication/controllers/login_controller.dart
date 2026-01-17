import 'package:device_info_plus/device_info_plus.dart';
import 'package:intellyjent/src/core/core.dart';

class LoginController extends GetxController {
  RxInt value = 0.obs;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String _deviceID = '';

  Future<void> getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    _deviceID = androidInfo.id;
    print(_deviceID);
  }

  Future submit(BuildContext context) async {
    final isConnected = await InternetConnectionChecker().hasConnection;
          print('isconnected $isConnected');

    if (isConnected) {
          print('step one');
      await HttpHelper.instance.postRequestNoAuth("accounts/login/", body: {
        "username": usernameController.text.trim(),
        "password": passwordController.text
      }).then((value) async {
        
          print('step 2 with value $value');
        if (value.status) {
          Map<String, dynamic> newUserData = (value as SuccessResponse).result;
          print(newUserData["token"]);
          UserData.updateAll(newUserData);
          UserData.currentPassword = passwordController.text;
          if (UserData.isVerified == false) {
            print('is verfied ${UserData.isVerified}');
            OtpController controller = Get.put(OtpController());
            await controller.resendOtp(context, UserData.email!);
            Get.to(()=> OtpScreen(
              email: UserData.email ?? "",
              fromLogin: true,
            ), transition: Transition.rightToLeftWithFade);
            return;
          }
          await getDeviceID();
          Get.offAll(() => const Root());
          OneSignal.login(UserData.username!);
          UserData.deviceId = _deviceID;
          OneSignal.User.addEmail(UserData.email!);
          OneSignal.User.addSms(UserData.phone ?? '');
          return;
        }

        // ErrorResponse errors = (value as ErrorResponse);

        showFeedbackToast(
          context,
          'Invalid Username or password',
        );
      });
    }
    else{
      Fluttertoast.showToast(msg: 'No Internet Connection',
          backgroundColor: AppColor.appColor, textColor: AppColor.white
      );
    }

    // await HttpHelper.instance.postRequest("accounts/sign-up/",
    //     body: {"username": "string", "password": "string"});
  }

  @override
  void onClose() {
    passwordController.dispose();
    usernameController.dispose();
    super.onClose();
  }
}
