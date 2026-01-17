
import 'package:intellyjent/src/features/top_up/pages/kuda_bank_page.dart';

import '../../../core/core.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key, required this.sillver, required this.amount, required this.selectedBank});

  final int sillver;
  final int amount;
  final Bank selectedBank;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(PaymentMethodPageController());
    print(selectedBank.supportsTransfer);

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Payment Method'),
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: MediaQuery.of(context).size.width <800
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///payment option guardlines
              SizedBox(
                width: screenWidth,
                child: Text('Use any of the payment methods below to get $sillver sillver for ₦$amount',
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
              AppSizing.h40,
              ///pay with card button
              // PaymentOptionsButtonWidget(
              //     text: 'Pay With Card',
              //     icon: Assets.assetsCard,
              //     index: 0,
              //   padding: screenWidth < 800
              //       ?  const EdgeInsets.only(top: 9.0, left: 0.0) :
              //         const EdgeInsets.only(top: 9.0, left: 15.0),
              // ),
              if(selectedBank.supportsTransfer) AppSizing.h12,
              ///pay with transfer button
             if(selectedBank.supportsTransfer == true) PaymentOptionsButtonWidget(
                  text: 'Pay With Transfer',
                  icon: Assets.assetsBankTransfer,
                  index: 1,
               padding: screenWidth < 800 ? const EdgeInsets.only(top: 5.0)
                   : const EdgeInsets.only(top: 5.0, left: 17.0),
              ),
              // if(selectedBank.payWithBank) AppSizing.h12,
              // if(selectedBank.payWithBank) PaymentOptionsButtonWidget(
              //   text: 'Pay With Bank',
              //   icon: Assets.assetsBank,
              //   index: 2,
              // ),
              if(['058'].contains(selectedBank.code)) AppSizing.h12,
              ///pay with ussd button
              if(['058'].contains(selectedBank.code)) PaymentOptionsButtonWidget(
                text: 'Pay With USSD',
                icon: Assets.assetsBankUSSD,
                index: 3,
                padding: screenWidth < 800 ? const EdgeInsets.only(top: 5.0)
                    : const EdgeInsets.only(top: 5.0, left: 17.0),
              ),
            ],
          ),
        ),
      ),
      ///process button
      bottomNavigationBar: Obx(
            ()=> Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: MediaQuery.of(context).size.width <800
                    ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
                    : const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: ButtonWidget(
                buttonText: ctl.isNoneSelected.value ? 'Cancel Payment' : 'Proceed',
                fontSize: 18,
                backgroundColor: MaterialStatePropertyAll(
                    ctl.isNoneSelected.value 
                        ? Get.theme.brightness == Brightness.dark
                          ? AppColor.whiteOff2.withOpacity(0.05)
                          : AppColor.whiteOff2 
                        : AppColor.appColor),
                borderSideColor: Colors.transparent,
                textColor: ctl.isNoneSelected.value
                    ? Get.theme.brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.6)
                    : Colors.black : AppColor.white,
                onPressed:() {
                  if(ctl.isNoneSelected.value){
                    Get.back();
                  }
                  final cardCtl = Get.put(TopUpPageController());
                  switch (ctl.optionIndex.value) {
                    case 0:
                      cardCtl.makePayment(context, amount.toInt());
                    case 1:
                      Get.to(()=> TransferPage(sillver: sillver, amount: amount), transition: Transition.upToDown);
                    case 2:
                      Get.to(()=> KudaBankPage(sillver: sillver, amount: amount), transition: Transition.upToDown);
                    case 3:
                      Get.to(()=> USSDCodePage(bank: selectedBank, sillver: sillver, amount: amount), transition: Transition.upToDown);
                    case 4:
                      return '';
                    default:
                      return BottomIconType.quiz;
                  }
              
                }
                        ),
              ),
            ),
      ),
    );
  }
}
