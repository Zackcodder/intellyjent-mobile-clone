
import 'package:intellyjent/src/features/top_up/widgets/select_ussd_dialog_widget.dart';

import '../../../core/core.dart';

class USSDPage extends StatelessWidget {
  const USSDPage({super.key, required this.sillver, required this.amount});

  final double sillver;
  final double amount;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(USSDPageController());

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Pay With USSD'),
        toolbarHeight: screenHeight < 670 ? 70 : 90,
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
                  child: Text('Choose your bank to start the payment for  ₦${amount.toInt()} to get ${sillver.toInt()}sillver',
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
                screenHeight < 670 ? AppSizing.h04 : AppSizing.h28,
                SizedBox(
                  width: screenWidth,
                  child: Center(
                    child: Text(
                      '*#', style: AppTextStyle.h4(context),
                    ),
                  ),
                ),
                screenHeight < 670 ? AppSizing.h06 : AppSizing.h12,
                CustomInputFieldBank(
                  controller: ctl
                      .selectBankController.value,
                  readOnly: true,
                  onTap: () async {
                    Get.dialog(
                        Dialog(
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
                            clipBehavior: Clip.none,
                            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                            child: PopScope(canPop: true,
                                child: SelectUSSDialog(onTap: (){}, ctl: ctl,)
                            )),
                        barrierDismissible: true);
                  },
                  suffixIcon: ctl.selectBankController.isNotEmpty
                      ?  Container(
                    color: AppColor.lighterBlue,
                      alignment: Alignment.center,
                      height: 10,
                      child: Text('*${ctl.banks[ctl.optionIndex.value].code}#',
                      style: AppTextStyle.bodyMedium(context).copyWith(
                        fontWeight: FontWeight.bold
                      ),)) : const SizedBox(),
                  hintText:
                  "Select Bank", fieldName: '',
                  validator: (v){
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).size.width <800
            ? const EdgeInsets.symmetric(horizontal: 20)
            : const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                    // Get.to(()=> USSDCodePage(
                    //   bank: ctl.banks[ctl.optionIndex.value].name,
                    //   code: ctl.banks[ctl.optionIndex.value].code,
                    //
                    // ));
                  }
              ),
            ),
            ButtonWidget(
                buttonText: 'Change Payment Method',
                fontSize: 17,
                borderSideColor: Colors.transparent,
                textColor: Colors.black,
                onPressed:() {
                  Get.back();
                }
            ),
          ],
        ),
      ),
    );
  }
}
