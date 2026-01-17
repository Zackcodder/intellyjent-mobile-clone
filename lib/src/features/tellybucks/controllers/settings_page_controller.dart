import '../../../core/core.dart';

class TellybucksSettingsPageController
    extends TellybucksDashboardPageController {
  final pinController = TextEditingController();
  final pinVerController = TextEditingController();
  final oldPinController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pinController.text = '';
    pinVerController.text = '';
    oldPinController.text = '';
  }

  Future setNewPin() async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      Get.snackbar('Error', 'No internet connection',
          backgroundColor: AppColor.red, colorText: AppColor.white);
      throw Exception('No Internet Connection');
    }

    await HttpHelper.instance
        .patchRequest("affiliate/${UserData.affiliateInfo}",
            body: buildNewPinPayload(),
            converter: (json) => AffiliateInfo.fromJson(json))
        .then((value) async {
      if (value is SuccessResponse) {
        final updatedAffiliateInfo = value.result as AffiliateInfo;
        affiliateInfo.value = updatedAffiliateInfo;

        final matchedBank = banks.firstWhere(
          (bank) => bank.code == updatedAffiliateInfo.bankCode,
          orElse: () => Bank(
            name: 'Unknown Bank',
            code: '0000',
            active: true,
            country: 'Unknown',
            createdAt: DateTime.now(),
            currency: 'N/A',
            id: 999999999,
            isDeleted: false,
            longcode: '0000',
            payWithBank: false,
            slug: 'unknown-bank',
            supportsTransfer: false,
            type: 'unknown',
            updatedAt: DateTime.now(),
          ),
        );

        userBankName.value = matchedBank.name;

        Get.snackbar('Success', "Pin Updated Successfully",
            backgroundColor: AppColor.green, colorText: AppColor.white);
      } else if (value is ErrorResponse) {
        // Handling the error response
        Get.snackbar('Error', value.errors.first.errorMessage.first,
            backgroundColor: AppColor.red, colorText: AppColor.white);
      } else {
        // Catching unexpected cases
        Get.snackbar('Error', 'An unexpected error occurred',
            backgroundColor: AppColor.red, colorText: AppColor.white);
      }
    });
  }

  Future changeOldPin() async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      Get.snackbar('Error', 'No internet connection',
          backgroundColor: AppColor.red, colorText: AppColor.white);
      throw Exception('No Internet Connection');
    }

    await HttpHelper.instance
        .patchRequest("affiliate/${UserData.affiliateInfo}",
            body: buildOldPinPayload(),
            converter: (json) => AffiliateInfo.fromJson(json))
        .then((value) async {
      if (value is SuccessResponse) {
        final updatedAffiliateInfo = value.result as AffiliateInfo;
        affiliateInfo.value = updatedAffiliateInfo;

        final matchedBank = banks.firstWhere(
          (bank) => bank.code == updatedAffiliateInfo.bankCode,
          orElse: () => Bank(
            name: 'Unknown Bank',
            code: '0000',
            active: true,
            country: 'Unknown',
            createdAt: DateTime.now(),
            currency: 'N/A',
            id: 999999999,
            isDeleted: false,
            longcode: '0000',
            payWithBank: false,
            slug: 'unknown-bank',
            supportsTransfer: false,
            type: 'unknown',
            updatedAt: DateTime.now(),
          ),
        );

        userBankName.value = matchedBank.name;

        Get.snackbar('Success', "Pin Updated Successfully",
            backgroundColor: AppColor.green, colorText: AppColor.white);
      } else if (value is ErrorResponse) {
        // Handling the error response
        Get.snackbar('Error', value.errors.first.errorMessage.first,
            backgroundColor: AppColor.red, colorText: AppColor.white);
      } else {
        // Catching unexpected cases
        Get.snackbar('Error', 'An unexpected error occurred',
            backgroundColor: AppColor.red, colorText: AppColor.white);
      }
    });
  }

  Future initiateTransfer() async {
    final isConnected = await InternetConnectionChecker().hasConnection;

    if (!isConnected) {
      Get.snackbar('Error', 'No internet connection',
          backgroundColor: AppColor.red, colorText: AppColor.white);
      throw Exception('No Internet Connection');
    }

    await HttpHelper.instance.putRequest("affiliate/initiate-transfer",
        body: buildTransferPayload()).then((value) async {
      if (value.status) {
        Get.snackbar('Success', "Payout request received, pls check your mail for more info",
            backgroundColor: AppColor.green, colorText: AppColor.white);
        Get.back();
        Get.bottomSheet(
          SuccessErrorBottomSheet(
            isSuccess: true,
            transferredAmount: withdrawalAmountController.text,
          ),
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
        );
        return;
      }
      ErrorResponse errors = (value as ErrorResponse);
      print(errors.errors.isEmpty
          ? errors.message
          : errors.errors.first.errorMessage.first);
      String msg = errors.errors.isEmpty
          ? errors.message
          : errors.errors.first.errorMessage.first;

      Get.snackbar('Error', msg,
          backgroundColor: AppColor.red, colorText: AppColor.white);

      await Future.delayed(const Duration(milliseconds: 1000));
      Get.bottomSheet(
        const SuccessErrorBottomSheet(
          isSuccess: false,
        ),
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
      );
    });
  }

  Map<String, dynamic> buildNewPinPayload() {
    Map<String, dynamic> payload = {};
    payload["transfer_pin"] = pinVerController.text.trim();

    return payload;
  }

  Map<String, dynamic> buildOldPinPayload() {
    Map<String, dynamic> payload = {};
    payload["old_transfer_pin"] = oldPinController.text.trim();
    payload["transfer_pin"] = pinVerController.text.trim();

    return payload;
  }

  Map<String, dynamic> buildTransferPayload() {
    Map<String, dynamic> payload = {};
    print(withdrawalAmountController.text.trim());
    payload["amount"] = withdrawalAmountController.text.trim();
    payload["transfer_pin"] = pinVerController.text.trim();
    payload["affiliate"] = UserData.affiliateInfo;

    return payload;
  }
}
