

import '../../../core/core.dart';

class ChangeBankAccountBottomSheet extends StatelessWidget {
  const ChangeBankAccountBottomSheet({
    super.key,
    required this.cont,
  });

  final TellybucksDashboardPageController cont;

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(BankPageController());

    return Container(
      width: Get.width,
      height: Get.height < 370 ? Get.height * 0.85 : Get.height * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Get.theme.brightness == Brightness.light
            ? AppColor.whiteOff
            : AppColor.darkAppNavBar,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const TopSheetHandle(),
          AppSizing.h18,
          Text(
            'Withdraw to Bank',
            style: AppTextStyle.h5(context).copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          AppSizing.h08,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Withdraw ',
                style: AppTextStyle.bodyMedium(context).copyWith(
                  color: Get.theme.brightness == Brightness.light
                      ? null : AppColor.grey,
                ),
              ),
              Text(
                'N${cont.formattedAmount.value} ',
                style: AppTextStyle.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.bold, color: Get.theme.brightness == Brightness.light
                    ? null : AppColor.grey
                ),
              ),
              Text(
                'to: ',
                style: AppTextStyle.bodyMedium(context).copyWith(
                  color: AppColor.appBlack,
                ),
              ),
            ],
          ),
          AppSizing.h06,
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      CustomInputField(
                        fieldName: '',
                        hintText: cont.affiliateInfo.value?.accountNumber,
                        controller: cont.accountNumberController,
                        disabled: true,
                      ),
                      CustomInputField(
                        fieldName: '',
                        hintText: cont.affiliateInfo.value?.accountName,
                        disabled: true,
                        controller: cont.accountNameController,
                      ),
                      Obx(
                            () => CustomInputFieldBank(
                          controller: cont.userBankName.value,
                          readOnly: true,
                          disabled: true,
                          onTap: () async {
                            Get.dialog(
                              Dialog(
                                backgroundColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                clipBehavior: Clip.none,
                                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                                child: PopScope(
                                  canPop: true,
                                  child: TellyBucksSelectBankDialog(
                                    ctl: cont,
                                    selectedIndex: ctl.optionIndex.value,
                                  ),
                                ),
                              ),
                              barrierDismissible: true,
                            );
                          },
                          suffixIcon: SvgPicture.asset(
                            Assets.assetsArrowDown,
                            color: AppColor.grey200,
                          ),
                          hintText: "Select Bank",
                          fieldName: '',
                          validator: (v) {
                            return null;
                          },
                        ),
                      ),
                      AppSizing.h24,
                      ButtonWidget(
                        buttonText: 'Proceed',
                        padding: EdgeInsets.zero,
                        borderSideColor: Colors.transparent,
                        textColor: AppColor.white,
                        shouldShowLoader: true,
                        backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                        onPressed: () async {
                          Get.back();
                          Get.bottomSheet(
                            WithdrawBottomSheet(
                              cont: cont,
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                          );
                        },
                        fontSize: 17,
                      ),
                      ButtonWidget(
                        buttonText: 'Change Account',
                        borderSideColor: AppColor.appColor.withOpacity(0.3),
                        textColor: AppColor.appColor,
                        backgroundColor: Get.theme.brightness == Brightness.light
                            ? null : const MaterialStatePropertyAll(AppColor.darkContainer),
                        onPressed: () {
                          Get.back();
                          Get.bottomSheet(
                            SaveEditBankBottomSheet(
                              cont: cont,
                              isEdit: true,
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                          );

                        },
                        fontSize: 17,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
