
import '../../../core/core.dart';

class KudaBankPage extends StatelessWidget {
  const KudaBankPage({super.key, required this.sillver, required this.amount});

  final int sillver;
  final int amount;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    // final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(KudaBankPageController());

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Pay With Bank'),
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
            ()=> SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: MediaQuery.of(context).size.width <800
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: screenWidth,
                  child: Text('Enter your phone number and Pay ID',
                    style: TextStyle(
                      fontSize: 16,
                      color: Get.theme.brightness == Brightness.dark
                          ? Colors.white
                          : AppColor.appBlack,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: ()=> ctl.openUrl(),
                  child: SizedBox(
                    width: screenWidth,
                    child: const Text('How to pay with Kuda Bank',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.appColor,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                AppSizing.h28,
                SizedBox(
                  width: screenWidth,
                  child: SvgPicture.asset(
                    Assets.assetsBankBlack,
                  ),
                ),
                AppSizing.h12,
                CustomInputFieldBank(
                  controller: ctl
                      .selectBankController.value,
                  readOnly: true,
                  onTap: () {
                  },
                  suffixIcon: SvgPicture.asset(Assets.assetsArrowDown, color: AppColor.appBlack,),
                  hintText:
                  "Select Bank", fieldName: '',
                  validator: (v){
                    return null;
                  },
                ),
                AppSizing.h12,
                CustomInputFieldBank(
                  controller: ctl
                      .accountNumberController.value,
                  onTap: () {
                  },
                  suffixIcon: Text( CountryFlagBuilder.getCountryFlag('Nigeria')),
                  hintText:
                  "9023446060", fieldName: '',
                  validator: (v){
                    return null;
                  },
                ),
                AppSizing.h12,
                CustomInputFieldBank(
                  controller: ctl
                      .payIDController.value,
                  readOnly: true,
                  onTap: () {
                  },
                  hintText:
                  "Enter your pay ID", fieldName: '',
                  validator: (v){
                    return null;
                  },
                ),
                AppSizing.h48,
                Obx(
                      ()=> ButtonWidget(
                      buttonText: ctl.selectBankController.value.isNotEmpty
                          ? 'Proceed' : 'Cancel Payment',
                      fontSize: 17,
                      backgroundColor: ctl.selectBankController.value.isNotEmpty
                          ? const MaterialStatePropertyAll(AppColor.appColor)
                          : const MaterialStatePropertyAll(AppColor.whiteOff2),
                      borderSideColor: Colors.transparent,
                      textColor: ctl.selectBankController.value.isNotEmpty
                          ? AppColor.white : AppColor.appBlack,
                      onPressed:() {
                        if(ctl.selectBankController.value == ''){
                          Get.back();
                          Get.back();
                          return;
                        }
                        Get.to(()=> BankOtpPage(
                          sillver: sillver,
                          amount: amount,
                        ), transition: Transition.upToDown);
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
