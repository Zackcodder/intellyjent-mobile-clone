
import '../../../core/core.dart';

class SaveEditBankBottomSheet extends StatelessWidget {
  const SaveEditBankBottomSheet({
    super.key,
    required this.cont,
    this.isEdit = false,
  });

  final TellybucksDashboardPageController cont;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(BankPageController());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Container(
      width: Get.width,
      height: Get.height * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Get.theme.brightness == Brightness.light
            ? AppColor.whiteOff
            : AppColor.darkAppBg,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'Withdraw ',
          //       style: AppTextStyle.bodyMedium(context).copyWith(
          //         color: Get.theme.brightness == Brightness.light
          //             ? AppColor.appBlack.withOpacity(0.8)
          //             : AppColor.grey,
          //       ),
          //     ),
          //     Text(
          //       'N${cont.formattedAmount.value} ',
          //       style: AppTextStyle.bodyMedium(context).copyWith(
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //     Text(
          //       'to: ',
          //       style: AppTextStyle.bodyMedium(context).copyWith(
          //         color: Get.theme.brightness == Brightness.light
          //             ? AppColor.appBlack.withOpacity(0.8)
          //             : AppColor.grey,
          //       ),
          //     ),
          //   ],
          // ),
          // AppSizing.h06,
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomInputField(
                          fieldName: '',
                          hintText: '0213217123',
                          controller: cont.accountNumberController,
                        ),
                        CustomInputField(
                          fieldName: '',
                          hintText: 'John Doe',
                          controller: cont.accountNameController,
                          formatter: [
                            CapitalizeTextInputFormatter()
                          ],
                        ),
                        Obx(
                              () => CustomInputFieldBank(
                            controller: cont.selectBankController.value,
                            readOnly: true,
                            onTap: () async {
                              Get.dialog(
                                Dialog(
                                  backgroundColor: Colors.transparent,
                                  surfaceTintColor: Colors.transparent,
                                  clipBehavior: Clip.antiAlias,
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
                          buttonText: isEdit == false ? 'Save' : 'Update',
                          padding: EdgeInsets.zero,
                          borderSideColor: Colors.transparent,
                          textColor: AppColor.white,
                          backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                          shouldShowLoader: true,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await cont.saveUpdateBankInfo(cont, () async {
                                Get.back();
                                Get.back;
                                await Future.delayed(const Duration(milliseconds: 500));
                                Get.bottomSheet(
                                  WithdrawBottomSheet(
                                    cont: cont,
                                  ),
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                );
                              });
                            }
                          },
                          fontSize: 17,
                        ),
                      ],
                    ),
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
