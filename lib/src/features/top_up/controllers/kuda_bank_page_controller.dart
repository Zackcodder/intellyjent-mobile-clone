import '../../../core/core.dart';

class KudaBankPageController extends GetxController {
  final RxString selectBankController = 'Kuda Bank'.obs;
  final RxString accountNumberController = ''.obs;
  final RxString payIDController = ''.obs;
  final Uri kudaHelpLink = Uri.parse('https://help.kuda.com/support/solutions/articles/73000560693-pay-online-directly-from-your-kuda-account-pay-with-bank-');

  final RxString refCode = ''.obs;

  Future<void> openUrl() async {
    if (!await launchUrl(kudaHelpLink)) {
      throw Exception('Could not launch $kudaHelpLink');
    }
  }
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



}