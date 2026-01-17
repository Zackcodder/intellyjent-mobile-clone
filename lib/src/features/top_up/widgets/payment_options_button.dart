import '../../../core/core.dart';

class PaymentOptionsButtonWidget extends StatelessWidget {
  const PaymentOptionsButtonWidget({
    super.key,
    required this.index, required this.icon, required this.text, required this.padding,
  });

  final String icon;
  final String text;
  final int index;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(PaymentMethodPageController());

    return GestureDetector(
      onTap: () {
        ctl.togglePriceButtonSelection(index);
      },
      child: Obx(
            () => Container(
          width: screenWidth,
          height: screenWidth < 800 ? screenHeight * .075 : screenHeight * .1,
          decoration: BoxDecoration(
              border: Border.all(
                  color: ctl.isPaymentOptionSelectedList[index].value
                      ? AppColor.appColor
                      : Colors.transparent,
                  width: ctl.isPaymentOptionSelectedList[index].value
                      ? 3
                      : 1),
              color: AppColor.grey200.withOpacity(0.05),
              borderRadius: BorderRadius.circular(9)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  screenWidth < 800 ? AppSizing.w20 : AppSizing.h12,
                  Padding(
                    padding: padding,
                    child: SvgPicture.asset(icon, width: screenWidth < 800 ? null : 70,),
                  ),
                  screenWidth < 800 ? AppSizing.w16 : AppSizing.w20,
                  Text(
                    text,
                    style: GoogleFonts.lato(
                      fontSize: screenWidth < 800 ? 16 : 20,
                      color: Get.theme.brightness == Brightness.dark
                          ? Colors.white
                          : AppColor.appBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
