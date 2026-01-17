import '../../../core/core.dart';

class USSDPageController extends GetxController {
  final RxString selectBankController = ''.obs;
  List<Bank> banks = [];
  late List<RxBool> isBankOptionSelectedList = [];
  bool transactionSuccessful = false;
  int counter = 0;
  Rx<User?> userData = Rx<User?>(null);

  RxInt optionIndex = 0.obs;

  @override
  void onInit() {
    // initializeController();
    super.onInit();
  }

  // var anotherDummyData = {
  //   "charge_type": "CUSTOM",
  //   "amount": "200.00",
  //   "currency": "NGN",
  //   "payment_channel": "ussd",
  //   "bank": null,
  //   "transfer": null,
  //   "ussd": {
  //     "status": "pay_offline",
  //     "display_text": "Please dial *737*33*4*601259# on your mobile phone to complete the transaction",
  //     "reference": "IJ2024041316CU7XR",
  //     "ussd_code": "*737*33*4*601259#"
  //   },
  //   "reference_code": "IJ2024041316CU7XR"
  // };
  //
  //
  // Future<USSDPaymentResponse?> sendChargeRequest(int price, String bankCode) async {
  //   return USSDPaymentResponse.fromJson(anotherDummyData);
  // }

  /////////////charge
  Future<USSDPaymentResponse?> sendChargeRequest(int price, String bankCode) async {
      final isConnected = await InternetConnectionChecker().hasConnection;

      if (!isConnected) {
        Fluttertoast.showToast(
            msg: 'No Internet Connection',
            backgroundColor: AppColor.appColor,
            textColor: AppColor.white);
        throw Exception('No Internet Connection');
      }
      final response = await HttpHelper.instance.postRequest(
        "bookchamp/purchase-units/",
        body: {
          "charge_type": "CUSTOM",
          "amount": price.toString(),
          "currency": "NGN",
          "payment_channel": "ussd",
          "ussd": {
            "bank_code": bankCode
          }
        },
      );

      if (response.status) {
        Map<String, dynamic> data = (response as SuccessResponse).result;
        print(data);
        return USSDPaymentResponse.fromJson(data);
      } else {
        ErrorResponse errors = (response as ErrorResponse);
        print(errors);
        throw Exception('Failed to fetch data');
      }
  }

  void togglePriceButtonSelection(int selectedIndex) {
    for (int i = 0; i < isBankOptionSelectedList.length; i++) {
      if (i == selectedIndex) {
        isBankOptionSelectedList[i].toggle();
        if(isBankOptionSelectedList[i].value == false){
          selectBankController.value = '';
        }
        else{
          optionIndex.value = i;
          selectBankController.value = banks[optionIndex.value].name;
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

  Stream<bool> getUserDataStream() async* {
    try {

      while (counter < 5 && !transactionSuccessful) {
        final response = await HttpHelper.instance.getDynamicRequest("accounts", UserData.userId!);
        if (response["status"] == "success") {
          final userDataR = User.fromJson(response["data"]);
          final cont = Get.put(ProfilePageController());
          userData(userDataR);

          int updatedSilver = userData.value!.points;
          // int updatedSilver = 88;
          print(updatedSilver);
          int? userPoints = cont.userData.value!.points;
          print(userPoints);

          if (updatedSilver > userPoints) {
            transactionSuccessful = true;
            yield transactionSuccessful;
          } else {
            yield false;
          }
        } else {
          yield false;
        }

        counter++;
        await Future.delayed(const Duration(seconds: 5));
      }
    } catch (e) {
      print('Error: in user data catch $e');
      yield false;
    }
  }
}