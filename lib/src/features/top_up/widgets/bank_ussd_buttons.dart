import '../../../core/core.dart';

class SelectUSSDButtons extends StatelessWidget {
  const SelectUSSDButtons({
    super.key,
    required this.index, required this.text, this.ussdCode,
  });
  final String text;
  final int index;
  final String? ussdCode;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(USSDPageController());

    return GestureDetector(
      onTap: () {
        ctl.togglePriceButtonSelection(index);
      },
      child: Obx(
            ()=> Container(
          width: screenWidth,
          height: screenWidth < 800 ? screenHeight * .075 : screenHeight * .1,
          decoration: BoxDecoration(
              border: Border.all(
                  color: ctl.isBankOptionSelectedList[index].value
                      ? AppColor.appColor
                      : AppColor.grey,
                  width: ctl.isBankOptionSelectedList[index].value
                      ? 3
                      : 1),
              borderRadius: BorderRadius.circular(9)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    width: screenWidth,
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      text,
                      softWrap: true,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: Get.theme.brightness == Brightness.dark
                            ? Colors.white
                            : AppColor.appBlack,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Container(
                    color: AppColor.lighterBlue,
                    alignment: Alignment.center,
                    height: 30,
                    child: Text('*$ussdCode#',
                      style: AppTextStyle.bodySmallHeavy(context).copyWith(
                          fontWeight: FontWeight.bold
                      ),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
