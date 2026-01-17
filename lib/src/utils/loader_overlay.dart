import 'package:intellyjent/src/core/core.dart';

class CustomLoader {
  static OverlayEntry? loaderOverlay;
  CustomLoader();

  static showLoader(BuildContext context) {
    loaderOverlay = OverlayEntry(builder: (context) {
      return const AnimatedLoaderWidget();
    });
    Overlay.of(context).insert(loaderOverlay!);
  }

  static removeLoader() {
    if (loaderOverlay != null && loaderOverlay!.mounted) {
      loaderOverlay?.remove();
    }
  }
}

class AnimatedLoaderWidget extends StatefulWidget {
  const AnimatedLoaderWidget({super.key});

  @override
  State<AnimatedLoaderWidget> createState() => _AnimatedLoaderWidgetState();
}

class _AnimatedLoaderWidgetState extends State<AnimatedLoaderWidget> {
  bool startBallMovement = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800)).then((value) {
      setState(() {
        startBallMovement = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      color: AppColor.appColor,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceIn,
            top: !startBallMovement?1 :-screenHeight * 0.1,
            right: !startBallMovement?1:-screenWidth * 0.12,
            bottom: !startBallMovement?1:null,
      left: !startBallMovement?1:null,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: startBallMovement?1:0,
              child: Container(
                  width: 197,
                  height: 197,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.lightBlue,
                  ),
                ),
            )
          ),
          // Bottom left circle
          Positioned(
            bottom: screenHeight * 0.00,
            left: -screenWidth * 0.21,
            child: GlowingWidget(
              milliseconds: 700,
              child: Container(
                width: 161,
                height: 161,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightBlue,
                ),
              ),
            ),
          ),
          // small top left circle
          Positioned(
            top: screenHeight * 0.15,
            left: screenWidth * 0.27,
            child: GlowingWidget(
              milliseconds: 1500,
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
          // small top right circle
          Positioned(
            top: screenHeight * 0.327,
            right: screenWidth * 0.052,
            child: GlowingWidget(
              milliseconds: 1000,
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.lightBlue,
                ),
              ),
            ),
          ),
          // small top left circle
          Positioned(
            top: screenHeight * 0.41,
            left: screenWidth * 0.092,
            child: GlowingWidget(
              milliseconds: 1600,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.yellow,
                ),
              ),
            ),
          ),
          // small bottom right circle
          Positioned(
            bottom: screenHeight * 0.07,
            right: screenWidth * 0.13,
            child: GlowingWidget(
              milliseconds: 900,
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.yellow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
