import '../../../core/core.dart';

class OnboardingSlide extends StatelessWidget {
  final String illustration;
  final String text;
  const OnboardingSlide(
      {super.key, required this.illustration, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int radius = screenWidth < 800 ? 35 : 50;
    final ctl = Get.put(OnBoardingController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // padding: EdgeInsets.symmetric(horizontal: AppSizing.padding.horizontal),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: SvgPicture.asset(illustration),
          ),
          Expanded(
              child: Stack(
            children: [
              ClipPath(
                clipper: OnboardingContentClipper(radius),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizing.padding.horizontal),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                         Stack(
                          alignment: Alignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const PageIndicator(),
                            Builder(
                              builder: (context) {
                                if (ctl.pageController.value.hasClients && ctl.pageIndex.value <= 1) {
                                  return Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () => Get.offAll(() => const Login()),
                                      child: Text(
                                        "Skip",
                                        style: AppTextStyle.h5(context)
                                            .copyWith(fontWeight: FontWeight.w400, fontSize: 19),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            )

                          ],
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text(text,
                                              style: AppTextStyle.h4Regular(context).copyWith(
                                                fontSize: screenWidth < 800 ? 16 : 24
                                              ),
                                              textAlign: TextAlign.center))),
                                  SizedBox(
                                    height: radius * 2 + 15 + 15,
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: .0),
                  child:
                      GetBuilder<OnBoardingController>(builder: (controller) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent),
                      child: InkWell(
                        onTap: () {
                          if (controller.pageController.value.page == 2) {
                            Get.offAll(()=> const Login());
                          }
                          controller.pageController.value.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius:
                              (MediaQuery.of(context).size.longestSide * 0.05)
                                  .clamp(10, radius)
                                  .toDouble(),
                          backgroundColor: AppColor.lightYellow,
                          child: SvgPicture.asset(
                            Assets.assetsArrowRight,
                            width: screenWidth < 800 ? null : 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class OnboardingContentClipper extends CustomClipper<Path> {
  final int radius;
  const OnboardingContentClipper(this.radius);

  @override
  Path getClip(Size size) {
    int spacingFromRadius = 25;
    int startOfBottomCurve = 10;
    double h = size.height;
    double w = size.width;
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, h);
    path.lineTo(
        ((w / 2) - (radius + spacingFromRadius + 3 * startOfBottomCurve)), h);

    path.quadraticBezierTo(
      (w / 2) - (radius + spacingFromRadius),
      h,
      (w / 2) - (radius + spacingFromRadius),
      h - (radius / 2),
    );

    path.cubicTo(
        (w / 2) - (radius + spacingFromRadius),
        h,
        w / 2 - (radius + spacingFromRadius),
        h - (2 * radius) - 10,
        w / 2,
        h - ((2 * radius) + spacingFromRadius - 10));

    path.cubicTo(
        w / 2,
        h - ((2 * radius) + spacingFromRadius - 10),
        (w / 2) + (radius + spacingFromRadius) - 10,
        h - (2 * radius + spacingFromRadius) + 5,
        (w / 2) + (radius + spacingFromRadius),
        h - (radius / 2));

    path.quadraticBezierTo(
      (w / 2) + (radius + spacingFromRadius),
      h + 5,
      (w / 2) + (radius + spacingFromRadius + startOfBottomCurve + 40),
      h,
    );

    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
