
import '../../../core/core.dart';

class HomePageController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> loadUserData() async {
    isLoading.value = true;

    try {
      var response = await HttpHelper.instance.getDynamicRequest("accounts", '${UserData.userId}');
      if (response['status'] == 'success') {
        // Update UserData only when the response indicates success
        Map<String, dynamic> userData = response['data'] as Map<String, dynamic>;
        UserData.updateAll(userData);
      } else {
        // Handle error when the response status is not success
        print('Error loading user data: ${response['message']}');
      }
    } catch (e) {
      // Handle errors
      print('Error loading user data: $e');
    }finally{
      Future.delayed(Duration.zero, () {
        isLoading.value = false;
      });
    }
  }

}