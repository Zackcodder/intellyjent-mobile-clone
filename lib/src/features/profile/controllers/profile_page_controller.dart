import 'package:intellyjent/src/core/models/quiz/gamemode_model.dart';

import '../../../core/core.dart';

class ProfilePageController extends GetxController {
  RxBool allowNotifications = false.obs;
  RxBool isLoading = false.obs;
  Rx<User?> userData = Rx<User?>(null);

  ///game mode 
  var gems = <Gem>[
    Gem(name: 'Emerald', imagePath: 'assets/images/emerald.png'),
    Gem(name: 'Ruby', imagePath: 'assets/images/ruby.png'),
    Gem(name: 'Diamond', imagePath: 'assets/images/diamond.png'),
    Gem(name: 'Sapphire', imagePath: 'assets/images/sapphire.png'),
  ];

  var selectedGem = Gem(name: 'Emerald', imagePath: 'assets/images/emerald.png').obs;

  void setSelectedGem(Gem gem) {
    selectedGem.value = gem;
  }


  Future getUserData() async {
    isLoading.value = true;
    try {
      final response = await HttpHelper.instance.getDynamicRequest("accounts", UserData.userId!);

      if (response["status"] == "success") {
        final userDataR = User.fromJson(response["data"]);
        userData(userDataR);
        UserData.updateAll(response["data"]);
      } else {
      }
    }finally {
      isLoading.value = false;
    }
  }


  updateAllowNotifications(bool val) {
    allowNotifications(val);
  }

  updateUser(User newUserData) {
    userData(newUserData);
  }

  void logout() {
    userData(null);
    UserData.logout();
  }
}
