import '../../../core/core.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key, required this.sillver, required this.amount});

  final int sillver;
  final int amount;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final cont = Get.put(TransferPageController(amount));

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Pay With Transfer'),
        toolbarHeight: screenWidth < 800 ? 50 : 100,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: MediaQuery.of(context).size.width < 800
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 40),
          child: AsyncBuilder<TransferPaymentResponse?>(
            future: cont.sendChargeRequest(amount),
            waiting: (context) => SizedBox(
                height: screenHeight,
                child: Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColor.appColor,
                        size: screenWidth < 800 ? 30 : 90))),
            builder: (context, value) {
              String accountName = value!.transfer!.account_name;
              String accountNumber = value.transfer!.account_number;
              String bankName = value.transfer!.bank.name;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: screenWidth,

                    /// transfer amount n sillver title
                    child: Text(
                      'Transfer ₦$amount to get $sillver sillver',
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
                  screenHeight < 670 ? AppSizing.h04 : AppSizing.h28,

                  ///bank payment image
                  SizedBox(
                    width: screenWidth,
                    child: SvgPicture.asset(
                      Get.theme.brightness == Brightness.dark
                          ? Assets.assetsBankTransferGrey
                          : Assets.assetsBankTransferBlack,
                      width: screenWidth < 800 ? 30 : 70,
                    ),
                  ),
                  screenHeight < 670 ? AppSizing.h04 : AppSizing.h12,

                  ///payemtn gateway title
                  SizedBox(
                    width: screenWidth,
                    child: Center(
                      child: Text(
                        bankName.toUpperCase(),
                        style: AppTextStyle.h4(context),
                      ),
                    ),
                  ),
                  screenHeight < 670 ? AppSizing.h04 : AppSizing.h32,
                  //bank name, account, amount
                  Container(
                    padding: screenHeight < 670
                        ? const EdgeInsets.all(14)
                        : const EdgeInsets.all(25),
                    width: screenWidth,
                    height: screenHeight < 670
                        ? screenHeight * 0.32
                        : screenWidth < 800
                            ? screenHeight * 0.3
                            : screenHeight * 0.29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Get.theme.brightness == Brightness.light
                            ? AppColor.whiteOff
                            : AppColor.darkContainer.withOpacity(0.5)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Account Name',
                              style: AppTextStyle.bodySmallLight(context),
                            )
                          ],
                        ),
                        AppSizing.h04,

                        ///acount name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              accountName,
                              style: AppTextStyle.bodyMedium(context)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: accountName));
                                Fluttertoast.showToast(
                                  msg: 'Bank Name Copied!',
                                  textColor: AppColor.white,
                                  backgroundColor: AppColor.appColor,
                                );
                              },
                              child: SvgPicture.asset(
                                Assets.assetsCopy,
                                color: Get.theme.brightness == Brightness.dark
                                    ? AppColor.white
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        screenHeight < 670 ? AppSizing.h06 : AppSizing.h20,

                        ///account number
                        Row(
                          children: [
                            Text(
                              'Account Number',
                              style: AppTextStyle.bodySmallLight(context),
                            )
                          ],
                        ),
                        AppSizing.h04,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              accountNumber,
                              style: AppTextStyle.bodyMedium(context)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: accountNumber));
                                Fluttertoast.showToast(
                                  msg: 'Account number Copied!',
                                  textColor: AppColor.white,
                                  backgroundColor: AppColor.appColor,
                                );
                              },
                              child: SvgPicture.asset(
                                Assets.assetsCopy,
                                color: Get.theme.brightness == Brightness.dark
                                    ? AppColor.white
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        screenHeight < 670 ? AppSizing.h06 : AppSizing.h20,

                        ///amount
                        Row(
                          children: [
                            Text(
                              'Amount',
                              style: AppTextStyle.bodySmallLight(context),
                            )
                          ],
                        ),
                        AppSizing.h04,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              amount.toInt().toString(),
                              style: AppTextStyle.bodyMedium(context)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  screenHeight < 670 ? AppSizing.h04 : AppSizing.h12,

                  ///Use this account for this transaction only text
                  SizedBox(
                    child: Text(
                      'Use this account for this transaction only',
                      style: AppTextStyle.bodySmallLight(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  screenHeight < 670 ? AppSizing.h04 : AppSizing.h12,

                  ///Expiration count down
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Expires in',
                          style: AppTextStyle.bodySmallLight(context),
                          textAlign: TextAlign.center,
                        ),
                        AppSizing.w04,
                        Obx(
                          () => Text(
                            cont.formatDuration(cont.timeToTransferMoney.value),
                            style: AppTextStyle.bodySmallLight(context)
                                .copyWith(
                                    color: cont.timeToTransferMoney.value < 600
                                        ? AppColor.red
                                        : AppColor.appColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  screenHeight < 670 ? AppSizing.h04 : AppSizing.h20,

                  ///i have sent the money button
                  ButtonWidget(
                      buttonText: 'I\'ve sent the money',
                      fontWeight: FontWeight.w400,
                      onPressed: () async {
                        // Fetch the reference number before calling getUserDataStream

                        Get.dialog(
                            Dialog(
                                backgroundColor: Colors.transparent,
                                surfaceTintColor: Colors.transparent,
                                clipBehavior: Clip.none,
                                insetPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: AsyncBuilder<bool?>(
                                  stream: cont.getUserDataStream2(),
                                  waiting: (context) {
                                    return const PopScope(
                                        canPop: false,
                                        child: LoadDialog(
                                          msg:
                                              'Confirming Transaction\nPlease wait...',
                                        ));
                                  },
                                  builder: (context, value) {
                                    // if (value == false && cont.counter == 5)
                                    if (value == false && cont.counter == 5) {
                                      print('value in user button $value');
                                      print(
                                          'value in user button ${cont.transactionSuccessful}');
                                      return PopScope(
                                        canPop: false,
                                        child: AppDialog(
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
                                        ),
                                      );
                                    }
                                    if (cont.transactionSuccessful == false) {
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
                                                      'you just paid\n₦$amount for $sillver sillver',
                                                  buttonText: 'Continue',
                                                  onTap: () {
                                                    Get.offAll(
                                                        () => const Root());
                                                  },
                                                  isCancelButton: false,
                                                ))),
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
                                )),
                            barrierDismissible: false);
                      },
                      textColor: Get.theme.brightness == Brightness.dark
                          ? Colors.white
                          : AppColor.appBlack,
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      fontSize: 17),
                ],
              );
            },
            error: (context, error, stackTrace) =>
                Center(child: Text('Internet Connection Failed $error')),
            keepAlive: false,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).size.width < 800
            ? const EdgeInsets.symmetric(horizontal: 20)
            : const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonWidget(
                buttonText: 'Cancel Payment',
                padding: EdgeInsets.zero,
                fontSize: 17,
                backgroundColor: Get.theme.brightness == Brightness.dark
                    ? MaterialStatePropertyAll(
                        AppColor.whiteOff2.withOpacity(0.05))
                    : const MaterialStatePropertyAll(AppColor.whiteOff2),
                borderSideColor: Colors.transparent,
                textColor: Get.theme.brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.6)
                    : Colors.black,
                onPressed: () {
                  Get.offAll(() => const Root(
                        initialIndex: 2,
                      ));
                }),
            ButtonWidget(
                buttonText: 'Change Payment Method',
                fontSize: 17,
                padding: EdgeInsets.zero,
                borderSideColor: Colors.transparent,
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                textColor: Get.theme.brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.6)
                    : Colors.black,
                onPressed: () {
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}
