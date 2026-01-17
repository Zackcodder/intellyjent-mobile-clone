import '../../../core/core.dart';

class GameLoadingPage extends StatelessWidget {
  const GameLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
        color: Theme.of(context).splashColor,
        width: screenWidth,
        height: screenHeight,
        child: Stack(children: [
          // Animated top right circle
          Positioned(
              top: -screenHeight * 0.1,
              right: -screenWidth * 0.12,
              child: Container(
                width: 197,
                height: 197,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightBlue,
                ),
              )),
          // Bottom left circle
          Positioned(
            bottom: screenHeight * 0.00,
            left: -screenWidth * 0.21,
            child: Container(
              width: 161,
              height: 161,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.27,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
            ),
          ),
          // small top right circle
          Positioned(
            top: screenHeight * 0.327,
            right: screenWidth * 0.052,
            // child: GlowingWidget(
            //   milliseconds: 700,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          // ),
          // small top left circle
          Positioned(
            top: screenHeight * 0.41,
            left: screenWidth * 0.092,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
            ),
          ),
          // small bottom right circle
          Positioned(
            bottom: screenHeight * 0.07,
            right: screenWidth * 0.13,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppSizing.h04,
            const LoadingAnimation(),
              ],
            ),
        ]));
  }
}

