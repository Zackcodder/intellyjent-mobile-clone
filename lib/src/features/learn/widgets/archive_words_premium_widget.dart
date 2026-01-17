import '../../../core/core.dart';

class ArchiveWordsPremiumWidget extends StatelessWidget {
  const ArchiveWordsPremiumWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.to(() => const PremiumCategoryListPage(),
              transition: Transition.upToDown),
          child: Container(
            height: screenWidth * 0.12,
            width: screenWidth * 0.35,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.whiteOff
                    : AppColor.darkAppNavBar),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    Get.theme.brightness == Brightness.light
                        ? Assets.premiumIcon
                        : Assets.premiumDarkIcon,
                    width: 22),
                AppSizing.w08,
                Text(
                  'Premium+',
                  style: AppTextStyle.bodyVerySmall(context),
                )
              ],
            ),
          ),
        ),
        AppSizing.w16,
        GestureDetector(
          onTap: () => {Get.to(() => const ArchivedListPage())},
          child: Container(
            height: screenWidth * 0.12,
            width: screenWidth * 0.35,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.whiteOff
                    : AppColor.darkAppNavBar),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    Get.theme.brightness == Brightness.light
                        ? Assets.archiveArticleIcon
                        : Assets.archiveArticleDarkIcon,
                    width: 22),
                AppSizing.w08,
                Text(
                  'Archive',
                  style: AppTextStyle.bodyVerySmall(context),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
