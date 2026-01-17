import '../../../core/core.dart';

class MessageUsController extends GetxController {
  final messageController = TextEditingController();
  RxBool displayErrorMessage = false.obs;

  Future postMessage(BuildContext context) async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      final cont = Get.put(ProfilePageController());
      print(cont.userData.value!.id);
      await HttpHelper.instance.postRequest("bookchamp/help-and-support/", body: {
        "body": messageController.text,
        "user": cont.userData.value!.id,
      }).then((value) {
        if (value.status) {
          showFeedbackToast(context, 'Message sent!',
              type: ToastType.success);
          Get.offAll(()=> const Root());
          return;
        }
        // ErrorResponse errors = (value as ErrorResponse);
        // print(errors.errors.isEmpty? errors.message:errors.errors.first.errorMessage.first);
        // showFeedbackToast(context, errors.errors.isEmpty? errors.message:errors.errors.first.errorMessage.first,
        // type: ToastType.error);
        Fluttertoast.showToast(
          msg: 'Could not send message',
          backgroundColor: AppColor.appColor,
          textColor: AppColor.white,
        );
        
      });
    }
    else{
      Fluttertoast.showToast(msg: 'No Internet Connection',
          backgroundColor: AppColor.appColor, textColor: AppColor.white
      );
    }
  }

}