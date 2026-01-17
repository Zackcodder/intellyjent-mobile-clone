import '../../../core/core.dart';

class SuccessErrorBottomSheet extends StatelessWidget {
  const SuccessErrorBottomSheet({
    super.key, this.isSuccess=true, this.transferredAmount,
  });

  final bool? isSuccess;
  final String? transferredAmount;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cont = Get.find<TellybucksDashboardPageController>();

    return Container(
      width: screenWidth,
      height: Get.height * 0.40,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TopSheetHandle(),
          AppSizing.h24,
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.brightness == Brightness.light
                  ? AppColor.lightBlue.withOpacity(0.3)
                  : AppColor.darkAppNavBar
            ),
            child: SvgPicture.asset(
              isSuccess == true ? Assets.tellyTickCircle : Assets.tellyInfoCircle,
              width: 40,
            ),
          ),
          AppSizing.h24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RichText(
              textAlign: TextAlign.center,
              softWrap: true,
              text: isSuccess == true
                  ? TextSpan(
                children: [
                  TextSpan(
                    text: 'N$transferredAmount ',
                    style: AppTextStyle.bodyMedium(context).copyWith(
                      fontWeight: FontWeight.bold, color:
                        Get.theme.brightness == Brightness.light
                            ? null : AppColor.grey200
                    ),
                  ),
                  TextSpan(
                    text: 'was successfully sent to your account',
                    style: AppTextStyle.bodyMedium(context).copyWith(
                      color: Get.theme.brightness == Brightness.light
                          ? null : AppColor.grey200
                    ),
                  ),
                ],
              )
                  : TextSpan(
                children: [
                  TextSpan(
                    text: 'Sorry your withdrawal was not successful, please try again later',
                    style: AppTextStyle.bodyMedium(context).copyWith(
                      color: Get.theme.brightness == Brightness.light
                          ? null : AppColor.grey200
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppSizing.h18,
          ButtonWidget(
            buttonText: isSuccess == true ? 'Done' : 'Try Again',
            borderSideColor: Colors.transparent,
            textColor: AppColor.white,
            backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
            onPressed: () {
              if(isSuccess == true){

                Get.back;
                Get.back;
                Get.back();
                Get.back();
                cont.geAffiliateInfo(true);
              }else{
                Get.back;
                Get.back();
              }
            },
            fontSize: 17,
          ),
        ],
      ),
    );
  }
}
