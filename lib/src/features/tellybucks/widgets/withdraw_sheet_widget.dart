import '../../../core/core.dart';

class WithdrawBottomSheet extends StatelessWidget {
  const WithdrawBottomSheet({
    super.key,
    required this.cont,
  });

  final TellybucksDashboardPageController cont;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Container(
      width: Get.width,
      height: Get.height * 0.44,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Get.theme.brightness == Brightness.light
            ? AppColor.whiteOff
            : AppColor.darkAppBg,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TopSheetHandle(),
            AppSizing.h24,
            Text(
              'Withdraw to Bank',
              style: AppTextStyle.h5(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            AppSizing.h06,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Withdrawable  Amount: ',
                  style: AppTextStyle.bodySmallLight(context).copyWith(
                    color: Get.theme.brightness == Brightness.light
                        ? AppColor.appBlack.withOpacity(0.8)
                        : AppColor.grey200,
                  ),
                ),
                Text(
                  '₦${cont.withdrawableFormattedAmount.value}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Get.theme.brightness == Brightness.dark
                        ? Colors.white
                        : AppColor.appBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            AppSizing.h12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Text(
                'First withdrawal? You need to save your account details in settings',
                style: AppTextStyle.bodySmallLight(context).copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: CustomInputField(
                      fieldName: '',
                      hintText: 'Amount to withdraw',
                      controller: cont.withdrawalAmountController,
                      inputType: TextInputType.number,
                      validator: (string) {
                        if (string.toString().isEmpty) {
                          return "Amount cannot be empty";
                        }

                        // Check if the input is a valid number
                        final parsedValue = int.tryParse(string);
                        if (parsedValue == null) {
                          return "Please enter a valid number";
                        }

                        // Check if the value is within the required range
                        if (parsedValue < 176 || parsedValue > 50000) {
                          return "Amount must be between 176 and 50,000";
                        }
                        return null;
                      },
                    ),
                  ),
                  ButtonWidget(
                    buttonText: 'Withdraw',
                    borderSideColor: Colors.transparent,
                    textColor: AppColor.white,
                    shouldShowLoader: true,
                    backgroundColor:
                        const MaterialStatePropertyAll(AppColor.appColor),
                    onPressed: () async {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        Get.back();
                        Get.to(
                          () => TellybucksVerificationPinPage(
                            isTransferPinConfirmation: true,
                            withdrawalAmount:
                                cont.withdrawalAmountController.text.trim(),
                          ),
                          transition: Transition.rightToLeftWithFade,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
                    },
                    fontSize: 17,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
