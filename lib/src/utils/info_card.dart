import '../core/core.dart';

class InfoCard{
  Container infoCard(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.160,
      decoration: BoxDecoration(
          color: Get.theme.brightness == Brightness.light
              ? AppColor.appColor
              : AppColor.darkAppBg,
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // circles
          Positioned(
            top: screenHeight * 0.02,
            right: -screenWidth * 0.18,
            child: Container(
              width: screenWidth < 800 ? 105 : 165,
              height: screenWidth < 800 ? 105 : 165,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.01,
            left: -screenWidth * 0.15,
            child: Container(
              width: screenWidth < 800 ? 114 : 174,
              height: screenWidth < 800 ? 114 : 174,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.03,
            left: screenWidth * 0.17,
            child: Container(
              width: screenWidth < 800 ? 27 : 87,
              height: screenWidth < 800 ? 27 : 87,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.264,
            child: Container(
              width: screenWidth < 800 ? 20 : 60,
              height: screenWidth < 800 ? 20 : 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            right: screenWidth * 0.194,
            child: Container(
              width: screenWidth < 800 ? 49 : 109,
              height:  screenWidth < 800 ? 49 : 109,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightYellow.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container infoCardAbout(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      width: screenWidth,
      height: screenHeight * 0.230,
      decoration: BoxDecoration(
          color: Get.theme.brightness == Brightness.light
              ? AppColor.appColor
              : AppColor.darkAppNavBar,
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // circles
          Positioned(
            top: screenHeight * 0.02,
            right: -screenWidth * 0.18,
            child: Container(
              width: 105,
              height: 105,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.02,
            left: -screenWidth * 0.15,
            child: Container(
              width: 114,
              height: 114,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.03,
            left: screenWidth * 0.17,
            child: Container(
              width: 27,
              height: 27,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.264,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue.withOpacity(0.5),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.12,
            right: screenWidth * 0.194,
            child: Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightYellow.withOpacity(0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}