import '../../../core/core.dart';
import 'package:intl/intl.dart';

class TopUpPageController extends GetxController {
  final RxString selectedCurrency = 'NGN'.obs;
  final RxString selectedOption = 'Basic'.obs;
  final RxString ngnSymbol = '₦'.obs;
  final RxString usdSymbol = '\$'.obs;
  final RxString gbpSymbol = '£'.obs;
  final RxString eurSymbol = '€'.obs;
  final RxString refCode = ''.obs;
  final RxString selectedSymbol = '₦'.obs;
  final RxDouble customSillverQty = 0.0.obs;
  final RxDouble selectedSillverQty = 0.0.obs;
  final RxDouble selectedAmount = 0.0.obs;
  final RxDouble selectedCustomAmount = 0.0.obs;
  final RxDouble sillverQty = 0.0.obs;
  final RxDouble buttonAmount = 0.0.obs;
  late final TextEditingController sillverQtyController;

  // Constructor
  TopUpPageController() {
    sillverQtyController = TextEditingController(
      text: getInitialValueForCurrency(selectedCurrency.value),
    );
  }

  String getInitialValueForCurrency(String currencyCode) {
    switch (currencyCode) {
      case 'NGN':
        calculateCustomAmountSillverQty(medium1500NGN);
        return medium1500NGN.toString();
      case 'USD':
        calculateCustomAmountSillverQty(medium20USA);
        return medium20USA.toString();
      case 'GBP':
        calculateCustomAmountSillverQty(medium22GBP);
        return medium22GBP.toString();
      case 'EUR':
        calculateCustomAmountSillverQty(medium21EUR);
        return medium21EUR.toString();
      default:
        return '';
    }
  }

  final List<RxBool> isPriceButtonSelectedList =
      List.generate(5, (index) => false.obs);

  double medium1500NGN = 16;
  double medium20USA = 101;
  double medium22GBP = 155;
  double medium21EUR = 85;

  void togglePriceButtonSelection(int selectedIndex) {
    for (int i = 0; i < isPriceButtonSelectedList.length; i++) {
      if (i == selectedIndex) {
        isPriceButtonSelectedList[i].toggle();
      } else {
        isPriceButtonSelectedList[i].value = false;
      }
    }
  }

  void setSelectedCurrency(String currencyCode) {
    if (currencyCode == 'NGN') {
      selectedCurrency.value = currencyCode;
      updateSelectedSymbol();
      if (selectedOption == 'Custom'.obs) {
        double sillverQty = double.tryParse(sillverQtyController.text) ?? 0;
        calculateAmountSillverQty(sillverQty);
      }
    }
  }

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

  void setButtonAmount(double amount) {
    buttonAmount.value = amount;
  }

  bool isCurrencySelected(String currencyCode) {
    return selectedCurrency.value == currencyCode;
  }

  bool isOptionSelected(String option) {
    return selectedOption.value == option;
  }

  void updateSelectedSymbol() {
    switch (selectedCurrency.value) {
      case 'NGN':
        selectedSymbol.value = ngnSymbol.value;
        break;
      case 'USD':
        selectedSymbol.value = usdSymbol.value;
        break;
      case 'GBP':
        selectedSymbol.value = gbpSymbol.value;
        break;
      case 'EUR':
        selectedSymbol.value = eurSymbol.value;
        break;
      default:
        selectedSymbol.value = '';
    }
  }

  void calculateAmountSillverQty(double sillverQty) {
    double amount;
    selectedSillverQty.value = sillverQty;

    switch (selectedCurrency.value) {
      case 'NGN':
        amount = sillverQty * 100;
        if (sillverQty < 16) {
          customSillverQty.value = 16;
          sillverQtyController.text = 16.toString();
          amount = 16 * 100;
        } else {
          customSillverQty.value = sillverQty.roundToDouble();
        }
        break;
      case 'USD':
        amount = sillverQty / 5;
        // Set the minimum allowable amount to 101 Sillver for USD
        if (sillverQty < 101) {
          customSillverQty.value = 101;
          sillverQtyController.text = 101.toString();
          amount = 101 / 5;
        } else {
          customSillverQty.value = sillverQty.roundToDouble();
        }
        break;
      case 'GBP':
        amount = sillverQty / 7;
        // Set the minimum allowable amount to 155 Sillver for GBP
        if (sillverQty < 155) {
          customSillverQty.value = 155;
          sillverQtyController.text = 155.toString();
          amount = 155 / 7;
        } else {
          customSillverQty.value = sillverQty.roundToDouble();
        }
        break;
      case 'EUR':
        amount = sillverQty / 4;
        // Set the minimum allowable amount to 85 Sillver for EUR
        if (sillverQty < 85) {
          customSillverQty.value = 85;
          sillverQtyController.text = 85.toString();
          amount = 85 / 4;
        } else {
          customSillverQty.value = sillverQty.roundToDouble();
        }
        break;
      default:
        amount = 0;
    }

    selectedAmount.value = amount;
    buttonAmount.value = amount;
  }

