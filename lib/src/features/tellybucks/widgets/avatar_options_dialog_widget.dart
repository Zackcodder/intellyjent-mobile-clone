

import '../../../core/core.dart';

class AvatarOptionsDialog extends StatelessWidget {
  final ProfilePageController controller;

  const AvatarOptionsDialog({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(TellybucksDashboardPageController());
    final screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: const FeedbackBackgroundClipper(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          color: Get.theme.brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkContainer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSizing.h18,
              Text(
                'Click here to choose',
                style: AppTextStyle.h5(context).copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              AppSizing.h24,
              ListTile(
                tileColor: Colors.transparent,
                leading: SvgPicture.asset(Assets.assetsBankBlack,
                    color: Get.theme.brightness == Brightness.light
                        ? AppColor.grey400
                        : AppColor.white
                ),
                title: Text('Save/Update Bank Details', style: AppTextStyle.bodyMedium(context),),
                onTap: () async{
                  if (cont.affiliateInfo.value == null) {
                    await cont.geAffiliateInfo(false);
                  }
                  print(cont.affiliateInfo.value?.accountNumber);
                  if(cont.affiliateInfo.value?.accountNumber != null) {
                    cont.resetBankControllers();
                    Get.back();
                    Get.bottomSheet(
                      ChangeBankAccountBottomSheet(
                        cont: cont,
                      ),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );
                  }else{
                    cont.resetBankControllers();
                    Get.back();
                    Get.bottomSheet(
                      SaveEditBankBottomSheet(
                        cont: cont,
                      ),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );
                  }
                },
                trailing: SvgPicture.asset(Assets.assetsArrowRightCurved,
                    width: screenWidth < 800 ? null : 50,
                    color: Get.theme.brightness == Brightness.light
                        ? AppColor.grey400
                        : AppColor.white
                ),
              ),
              const Divider(
                color: AppColor.grey,
              ),
              ListTile(
                leading: SvgPicture.asset(Assets.tellybucksKey,
                    color: Get.theme.brightness == Brightness.light
                        ? AppColor.grey400
                        : AppColor.white),
                title: Text('Set/Change Pin', style: AppTextStyle.bodyMedium(context)),
                onTap: () async {
                  bool? pinExists = cont.affiliateInfo.value!.pinStatus;

                  if(pinExists == null ){
                    return;
                  }
                  else{
                    if (!pinExists) {
                      // If no PIN is stored, navigate to the "Set New Pin" page
                      Get.back();
                      Get.to(
                            () => const TellyBucksNewPinPage(isChangePin: false),
                        transition: Transition.upToDown,
                      );
                    } else {
                      // If a PIN is stored, navigate to the "Old Pin" page to change the PIN
                      Get.back();
                      Get.to(
                            () => const TellyBucksOldPinPage(),
                        transition: Transition.upToDown,
                      );
                    }
                  }


                },
                trailing: SvgPicture.asset(Assets.assetsArrowRightCurved,
                    width: screenWidth < 800 ? null : 50,
                    color: Get.theme.brightness == Brightness.light
                        ? AppColor.grey400
                        : AppColor.white
                ),
              ),
              // const Divider(
              //   color: AppColor.grey,
              // ),
              // ListTile(
              //   leading: SvgPicture.asset(Assets.referralCodeIcon,
              //       colorFilter: ColorFilter.mode(Get.theme.brightness == Brightness.light
              //           ? AppColor.grey400
              //           : AppColor.white, BlendMode.src)),
              //   title: const Text('Referral Code'),
              //   onTap: () {
              //     Get.dialog(
              //       Dialog(
              //         backgroundColor: Colors.transparent,
              //         surfaceTintColor: Colors.transparent,
              //         clipBehavior: Clip.none,
              //         insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: ReferralCodeDialog(
              //           screenWidth: screenWidth,
              //         ),
              //       ),
              //       useSafeArea: true,
              //       barrierDismissible: true,
              //     );
              //   },
              //   trailing: SvgPicture.asset(Assets.assetsArrowRightCurved,
              //       width: screenWidth < 800 ? null : 50,
              //       colorFilter: ColorFilter.mode(
              //         Theme.of(context).brightness == Brightness.dark
              //             ? AppColor.grey200 : AppColor.grey400,
              //         BlendMode.srcIn,
              //       )
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
