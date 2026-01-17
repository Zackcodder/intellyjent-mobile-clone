import '../../../core/core.dart';

class DeletePageController extends GetxController {
  RxList<bool> checkboxValues = <bool>[].obs;
  RxString otherReason = ''.obs;
  RxList<String> deletionReasons = <String>[].obs;
  RxList<String> checkedReasons = <String>[].obs;


  @override
  void onInit() async {
    await getDeactivationReasons();
    super.onInit();
  }

  void toggleCheckbox(int index) {
    checkboxValues[index] = !checkboxValues[index];

    if (checkboxValues[index]) {
      // Add the reason to the checkedReasons list
      checkedReasons.add(deletionReasons[index]);
    } else {
      // Remove the reason from the checkedReasons list
      checkedReasons.remove(deletionReasons[index]);
    }
  }

  Future<void> getDeactivationReasons() async {
    try {
      final response = await HttpHelper.instance.getDynamicRequest("accounts/deactivation-reasons", '');

      if (response["status"] == "success") {
        checkboxValues.assignAll(List<bool>.filled(response["data"].length, false).obs);
        deletionReasons.assignAll(List<String>.from(response["data"]).obs);

        print('reasons $deletionReasons');
      } else {
        print('Error: ${response["message"]}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future postDeactivationReasons() async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      await HttpHelper.instance.postRequest("accounts/deactivation-feedback", body: {
        "reasons": checkedReasons.toList(),
        "other_reason": otherReason.value
      }).then((value) {
        if (value.status) {
          return;
        }
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

  void deleteUserAccount() async {

    try {
      var deleteResponse = await HttpHelper.instance.deleteRequest("accounts", UserData.userId!);

      if (deleteResponse.status) {
        await postDeactivationReasons();
        print(deleteResponse.message);
        UserData.logout();
        Get.off(()=> const DeletedAccount());
      } else {

        print('Failed to delete account: ${deleteResponse.message}');
        Fluttertoast.showToast(msg: deleteResponse.message, backgroundColor: AppColor.appColor, textColor: AppColor.white);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

}