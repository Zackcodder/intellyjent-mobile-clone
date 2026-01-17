import 'package:intellyjent/src/core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class OnBoardingController extends GetxController {
  final shouldShowLogo = false.obs;
  final showLogoText = false.obs;
  final pageController = PageController().obs;
  final pageIndex = 0.0.obs;
  final buildNumber = ''.obs;

  updateShouldShowLogo() {
    shouldShowLogo(true);
  }

  updatePageIndex(value) {
    pageIndex(value);
  }

  updateShowLogoText() {
    showLogoText(true);
  }

  Future<void> fetchBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    buildNumber(packageInfo.buildNumber);
    OneSignal.InAppMessages.addTrigger("versionCode", buildNumber.value);
    print(buildNumber.value);
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 1500), () {
      updateShouldShowLogo();
    });

    fetchBuildNumber();

    pageController.value.addListener(() {
      if (pageController.value.hasClients) {
        updatePageIndex(pageController.value.page);
      }
    });
  }
}
