import '../../../core/core.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BankPageController extends GetxController {
  final dobController = TextEditingController().obs;
  final RxString selectBankController = ''.obs;
  final otpController = TextEditingController();
  final dob = Rx<DateTime>(DateTime.now());
  List<Bank> banks = [];
  late List<RxBool> isBankOptionSelectedList = [];

  RxInt optionIndex = 0.obs;
  final scrollController = ScrollController();


  @override
  void onInit() {
    initializeController();
    super.onInit();
  }

  Future<void> initializeController() async {
      banks = await fetchBanks();
      isBankOptionSelectedList = List.generate(
          banks.length, (index) => false.obs);
  }

  updateDob(DateTime? date) {
    if (date == null) return;
    dob(date);
    dobController(
        TextEditingController(text: '${date.day}/${date.month}/${date.year}'));
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

  //////////fetch banks api call////////
  Future<List<Bank>> fetchBanks() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if(isConnected) {
      final response =
      await http.get(Uri.parse('https://api.paystack.co/bank'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return data.map
          ((json) => Bank.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load banks');
      }
    } else{
      return [];
    }
  }
}