import '../../../core/core.dart';

class TopUpPage extends StatefulWidget {
  final bool? showBackButton;
  const TopUpPage({super.key, this.showBackButton = false});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {

  final ctl = Get.put(TopUpPageController());

  @override
  void dispose() {
    ctl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    double basic500NGN = 500;
    // double basic100NGN = 100;
    // double basic200NGN = 200;
    double medium500NGN = 500;
    double medium1000NGN = 1000;
    double medium1500NGN = 1500;
    double basic3USA = 3;
    double basic7USA = 7;
    double medium10USA = 10;
    double medium15USA = 15;
    double medium20USA = 20;
    double basic4GBP = 4;
    double basic8GBP = 8;
    double medium12GBP = 12;
    double medium18GBP = 18;
    double medium22GBP = 22;
    double basic2EUR = 2;
    double basic6EUR = 6;
    double medium9EUR = 9;
    double medium16EUR = 16;
    double medium21EUR = 21;

    Widget buildTopUpSection() {
      if (ctl.isOptionSelected('Basic')) {
        return Column(
          children: [
            PriceTopUpButton(
              amount: ctl.selectedCurrency.value == 'NGN'
                  ? basic500NGN
                  : ctl.selectedCurrency.value == 'USD'
                      ? basic3USA
                      : ctl.selectedCurrency.value == 'GBP'
                          ? basic4GBP
                          : basic2EUR,
              key: UniqueKey(),
              sillverAmount: ctl.selectedCurrency.value == 'NGN'
                  ? 5
                  : ctl.selectedCurrency.value == 'USD'
                      ? 15
                      : ctl.selectedCurrency.value == 'GBP'
                          ? 28
                          : 8,
              index: 0,
              onPriceSelected: ctl.setSelectedAmount,
            ),
            AppSizing.h16,
            ///200 naira option
            // PriceTopUpButton(
            //   amount: ctl.selectedCurrency.value == 'NGN'
            //       ? basic200NGN
            //       : ctl.selectedCurrency.value == 'USD'
            //           ? basic7USA
            //           : ctl.selectedCurrency.value == 'GBP'
            //               ? basic8GBP
            //               : basic6EUR,
            //   sillverAmount: ctl.selectedCurrency.value == 'NGN'
            //       ? 2
            //       : ctl.selectedCurrency.value == 'USD'
            //           ? 35
            //           : ctl.selectedCurrency.value == 'GBP'
            //               ? 56
            //               : 24,
            //   key: UniqueKey(),
            //   index: 1,
            //   onPriceSelected: ctl.setSelectedAmount,
            // ),
          ],
        );
      } else if (ctl.isOptionSelected('Medium')) {
        return Column(
          children: [
            ///500 naira
            // PriceTopUpButton(
            //   amount: ctl.selectedCurrency.value == 'NGN'
            //       ? medium500NGN
            //       : ctl.selectedCurrency.value == 'USD'
            //           ? medium10USA
            //           : ctl.selectedCurrency.value == 'GBP'
            //               ? medium12GBP
            //               : medium9EUR,
            //   sillverAmount: ctl.selectedCurrency.value == 'NGN'
            //       ? 5
            //       : ctl.selectedCurrency.value == 'USD'
            //           ? 50
            //           : ctl.selectedCurrency.value == 'GBP'
            //               ? 84
            //               : 36,
            //   key: UniqueKey(),
            //   onPriceSelected: ctl.setSelectedAmount,
            //   index: 2,
            // ),
            // AppSizing.h16,
            ///1,000 naira
            PriceTopUpButton(
              amount: ctl.selectedCurrency.value == 'NGN'
                  ? medium1000NGN
                  : ctl.selectedCurrency.value == 'USD'
                      ? medium15USA
                      : ctl.selectedCurrency.value == 'GBP'
                          ? medium18GBP
                          : medium16EUR,
              sillverAmount: ctl.selectedCurrency.value == 'NGN'
                  ? 10
                  : ctl.selectedCurrency.value == 'USD'
                      ? 75
                      : ctl.selectedCurrency.value == 'GBP'
                          ? 126
                          : 64,
              key: UniqueKey(),
              index: 3,
              onPriceSelected: ctl.setSelectedAmount,
            ),
            AppSizing.h16,
            ///1,500 naira
            PriceTopUpButton(
              amount: ctl.selectedCurrency.value == 'NGN'
                  ? medium1500NGN
                  : ctl.selectedCurrency.value == 'USD'
                      ? medium20USA
                      : ctl.selectedCurrency.value == 'GBP'
                          ? medium22GBP
                          : medium21EUR,
              sillverAmount: ctl.selectedCurrency.value == 'NGN'
                  ? 15
                  : ctl.selectedCurrency.value == 'USD'
                      ? 100
                      : ctl.selectedCurrency.value == 'GBP'
                          ? 154
                          : 84,
              key: UniqueKey(),
              index: 4,
              onPriceSelected: ctl.setSelectedAmount,
            ),
          ],
        );
      } else if (ctl.isOptionSelected('Custom')) {
        return TopUpCustomOptionSection(ctl: ctl);
      }
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: HeaderWidget(
          title: 'Top Up',
          showBackButton: widget.showBackButton!,
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight < 670
            ? 30
            : screenWidth > 800
                ? 90
                : null,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: MediaQuery.of(context).size.width < 800
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 40),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                screenHeight < 670 ? AppSizing.h04 : AppSizing.h42,
                // select currency
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Currency',
                      style: AppTextStyle.bodySmallLight(context),
                    ),
                    //countries
                    AppSizing.h12,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopUpCurrencySelect(
                          countryCode: 'NGN',
                          currencySymbol: '₦',
                        ),
                        TopUpCurrencySelect(
                          countryCode: 'USD',
                          currencySymbol: '\$',
                          isInactive: true,
                        ),
                        TopUpCurrencySelect(
                          countryCode: 'GBP',
                          currencySymbol: '£',
                          isInactive: true,
                        ),
                        TopUpCurrencySelect(
                          countryCode: 'EUR',
                          currencySymbol: '€',
                          isInactive: true,
                        ),
                      ],
                    ),
                    screenHeight < 670 ? AppSizing.h12 : AppSizing.h40,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SillverTopUpOptions(
                          title: 'Basic',
                        ),
                        SillverTopUpOptions(
                          title: 'Medium',
                        ),
                        SillverTopUpOptions(
                          title: 'Custom',
                        ),
                      ],
                    ),
                    screenHeight < 670 ? AppSizing.h12 : AppSizing.h32,
                    //price options
                    Obx(() => buildTopUpSection()),
                  ],
                ),
                if (ctl.selectedOption.value == "Basic")
                  screenWidth < 670
                      ? AppSizing.h32
                      : screenWidth < 800
                          ? AppSizing.h95
                          : AppSizing.h170,
                if (ctl.selectedOption.value == "Medium")
                  screenWidth < 670
                      ? AppSizing.h24
                      : screenWidth < 800
                          ? AppSizing.h40
                          : AppSizing.h56,
                if (ctl.selectedOption.value == "Custom")
                  screenWidth < 670
                      ? AppSizing.h28
                      : screenWidth < 800
                          ? AppSizing.h40
                          : AppSizing.h200,
                Row(
                  children: [
                    SvgPicture.asset(Assets.assetsInfoCircle),
                    AppSizing.w16,
                    Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        'Not in Nigeria? Pay in your currency; your bank converts the Naira price to your local currency.',
                        style: AppTextStyle.bodySmallLight(context),
                        softWrap: true,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                screenHeight < 670 ? AppSizing.h04 : AppSizing.h12,
                ///continue button
                Obx(() {
                  return SizedBox(
                    width: screenWidth,
                    child: ButtonWidget(
                      buttonText: ctl.selectedOption == 'Basic'.obs
                          ? 'Continue'
                          : ctl.selectedOption == 'Custom'.obs
                              ? 'Pay ${(ctl.selectedSymbol.value)}'
                                  '${ctl.formatAmount(ctl.selectedCustomAmount.value, ctl.selectedCurrency.value)}'
                              : 'Pay ${ctl.selectedSymbol.value} '
                                  '${ctl.formatAmount(ctl.selectedAmount.value, ctl.selectedCurrency.value)}',
                      fontSize: 18,
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColor.appColor),
                      textColor: AppColor.white,
                      borderSideColor: Colors.transparent,
                      onPressed: () {
                        if (ctl.selectedOption == 'Custom'.obs) {
                          double sillverQty =
                              double.tryParse(ctl.sillverQtyController.text) ??
                                  0;
                          if (sillverQty < 16) {
                            ctl.calculateCustomAmountSillverQty(16);
                          } else {
                            ctl.calculateCustomAmountSillverQty(sillverQty);
                          }
                        }
                        final sillver =
                        ctl.selectedOption != 'Custom'.obs
                            ? ctl.sillverQty.value
                            : ctl.customSillverQty.value;
                        final amount = ctl.selectedOption !=
                            'Custom'.obs
                            ? ctl.selectedAmount.value
                            : ctl.selectedCustomAmount.value;

                          if(amount > 0){
                            Get.dialog(
                                Dialog(
                                    backgroundColor: Colors.transparent,
                                    surfaceTintColor: Colors.transparent,
                                    clipBehavior: Clip.none,
                                    insetPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    child: PopScope(
                                        canPop: true,
                                        child: AppDialog(
                                          msg: ctl.selectedOption != 'Custom'.obs
                                              ? 'You’re about to pay\n'
                                              ' ${(ctl.selectedSymbol.value)}${ctl.formatAmount(ctl.selectedAmount.value, ctl.selectedCurrency.value)} '
                                              'for ${(ctl.sillverQty.value).toInt()} Sillver'
                                              : 'You’re about to pay\n'
                                              ' ${(ctl.selectedSymbol.value)}${ctl.formatAmount(ctl.selectedCustomAmount.value, ctl.selectedCurrency.value)} '
                                              'for ${(ctl.customSillverQty.value).toInt()} Sillver',
                                          buttonText: 'Continue',
                                          onTap: () {
                                            if(amount >= 0){
                                              Get.to(
                                                      () => SelectBankPage(
                                                      sillver: sillver.toInt(),
                                                      amount: amount.toInt()),
                                                  transition: Transition.upToDown);
                                              return;
                                            }

                                          },
                                          isCancelButton: true,
                                        ))),
                                barrierDismissible: true);
                          }


                      },
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
