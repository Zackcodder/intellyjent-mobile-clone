
import '../../../core/core.dart';

class USSDCodePage extends StatelessWidget {
  const USSDCodePage({super.key, required this.bank, required this.sillver, required this.amount});

  final Bank bank;
  final int sillver;
  final int amount;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(USSDPageController());

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Pay With USSD'),
        toolbarHeight: screenHeight < 670 ? 60 : 90,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
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
            child: Text('Dial the code to complete this transaction with ${bank.name}”s ${bank.code}',
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
          screenHeight < 670 ? AppSizing.h06 :AppSizing.h48,
          SizedBox(
            width: screenWidth,
            child: Center(
              child: Text(
                '*#', style: AppTextStyle.h4(context),
              ),
            ),
          ),
          screenHeight < 670 ? AppSizing.h06 : AppSizing.h32,
          //bank name, account, amount
          Container(
            padding: const EdgeInsets.all(25),
            width: screenWidth,
            alignment: Alignment.center,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.whiteOff : AppColor.darkContainer.withOpacity(0.5)
            ),
            child: AsyncBuilder<USSDPaymentResponse?>(
              future: ctl.sendChargeRequest(amount, bank.code),
              waiting: (context) => Center(child: LoadingAnimationWidget.threeArchedCircle(color: AppColor.appColor,
                  size: screenWidth < 800 ? 30 : 90
              )),
              builder: (context, value) => SizedBox(
                width: screenWidth,
                  child: Text(value!.ussd.ussd_code, textAlign: TextAlign.center,
              style:  AppTextStyle.h4(context).copyWith(fontWeight: FontWeight.bold),)),
              error: (context, error, stackTrace) => Text('$error'),
            ),
          ),
          AppSizing.h20,
          ButtonWidget(
              buttonText: 'I\'ve completed the payment',
              fontWeight: FontWeight.w400,
              backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
              onPressed: () {
                Get.dialog(
                    Dialog(
                        backgroundColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        clipBehavior: Clip.none,
                        insetPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                        child: AsyncBuilder<bool?>(
                          stream: ctl.getUserDataStream(),
                          waiting: (context) {
                            return const PopScope(
                                canPop: false,
                                child: LoadDialog(
                                  msg:
                                  'Confirming Transaction\nPlease wait...',
                                ));
                          },
                          builder: (context, value) {
                            if (value == false && ctl.counter == 5) {
                              return AppDialog(
                                msg: 'Transaction Failed',
                                msgColor: AppColor.red,
                                isSubText: true,
                                subText:
                                'Your transaction was not received',
                                buttonText: 'Continue',
                                onTap: () {
                                  Get.back();
                                },
                                isCancelButton: false,
                              );
                            }
                            if (value == false) {
                              return const PopScope(
                                  canPop: false,
                                  child: LoadDialog(
                                    msg:
                                    'Confirming Transaction\nPlease wait...',
                                  ));
                            } else {
                              return PopScope(
                                canPop: false,
                                child: Dialog(
                                    backgroundColor: Colors.transparent,
                                    surfaceTintColor:
                                    Colors.transparent,
                                    clipBehavior: Clip.none,
                                    insetPadding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: PopScope(
                                        canPop: false,
                                        child: AppDialog(
                                          msg: 'Successful!',
                                          msgColor: AppColor.appColor,
                                          isSubText: true,
                                          subText:
                                          'you just paid\n ₦$amount for $sillver sillver',
                                          buttonText: 'Continue',
                                          onTap: () {
                                            Get.offAll(() => const Root());
                                          },
                                          isCancelButton: false,
                                        )
                                    )),
                              );
                            }
                          },
                          error: (context, error, stackTrace) {
                            return AlertDialog(
                              title: const Text('Transaction Failed'),
                              content: const Text(
                                  'The transaction could not be completed.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back(); // Dismiss the dialog
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                          keepAlive: false,
                          closed: (context, value) =>
                              Text('$value (closed)'),
                        )),
                    barrierDismissible: true);
              },
              fontSize: 17),
        ],
      ),
                ),
              ),
      bottomNavigationBar: Padding(padding: MediaQuery.of(context).size.width <800
          ? const EdgeInsets.symmetric(horizontal: 20)
          : const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonWidget(
                buttonText: 'Cancel Payment',
                fontSize: 17,
                padding: EdgeInsets.zero,
                backgroundColor: Get.theme.brightness == Brightness.dark
                    ? MaterialStatePropertyAll(AppColor.whiteOff2.withOpacity(0.05))
                    : const MaterialStatePropertyAll(AppColor.whiteOff2),
                borderSideColor: Colors.transparent,
                textColor: Get.theme.brightness == Brightness.dark
                    ? AppColor.whiteOff2.withOpacity(0.6) : AppColor.appBlack,
                onPressed:() {
                  Get.offAll(()=> const Root(initialIndex: 2,));
                }
            ),
            ButtonWidget(
                buttonText: 'Change Payment Method',
                fontSize: 17,
                padding: EdgeInsets.zero,
                borderSideColor: Colors.transparent,
                backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                textColor: Get.theme.brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.6)
                    : Colors.black,
                onPressed: () {
                  Get.back();
                }),
          ],
        ),),
    );
  }
}
