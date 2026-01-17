import 'package:intellyjent/src/core/core.dart';

class TellyBucksNewPinPage extends StatelessWidget {
  const TellyBucksNewPinPage({super.key, this.isChangePin = false});

  final bool? isChangePin;

  @override
  Widget build(BuildContext context) {
    TellybucksSettingsPageController controller = Get.put(TellybucksSettingsPageController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight= MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppNavBar,
        toolbarHeight: screenHeight < 670 ? 90 : 130,
        automaticallyImplyLeading: false,
        title: HeaderWidget(title: isChangePin == false
                                  ? 'Set Transaction Pin'
                                  : 'Change Pin', showBackButton: true, ),
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
            children: [
              AppSizing.h20,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: isChangePin == false
                        ? 'Enter your 4-digit transaction pin'
                        : 'Enter the new pin'),
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
                  controller: controller.pinController,
                  defaultPinTheme: PinTheme(
                    height: screenWidth < 800 ? 40 : 80,
                    width: screenWidth < 800 ? 60 : 100,
                    textStyle: AppTextStyle.h5(context),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(width: 1, color: AppColor.grey),
                    ),
                  ),
                ),
              ),
              AppSizing.h48,
              ButtonWidget(
                buttonText: isChangePin == false
                    ? 'Continue' : 'Enter',
                fontSize: 17,
                shouldShowLoader: true,
                textColor: AppColor.white,
                borderSideColor: Colors.transparent,
                backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                onPressed: () {
                  // Validate the initial pin
                  if (controller.pinController.text.length == 4) {
                    // Navigate to the verification pin page
                    print(isChangePin);
                    Get.to(
                          () => TellybucksVerificationPinPage(isChangePin: isChangePin,),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 300),
                    );
                  } else {
                    // Show an error message
                    Get.snackbar('Error', 'Please enter a 4-digit pin',
                        backgroundColor: AppColor.red,
                        colorText: AppColor.white);
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