import 'dart:convert';

import '../../../core/core.dart';
import 'package:http/http.dart' as https;

class TransferPageController extends GetxController {
  RxInt timeToTransferMoney = 0.obs;
  bool transactionSuccessful = false;
  int counter = 0;
  RxString referenceNumber = ''.obs; // Store reference number
  Timer? _timer;
  final int amount;
  TransferPageController(this.amount);
  Rx<User?> userData = Rx<User?>(null);

  String formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void startCountdownTimer(String expiryTime) {
    DateTime expiryDateTime = DateTime.parse(expiryTime);

    // Convert current time to UTC
    DateTime currentDateTimeUtc = DateTime.now().toUtc();

    Duration difference = expiryDateTime.difference(currentDateTimeUtc);

    // Calculate difference in minutes
    int differenceInMinutes = difference.inMinutes;

    // Convert minutes to seconds
    int differenceInSeconds = differenceInMinutes * 60;

    timeToTransferMoney.value = differenceInSeconds;
    startTimer();
  }

  startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeToTransferMoney.value == 0) {
          _timer?.cancel();

          return;
        }
        timeToTransferMoney.value -= 1;
      },
    );
  }

  Future<TransferPaymentResponse?> sendChargeRequest(int price) async {
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
        "payment_channel": "transfer",
      },
    );

    print(
        'this is the response from the send charge request ${response.message}');

    if (response.status) {
      Map<String, dynamic> data = (response as SuccessResponse).result;

      print('this is the data from the send charge request $data');
      print('Reference Number: ${data['transfer']['reference']}');
      // ✅ Save the reference number
      referenceNumber.value = data['transfer']['reference'];

      print('final Reference Number: ${referenceNumber.value}');

      startCountdownTimer(data['transfer']['account_expires_at']);
      return TransferPaymentResponse.fromJson(data);
    } else {
      ErrorResponse errors = (response as ErrorResponse);

      throw Exception('Failed to fetch data');
    }
  }

  // Stream<bool> getUserDataStream(String referenceNumber) async* {
  //   print('calling get user data stream');
  //   print('calling get user data stream for reference: $referenceNumber');
  //   try {
  //     while (counter < 5 && !transactionSuccessful) {
  //       ///http://localhost.com/api/v1/bookchamp/purchase-units/
  //       final response = await HttpHelper.instance.getDynamicRequest(
  //           "transaction-status/$referenceNumber/", UserData.token!);

  //       print(
  //           'this is the response from the get user payment ${response.message}');
  //       if (response["status"] == "success") {
  //         final userDataR = User.fromJson(response["data"]);
  //         print('this is working now ');
  //         final cont = Get.put(ProfilePageController());
  //         userData(userDataR);

  //         int updatedSilver = userData.value!.points;

  //         int? userPoints = cont.userData.value!.points;

  //         if (updatedSilver > userPoints) {
  //           transactionSuccessful = true;
  //           yield transactionSuccessful;
  //         } else {
  //           yield false;
  //         }
  //       } else {
  //         yield false;
  //       }

  //       counter++;
  //       await Future.delayed(const Duration(seconds: 5));
  //     }
  //   } catch (e) {
  //     print('Error: in user data catch $e');
  //     yield false;
  //   }
  // }
  ///
  Stream<bool> getUserDataStream2() async* {
    const String baseUrl2 = "https://intellyjent.com/transaction-status/";
    final TransferPageController cont = Get.find();

    try {
      String referenceNumber =
          cont.referenceNumber.value; // Use stored reference
      if (referenceNumber.isEmpty) {
        print("No reference number found!");
        yield false;
        return;
      }

      print("Checking status for Reference: $referenceNumber");
      while (counter < 5 && !transactionSuccessful) {
        final response = await https.post(
          Uri.parse("$baseUrl2$referenceNumber/"),
          headers: {
            "Content-Type": "application/json",
          },
        );

        print("Response Status Code: ${response.statusCode}");
        print("Response Body: ${response.body} and $referenceNumber");

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          print('trans satus body $jsonData');

          // Check if status is "success" or "failed"
          if (jsonData["status"] == "success" ||
              jsonData['message'] == 'Payment successful') {
                //  final userDataR = User.fromJson(jsonData["status"]);
            print('this is working now ');
            final cont = Get.put(ProfilePageController());
            // userData(userDataR);

            // int updatedSilver = cont.userData.value!.points;
            // int? updatedSilver = userData.value?.points ?? 0;
            print('step 1');

            // int? userPoints = cont.userData.value!.points;
            print('step 2 ');
            // if (updatedSilver > userPoints) {
            // print('step 3 ');
            //   transactionSuccessful = true;
            //   yield transactionSuccessful;
            // } else {
            //   yield false;
            // }
            print("Transaction Successful ✅");
            
              transactionSuccessful = true;
              yield transactionSuccessful;

            // yield true;
          } else {
            print("Transaction Failed ❌: ${jsonData["message"]}");
            yield false;
          }
        } else {
          print("Unexpected Response: ${response.body}");
          yield false;
        }

        counter++;
        await Future.delayed(const Duration(seconds: 5));
      }
    } catch (e) {
      print("Error fetching transaction data: $e");
      yield false;
    }
  }

  ///
  Stream<bool> getUserDataStream(String referenceNumber) async* {
    print('calling get user data stream');
    print('calling get user data stream for reference: $referenceNumber');
    try {
      while (counter < 5 && !transactionSuccessful) {
        ///https://intellyjent.com/transaction-status/IJ20250329TFX9L46/
        final response = await HttpHelper.instance.postRequest(
          "transaction-status/$referenceNumber/",
          body: {},
        );

        print(
            'this is the response messgae from the get user payment ${response.message.toString()}');
        print(
            'this is the response staus from the get user payment ${response.status}');
        print(
            'this is the response staus from the get user payment $response');
        if (response.status) {
          // final userDataR = User.fromJson(response["data"]);
          // print('this is working now ');
          final cont = Get.put(ProfilePageController());
          // userData(userDataR);

          int updatedSilver = userData.value!.points;

          int? userPoints = cont.userData.value!.points;

          if (updatedSilver > userPoints) {
            transactionSuccessful = true;
            yield transactionSuccessful;
          } else {
            yield false;
          }
        } else {
          yield false;
          print('transac still hving issue');
        }

        counter++;
        await Future.delayed(const Duration(seconds: 5));
      }
    } catch (e) {
      print('Error: in user data catch $e');
      yield false;
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
