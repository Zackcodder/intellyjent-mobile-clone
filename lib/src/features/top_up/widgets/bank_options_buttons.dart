import '../../../core/core.dart';

class SelectBankButtons extends StatelessWidget {
  const SelectBankButtons({
    super.key,
    required this.index, required this.text,
  });
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(BankPageController());


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
                  child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              screenWidth < 800 ? AppSizing.w08 : AppSizing.w12,
              screenWidth < 800 ? AppSizing.w08 : AppSizing.w12,
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              screenWidth < 800 ? AppSizing.w04 : AppSizing.h08,
            ],
          ),
          Positioned(
            right: 16,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                  color: ctl.isBankOptionSelectedList[index].value
                      ? AppColor.appColor
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ctl.isBankOptionSelectedList[index].value
                        ? Colors.transparent
                        : AppColor.grey400,
                  )),
            )
               ),
        ],
                  ),
                ),
      ),
    );
  }
}
