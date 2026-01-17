import '../../../core/core.dart';

class PriceTopUpButton extends StatelessWidget {
  const PriceTopUpButton({
    super.key,
    required this.amount,
    required this.sillverAmount,
    required this.index,
    required this.onPriceSelected,
  });

  final double amount;
  final int sillverAmount;
  final int index;
  final Function(double, int) onPriceSelected;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(TopUpPageController());
    final formattedAmount = ctl.formatAmount(amount, ctl.selectedCurrency.value);

    return GestureDetector(
      onTap: () {
        ctl.togglePriceButtonSelection(index);
        onPriceSelected(amount, sillverAmount);
      },
      child: Obx(
        () => Container(
          width: screenWidth,
          height: screenHeight < 670 ? screenHeight * 0.08 : screenWidth < 800 ? screenHeight * .075 : screenHeight * .1,
          decoration: BoxDecoration(
              border: Border.all(
                  color: ctl.isPriceButtonSelectedList[index].value
                      ? AppColor.appColor
                      : AppColor.grey,
                  width: ctl.isPriceButtonSelectedList[index].value
                      ? 3
                      : 1),
              borderRadius: BorderRadius.circular(9)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ctl.selectedSymbol.value,
                        style: TextStyle(
                            fontSize: screenHeight < 670 ? 19 : 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColor.white
                                    : AppColor.appBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      screenHeight < 670 ? const SizedBox(height: 2,) : screenWidth < 800 ? AppSizing.h12 : AppSizing.h28
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppSizing.h06,
                      Text(
                        '$formattedAmount/ ',
                        style: GoogleFonts.lato(
                          fontSize: 24,
                          color: Get.theme.brightness == Brightness.dark
                              ? Colors.white
                              : AppColor.appBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' $sillverAmount Sillver ',
                        style: AppTextStyle.bodySmallLight(context).copyWith(
                          fontSize: screenHeight < 670 ? 16 : null
                        ),
                      ),
                      screenHeight < 670 ? const SizedBox(height: 5,) : screenWidth < 800 ?  AppSizing.h12 : AppSizing.h28
                    ],
                  ),
                ],
              ),
              Positioned(
                left: 16,
                child: Container(
                  height: screenWidth < 800 ? 12 : 24,
                  width: screenWidth < 800 ?  12 : 24,
                  decoration: BoxDecoration(
                      color: ctl.isPriceButtonSelectedList[index].value
                          ? AppColor.appColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ctl.isPriceButtonSelectedList[index].value
                            ? Colors.transparent
                            : AppColor.grey,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
