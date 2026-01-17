import '../../../core/core.dart';

class SelectBankPage extends StatelessWidget {
  const SelectBankPage(
      {super.key, required this.sillver, required this.amount});

  final int sillver;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    // final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(BankPageController());

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Select Bank'),
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: MediaQuery.of(context).size.width < 800
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: screenWidth,
                  child: Text(
                    'Choose your bank to pay ₦${amount.toInt()} to get ${sillver.toInt()} sillver',
                    style: TextStyle(
                      fontSize: screenWidth < 800 ? 16 : 20,
                      color: Get.theme.brightness == Brightness.dark
                          ? Colors.white
                          : AppColor.appBlack,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSizing.h28,
                SizedBox(
                  width: screenWidth,
                  child: SvgPicture.asset(
                    Assets.assetsBankBlack,
                    color: Get.theme.brightness == Brightness.dark ? AppColor.grey200 : null,
                    width: screenWidth < 800 ? 30 : 70,
                  ),
                ),
                AppSizing.h12,
                CustomInputFieldBank(
                  controller: ctl.selectBankController.value,
                  readOnly: true,
                  onTap: () async {
                    Get.dialog(
                        Dialog(
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            clipBehavior: Clip.none,
                            insetPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: PopScope(
                                canPop: true,
                                child: SelectBankDialog(
                                  ctl: ctl,
                                  selectedIndex: ctl.optionIndex.value,
                                ))),
                        barrierDismissible: true);
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
                AppSizing.h48,
                Obx(
                  () => ButtonWidget(
                      buttonText: ctl.selectBankController.value.isNotEmpty
                          ? 'Proceed'
                          : 'Cancel Payment',
                      fontSize: 17,
                      backgroundColor: ctl.selectBankController.value.isNotEmpty
                          ? const MaterialStatePropertyAll(AppColor.appColor)
                          : Get.theme.brightness == Brightness.dark 
                            ? MaterialStatePropertyAll(AppColor.whiteOff2.withOpacity(0.05)) : const MaterialStatePropertyAll(AppColor.whiteOff2),
                      borderSideColor: Colors.transparent,
                      textColor: ctl.selectBankController.value.isNotEmpty
                          ? AppColor.white
                          : Get.theme.brightness == Brightness.dark
                          ? AppColor.whiteOff2.withOpacity(0.6) : AppColor.appBlack,
                      onPressed: () {
                        if (ctl.selectBankController.value == '') {
                          Get.back();
                          Get.back();
                          return;
                        }
                        Get.to(() => PaymentMethodPage(
                              sillver: sillver,
                              amount: amount,
                              selectedBank: ctl.banks[ctl.optionIndex.value],
                            ), transition: Transition.upToDown);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
