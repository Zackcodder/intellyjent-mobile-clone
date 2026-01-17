import '../../../core/core.dart';

class PaymentMethodPageController extends GetxController {

  final List<RxBool> isPaymentOptionSelectedList =
  List.generate(5, (index) => false.obs);
  RxInt optionIndex = 0.obs;

  void togglePriceButtonSelection(int selectedIndex) {
    for (int i = 0; i < isPaymentOptionSelectedList.length; i++) {
      if (i == selectedIndex) {
        isPaymentOptionSelectedList[i].toggle();
        optionIndex.value = i;
      } else {
        isPaymentOptionSelectedList[i].value = false;
      }
    }
  }

  RxBool get isNoneSelected {
    for (var isSelected in isPaymentOptionSelectedList) {
      if (isSelected.value) {
        return false.obs;
      }
    }
    return true.obs;
  }

}