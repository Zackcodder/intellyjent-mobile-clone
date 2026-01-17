import '../../../core/core.dart';

class TopUpCurrencySelect extends StatelessWidget {
  const TopUpCurrencySelect({
    super.key, required this.countryCode, required this.currencySymbol, this.isInactive = false,
  });

  final String countryCode;
  final String currencySymbol;
  final bool? isInactive;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopUpPageController());
    double screenWidth = MediaQuery.of(context).size.width;

    String removeLastLetter(String text) {
      if (text.length > 1) {
        return text.substring(0, text.length - 1);
      } else {
        return '';
      }
    }

    return GestureDetector(
      onTap: ()=> controller.setSelectedCurrency(countryCode),
      child: Obx(
        ()=> Container(
          width: screenWidth < 800 ? 78 : 150,
          height: screenWidth < 800 ? 50 : 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: controller.isCurrencySelected(countryCode)
                      ? AppColor.appColor
                      : AppColor.grey,
                  width: controller.isCurrencySelected(countryCode) ? 3 : 2
              ),
              color: isInactive == true ? Theme.of(context).brightness == Brightness.dark
                  ? AppColor.appBlack : AppColor.grey : Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(CountryFlagBuilder.countryCodeToEmoji(removeLastLetter(countryCode))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('($currencySymbol)', style: TextStyle(fontSize: 12,
                    color: isInactive == true ? Theme.of(context).brightness == Brightness.light ? AppColor.appBlack.withOpacity(0.6) : AppColor.white.withOpacity(0.6) :
                  Theme.of(context).brightness == Brightness.dark
                  ? controller.isCurrencySelected(countryCode) ? AppColor.white : AppColor.grey400
                      : controller.isCurrencySelected(countryCode) ? AppColor.appBlack : AppColor.grey400,
                  ),),
                  Text(countryCode, style: AppTextStyle.bodyVerySmall(context).copyWith(
                    color: isInactive == true ?  Theme.of(context).brightness == Brightness.light ? AppColor.appBlack.withOpacity(0.6) : AppColor.white.withOpacity(0.6) : Theme.of(context).brightness == Brightness.dark
                        ? controller.isCurrencySelected(countryCode) ? AppColor.white : AppColor.grey400
                        : controller.isCurrencySelected(countryCode) ? AppColor.appBlack : AppColor.grey400,
                  ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}