  void calculateCustomAmountSillverQty(double sillverQty) {
    double amount;
    selectedSillverQty.value = sillverQty;

    switch (selectedCurrency.value) {
      case 'NGN':
        amount = sillverQty * 100;
        if (sillverQty < 16) {
          customSillverQty.value = 16;
          sillverQtyController.text = 16.toString();
          amount = 16 * 100;
          customSillverQty.value = sillverQty.roundToDouble();
        } else {
          customSillverQty.value = sillverQty.roundToDouble();
        }
        break;
      // case 'USD':
      //   amount = sillverQty / 5;
      //   // Set the minimum allowable amount to 101 Sillver for USD
      //   if (sillverQty < 101) {
      //     customSillverQty.value = 101;
      //     sillverQtyController.text = 101.toString();
      //     amount = 101 / 5;
      //   } else {
      //     customSillverQty.value = sillverQty.roundToDouble();
      //   }
      //   break;
      // case 'GBP':
      //   amount = sillverQty / 7;
      //   // Set the minimum allowable amount to 155 Sillver for GBP
      //   if (sillverQty < 155) {
      //     customSillverQty.value = 155;
      //     sillverQtyController.text = 155.toString();
      //     amount = 155 / 7;
      //   } else {
      //     customSillverQty.value = sillverQty.roundToDouble();
      //   }
      //   break;
      // case 'EUR':
      //   amount = sillverQty / 4;
      //   // Set the minimum allowable amount to 85 Sillver for EUR
      //   if (sillverQty < 85) {
      //     customSillverQty.value = 85;
      //     sillverQtyController.text = 85.toString();
      //     amount = 85 / 4;
      //   } else {
      //     customSillverQty.value = sillverQty.roundToDouble();
      //   }
      //   break;
      default:
        amount = 0;
    }

    selectedCustomAmount.value = amount;
    buttonAmount.value = amount;
  }

  String formatAmount(double amount, String currencyCode) {
    final formatter = NumberFormat.simpleCurrency(locale: 'en_$currencyCode');
    final formattedAmount = formatter.format(amount);

    // Extracting the figure part without the currency symbol
    return formattedAmount.substring(1);
  }

  void setSelectedAmount(double amount, int sillverAmount) {
    selectedAmount.value = amount;
    sillverQty.value = sillverAmount.toDouble();
    formatAmount(amount, selectedCurrency.value);
  }

  ////////////////////////////PAYMENT SECTION/////////////////
  // final plugin = PaystackPlugin();
  String message = '';

  Future<void> makePayment(BuildContext context, int price) async {

    await createPurchaseUnit(price.toInt());

    // if (refCode.value != '') {
    //   Charge charge = Charge()
    //     ..amount = price * 100
    //     ..reference = refCode.value
    //     ..email = UserData.email
    //     ..currency = selectedCurrency.value;
    //
    //   CheckoutResponse response = await plugin.checkout(context,
    //       method: CheckoutMethod.card,
    //       charge: charge);
    //
    //   if (response.status == true) {
    //     Get.dialog(
    //         const Dialog(
    //             backgroundColor: Colors.transparent,
    //             surfaceTintColor: Colors.transparent,
    //             clipBehavior: Clip.none,
    //             insetPadding: EdgeInsets.symmetric(horizontal: 20),
    //             child: PopScope(
    //                 canPop: false,
    //                 child: LoadDialog(
    //                   msg: 'Please wait while your Sillver is being updated...',
    //                 ))),
    //         barrierDismissible: false);
    //
    //     await Future.delayed(const Duration(seconds: 10));
    //     message = 'Payment was successful, Ref: ${response.reference}';
    //     print(message);
    //     Get.dialog(
    //         Dialog(
    //             backgroundColor: Colors.transparent,
    //             surfaceTintColor: Colors.transparent,
    //             clipBehavior: Clip.none,
    //             insetPadding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: PopScope(
    //                 canPop: false,
    //                 child: AppDialog(
    //                   msg:
    //                       'Payment was successful!, Ref: ${response.reference}',
    //                   buttonText: 'Continue',
    //                   onTap: () {
    //                     Get.offAll(() => const Root());
    //                   },
    //                   isCancelButton: false,
    //                 ))),
    //         barrierDismissible: true);
    //   } else {
    //     print(response.message);
    //   }
    // } else {
    //   print('fail');
    //   return;
    // }
  }


  //creating ref code for payment with card
  Future<void> createPurchaseUnit(int price) async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      await HttpHelper.instance.postRequest("bookchamp/purchase-units/", body: {
        "charge_type": "CUSTOM",
        "amount": price.toString(),
        "currency": "NGN"
      }).then((value) {
        if (value.status) {
          Map<String, dynamic> data = (value as SuccessResponse).result;
          print(data);
          print('ref code ${data["reference_code"]}');
          String ref = data["reference_code"];
          refCode.value = ref;
          return;
        }

        ErrorResponse errors = (value as ErrorResponse);
        print(errors);
        return;
      });
    } else {
      Fluttertoast.showToast(
          msg: 'No Internet Connection',
          backgroundColor: AppColor.appColor,
          textColor: AppColor.white);
    }
  }

  @override
  void onInit() {
    initializeController();
    super.onInit();
  }

  Future<void> initializeController() async {
    // plugin.initialize(publicKey: ApiKeys.livePublicKey);
  }

  //////////////////////////////////////////////////////////////

  @override
  void onClose() {
    sillverQtyController.dispose();
    super.onClose();
  }
}
