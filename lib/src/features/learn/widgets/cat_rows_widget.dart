import '../../../core/core.dart';

class CategoryRows extends StatelessWidget {
  const CategoryRows({
    super.key,
    required this.screenWidth,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.svgIcon1,
    required this.svgIcon2,
    required this.svgIcon3,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3, this.showThirdCategory = true,
  });

  final double screenWidth;
  final String name1;
  final String name2;
  final String name3;
  final String svgIcon1;
  final String svgIcon2;
  final String svgIcon3;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;
  final bool? showThirdCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: onTap1,
            child: Container(
              width: screenWidth * 0.27,
              height: screenWidth * 0.27,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.theme.brightness == Brightness.light ? AppColor.whiteOff : AppColor.darkAppNavBar),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgIcon1),
                  AppSizing.h12,
                  Flexible(
                      child: Text(
                    name1,
                    style: AppTextStyle.bodyVerySmall(context), textAlign: TextAlign.center,
                  ))
                ],
              ),
            ),
          ),
        ),
        AppSizing.h08,
        Flexible(
          child: GestureDetector(
            onTap: onTap2,
            child: Container(
              width: screenWidth * 0.27,
              height: screenWidth * 0.27,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.theme.brightness == Brightness.light ? AppColor.whiteOff : AppColor.darkAppNavBar),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgIcon2),
                  AppSizing.h12,
                  Flexible(
                      child: Text(
                    name2,
                    style: AppTextStyle.bodyVerySmall(context), textAlign: TextAlign.center,
                  ))
                ],
              ),
            ),
          ),
        ),
        AppSizing.h08,
        if (showThirdCategory == true) Flexible(
          child: GestureDetector(
            onTap: onTap3,
            child: Container(
              width: screenWidth * 0.27,
              height: screenWidth * 0.27,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.theme.brightness == Brightness.light ? AppColor.whiteOff : AppColor.darkAppNavBar),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgIcon3),
                  AppSizing.h12,
                  Flexible(
                      child: Text(
                    name3,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyVerySmall(context),
                  ))
                ],
              ),
            ),
          ),
        ),
        if (showThirdCategory == false) Container(
          width: screenWidth * 0.27,
        )
      ],
    );
  }
}
