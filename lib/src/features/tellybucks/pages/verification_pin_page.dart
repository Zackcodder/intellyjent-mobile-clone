import 'package:intellyjent/src/core/core.dart';

class TellybucksVerificationPinPage extends StatelessWidget {
  const TellybucksVerificationPinPage({super.key, this.isChangePin = false, this.isTransferPinConfirmation = false, this.withdrawalAmount});

  final bool? isChangePin;
  final bool? isTransferPinConfirmation;
  final String? withdrawalAmount;

  @override
  Widget build(BuildContext context) {
    TellybucksSettingsPageController controller;
    if (Get.isRegistered<TellybucksSettingsPageController>()) {
      controller = Get.find<TellybucksSettingsPageController>();
    } else {
      controller = Get.put(TellybucksSettingsPageController());
    }
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppNavBar,
        toolbarHeight: screenHeight < 670 ? 90 : 130,
        automaticallyImplyLeading: false,
        title: HeaderWidget(
          title: isChangePin == true ? 'Change Pin' : 'Confirm Pin',
          showBackButton: true,
        ),
      ),
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppNavBar,
      body: Padding(
        padding: screenWidth < 800
            ? const EdgeInsets.symmetric(horizontal: 20)
            : const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSizing.h20,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: isChangePin == true
                            ? "Confirm new pin"
                            : 'Confirm pin'),
                  ],
                  style: AppTextStyle.bodyMedium(context),
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Pinput(
                  length: 4,
                  keyboardType: TextInputType.number,
                  preFilledWidget: Container(
                    width: screenWidth < 800 ? 10 : 20,
                    height: screenWidth < 800 ? 3 : 6,
                    color: AppColor.grey200,
                  ),
                  controller: controller.pinVerController,
                  defaultPinTheme: PinTheme(
                    height: screenWidth < 800 ? 40 : 80,
                    width: screenWidth < 800 ? 60 : 100,
                    textStyle: AppTextStyle.h5(context),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: AppColor.grey),
                    ),
                  ),
                ),
              ),
              AppSizing.h48,
              ButtonWidget(
                buttonText: isChangePin == true || isTransferPinConfirmation == true ? 'Confirm' : 'Save pin',
                fontSize: 17,
                shouldShowLoader: true,
                textColor: AppColor.white,
                borderSideColor: Colors.transparent,
                backgroundColor:
                    const MaterialStatePropertyAll(AppColor.appColor),
                onPressed: () async {
                  //if confirmation pin
                  if(isTransferPinConfirmation == true){
                    if(controller.pinVerController.text.length == 4 ){
                      controller.withdrawalAmountController.text = withdrawalAmount!;
                      await controller.initiateTransfer();
                    }
                  }else {
                    if (controller.pinController.text.length == 4 &&
                        controller.pinController.text ==
                            controller.pinVerController.text) {
                      if (isChangePin == false) {
                        controller.setNewPin();
                      } else {
                        controller.changeOldPin();
                      }
                      if (isChangePin == true) {
                        Get.back();
                        Get.back();
                        Get.back();
                      }
                      else {
                        Get.back();
                        Get.back();
                      }
                    } else {
                      Get.snackbar(
                          'Error', 'pins did not match, please try again',
                          backgroundColor: AppColor.red,
                          colorText: AppColor.white);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
