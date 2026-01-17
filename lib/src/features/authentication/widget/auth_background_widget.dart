import 'package:intellyjent/src/core/core.dart';

class AuthBackgroundWidget extends StatelessWidget {
  const AuthBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;


    return Container(
      color: Get.theme.brightness == Brightness.light
          ? AppColor.appColor
          : AppColor.darkAppBg,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            top: -screenHeight * 0.1,
            left: -screenWidth * 0.2,
                child: Container(
                  width: (screenWidth * 0.55).clamp(130, 200),
                  height: (screenWidth * 0.55).clamp(130, 200),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.lightBlue,
                  ),
                )),
                Positioned(
            top: screenHeight * 0.1,
            right: (screenWidth * 0.25),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white,
                  ),
                )),
          Positioned(
            top: screenHeight * 0.2,
            right: -(screenWidth * 0.65).clamp(130, 250)*0.4,
                child: Container(
                  width: (screenWidth * 0.65).clamp(130, 250),
                  height: (screenWidth * 0.65).clamp(130, 250),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.lightYellow,
                  ),
                )),
                Positioned(
            top: screenHeight * 0.3,
            left: 40*0.3,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.yellow,
                  ),
                )),
        ],
      ),
    );
  }
}