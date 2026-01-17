import '../../../core/core.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TellybucksDashboardPageController extends GetxController {
  final DateTime now = DateTime.now();
  RxString greeting = ''.obs;
  RxString bankCode = ''.obs;
  RxDouble amount = 0.0.obs;
  RxString formattedAmount = ''.obs;
  RxString withdrawableFormattedAmount = ''.obs;
  RxBool isFirstWithdrawal = true.obs;
  RxBool isLoading = true.obs;
  RxBool hideAccountBalance = true.obs;
  TextEditingController withdrawalAmountController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  List<Bank> banks = [];
  late List<RxBool> isBankOptionSelectedList = [];
  final RxString selectBankController = ''.obs;
  final RxString userBankName = ''.obs;
  Rx<AffiliateInfo?> affiliateInfo = Rx<AffiliateInfo?>(null);

  RxInt optionIndex = 0.obs;
  final scrollController = ScrollController();

  void formatAmount() {
    final formatter = NumberFormat('#,###');
    formattedAmount.value = formatter.format(
      amount.value,
    );

    double withdrawableAmount = amount.value - 176;
    if (withdrawableAmount < 0) {
      withdrawableAmount = 0;
    }

    // Format the withdrawable amount
    withdrawableFormattedAmount.value = formatter.format(withdrawableAmount);
  }

  bool? hasTellybucksPin() {
    bool? pin = affiliateInfo.value!.pinStatus;
    return pin;
  }

  @override
  void onInit() {
    super.onInit();
    initializeController();
    ever(amount, (_) => formatAmount());
  }

  Future<bool> checkTellybucksPin() async {
    bool? pinExists = hasTellybucksPin();
    if (!pinExists!) {
      Get.snackbar('PIN Required', 'Please set up your Tellybucks PIN.',
          backgroundColor: AppColor.orange,
          colorText: AppColor.white);
      Get.to(()=> const TellyBucksNewPinPage(), transition: Transition.upToDown);

      return false;
    }else{
      return true;
    }
  }

  Future<void> initializeController() async {
    banks = await fetchBanks();
    affiliateInfo.value = await geAffiliateInfo(true);
    isBankOptionSelectedList =
        List.generate(banks.length, (index) => false.obs);
  }

  Future<AffiliateInfo> geAffiliateInfo(bool loadWidget) async {
    isLoading.value = loadWidget;
    final isConnected = await InternetConnectionChecker().hasConnection;
    final cont = Get.put(ProfilePageController());
    if (!isConnected) {
      Get.snackbar('Error', 'No internet connection',
          backgroundColor: AppColor.red, colorText: AppColor.white);
      isLoading.value = false;
      throw Exception('No Internet Connection');
    }

    isLoading.value = false;
    try {
      final response = await HttpHelper.instance.getDynamicRequest("affiliate", cont.userData.value!.affiliateInfo);
      // print('Response: ${response["data"]}');

      if (response["status"] == "success") {
        final affiliate = AffiliateInfo.fromJson(response["data"]);

        affiliateInfo.value = affiliate;
        amount.value = affiliate.balance;
        formatAmount();
        final matchedBank = banks.firstWhere(
              (bank) => bank.code == affiliate.bankCode,
          orElse: () => Bank(
            name: 'Unknown Bank',
            code: '0000',
            active: true, // Default value
            country: 'Unknown', // Default value
            createdAt: DateTime.now(), // Default value
            currency: 'N/A', // Default value
            id: 9999999, // Default value
            isDeleted: false, // Default value
            longcode: '0000', // Default value
            payWithBank: false, // Default value
            slug: 'unknown-bank', // Default value
            supportsTransfer: false, // Default value
            type: 'unknown', // Default value
            updatedAt: DateTime.now(), // Default value
          ),
        );

        userBankName.value = matchedBank.name;
              return affiliate;
      } else {
        Get.snackbar('Error', 'Error in affiliate data, ${response["message"]}',
            backgroundColor: AppColor.red, colorText: AppColor.white);
        print('Error in affiliate data: ${response["message"]}');
        return affiliateInfo.value!;
      }
    } catch (e) {
      Get.snackbar('Error', 'Error in affiliate data, $e',
          backgroundColor: AppColor.red, colorText: AppColor.white);
      print('Error: in user data catch $e');
      return affiliateInfo.value!;
    }
  }

  Future saveUpdateBankInfo(TellybucksDashboardPageController cont, Function onSuccess) async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      Get.snackbar('Error', 'No internet connection',
          backgroundColor: AppColor.red, colorText: AppColor.white);
      throw Exception('No Internet Connection');
    }

    await HttpHelper.instance.patchRequest("affiliate/${UserData.affiliateInfo}",
        body: buildBankPayload(), converter: (json) {
          return AffiliateInfo.fromJson(json);
        }).then((value) async {

      if (value.status) {
        final updatedAffiliateInfo = (value as SuccessResponse).result;
        affiliateInfo.value = updatedAffiliateInfo;
        final matchedBank = banks.firstWhere(
              (bank) => bank.code == updatedAffiliateInfo.bankCode,
          orElse: () => Bank(
            name: 'Unknown Bank',
            code: '0000',
            active: true, // Default value
            country: 'Unknown', // Default value
            createdAt: DateTime.now(), // Default value
            currency: 'N/A', // Default value
            id: 999999999, // Default value
            isDeleted: false, // Default value
            longcode: '0000', // Default value
            payWithBank: false, // Default value
            slug: 'unknown-bank', // Default value
            supportsTransfer: false, // Default value
            type: 'unknown', // Default value
            updatedAt: DateTime.now(), // Default value
          ),
        );

        userBankName.value = matchedBank.name;
      
        Get.snackbar('Success', "Bank Detail Updated Successfully",backgroundColor: AppColor.green, colorText: AppColor.white);
        // Call the onSuccess callback
        if (Get.isBottomSheetOpen ?? false) {
          Get.back();
          await Future.delayed(const Duration(milliseconds: 500)); // Adjust delay if necessary
        }

        onSuccess();

        return;
      }
      ErrorResponse errors = (value as ErrorResponse);

      Get.snackbar('Error', 'Error in affiliate data, ${errors.message}',
          backgroundColor: AppColor.red, colorText: AppColor.white);

      // showFeedbackToast(
      //   context,
      //   'Username, email or phone number already exists',
      // );
    });
  }

  Map<String, dynamic> buildBankPayload() {
    Map<String, dynamic> payload = {};
    payload["bank_code"] = bankCode.value.trim();
    payload["account_name"] = accountNameController.text.trim();
    payload["account_number"] = accountNumberController.text.trim();

    return payload;
  }


  void setGreeting() {
    if (now.hour < 12) {
      greeting.value = 'Good morning';
    } else if (now.hour < 17) {
      greeting.value = 'Good afternoon';
    } else {
      greeting.value = 'Good evening';
    }
  }

  void togglePriceButtonSelection(int selectedIndex) {
    for (int i = 0; i < isBankOptionSelectedList.length; i++) {
      if (i == selectedIndex) {
        isBankOptionSelectedList[i].toggle();
        if (isBankOptionSelectedList[i].value == false) {
          selectBankController.value = '';
          bankCode.value = '';
        } else {
          optionIndex.value = i;
          selectBankController.value = banks[optionIndex.value].name;
          bankCode.value = banks[optionIndex.value].code;
          print(bankCode.value);
        }
        // update();
        Get.back();
      } else {
        isBankOptionSelectedList[i].value = false;
      }
    }
  }

  RxBool get isNoneSelected {
    for (var isSelected in isBankOptionSelectedList) {
      if (isSelected.value) {
        return false.obs;
      }
    }
    return true.obs;
  }

  //////////fetch banks api call////////
  Future<List<Bank>> fetchBanks() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      final response =
          await http.get(Uri.parse('https://api.paystack.co/bank'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return data.map((json) => Bank.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load banks');
      }
    } else {
      return [];
    }
  }

  void resetBankControllers() {
    accountNumberController.text = '';
    accountNameController.text = '';
    selectBankController.value = '';
    bankNameController.text = '';
  }
}
