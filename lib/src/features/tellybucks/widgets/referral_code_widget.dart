
import '../../../core/core.dart';

class ReferralCodeDialog extends StatelessWidget {
  const ReferralCodeDialog({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfilePageController());

    return ClipPath(
      clipper: const FeedbackBackgroundClipper(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: screenWidth * 0.8,
          height:
          screenWidth * 0.8,
          decoration: BoxDecoration(
            color: Get.theme.brightness == Brightness.light
          ? AppColor.whiteOff
            : AppColor.darkAppNavBar,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Referral Code',
                style: AppTextStyle
                    .h5(
                    context)
                    .copyWith(
                    color: AppColor
                        .appColor,
                    fontWeight: FontWeight.bold),
              ),
              AppSizing.h12,
              RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'your referral code is ',
                      style: AppTextStyle.bodyMedium(context).copyWith(
                        color:
                        AppColor.appBlack.withOpacity(0.7),
                          ),
                    ),
                    TextSpan(
                      text: UserData.referralCode ?? '',
                      style: AppTextStyle.bodyMedium(context)
                          .copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              AppSizing.h12,
              ButtonWidget(buttonText: 'Copy',
                onPressed: () async{
                  await Clipboard.setData(ClipboardData(
                      text: UserData.referralCode
                          .toString()));
                  Fluttertoast.showToast(
                    msg: 'Referral Code Copied!',
                    textColor: AppColor.white,
                    backgroundColor: AppColor.appColor,
                  );
                  Get.back();
                },
                fontSize: 17,
                backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                textColor: AppColor.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
