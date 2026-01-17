import '../core/core.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool showBackButton;
  final bool? showLogo;

  const HeaderWidget({
    super.key,
    required this.title,
    this.onTap,
    this.showBackButton = true,
    this.showLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (showBackButton)
            Positioned(
              left: 0,
              child: GestureDetector(
                  onTap: () => onTap ?? Get.back(),
                  child: SvgPicture.asset(Assets.assetsArrowLeft,
                      width:
                      screenWidth < 370
                          ? null
                          : screenWidth < 650 ? 29 : 60,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColor.grey200 : AppColor.appBlack.withOpacity(0.8),
                        BlendMode.srcIn,
                      )
                  )),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(showLogo == true) SvgPicture.asset(
                Assets.assetsLogo,
                width: screenWidth < 800 ? 28 : 35,
                colorFilter: const ColorFilter.mode(
                  AppColor.appColor,
                  BlendMode.srcIn,
                ),),
              AppSizing.w08,
              Text(
                title,
                style: screenWidth < 850
                    ? AppTextStyle.h5(context).copyWith( fontWeight: FontWeight.w800)
                    : AppTextStyle.h4(context).copyWith( fontWeight: FontWeight.w500)
                ,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
