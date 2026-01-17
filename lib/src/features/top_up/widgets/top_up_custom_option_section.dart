import '../../../core/core.dart';

class TopUpCustomOptionSection extends StatelessWidget {
  const TopUpCustomOptionSection({
    super.key,
    required this.ctl,
  });

  final TopUpPageController ctl;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        screenWidth < 670 ? AppSizing.h08 : AppSizing.h32,
        Row(
          children: [
            SvgPicture.asset(Assets.assetsInfoCircle),
            AppSizing.w16,
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                'Enter manually number of Sillver above 16',
                style: AppTextStyle.bodySmallLight(context),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ],
        ),
        screenHeight < 670 ? AppSizing.h16 : AppSizing.h56,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sillver',
                  style: AppTextStyle.bodySmallLight(context),
                ),
                AppSizing.h08,
                SizedBox(
                  height: screenWidth < 800 ? 56 : 80,
                  width: screenWidth * 0.4,
                  child: FocusScope(
                    node: FocusScopeNode(),
                    child: TextFormField(
                      controller: ctl.sillverQtyController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.bodyMedium(context),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: screenWidth < 370 ? EdgeInsets.zero : const EdgeInsets.only(top: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  int currentValue = int.tryParse(
                                          ctl.sillverQtyController.text) ??
                                      0;
                                  if (currentValue > 16) {
                                    ctl.sillverQtyController.text =
                                        (currentValue - 1).toString();
                                    ctl.calculateCustomAmountSillverQty(
                                        double.tryParse(
                                                ctl.sillverQtyController.text) ??
                                            0);
                                  }
                                },
                                icon: const Icon(Icons.remove),
                                // iconSize: 20,
                                highlightColor: Colors.transparent,
                              ),
                              IconButton(
                                onPressed: () {
                                  ctl.sillverQtyController.text = ((int.tryParse(
                                                  ctl.sillverQtyController
                                                      .text) ??
                                              0) +
                                          1)
                                      .toString();
                                  ctl.calculateCustomAmountSillverQty(
                                      double.tryParse(
                                              ctl.sillverQtyController.text) ??
                                          0);
                                },
                                icon: const Icon(Icons.add),
                                // iconSize: 20,
                                highlightColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        contentPadding: screenWidth < 370 ? const EdgeInsets.symmetric(horizontal: 5) : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: AppColor.appColor,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.appColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        int currentValue =
                            int.tryParse(ctl.sillverQtyController.text) ?? 0;
                        if (currentValue > 16) {
                          final enteredAmount =
                              double.tryParse(ctl.sillverQtyController.text) ?? 0;
                          ctl.calculateCustomAmountSillverQty(enteredAmount);
                        }
                      },
                      onEditingComplete: () {
                        final enteredAmount =
                            double.tryParse(ctl.sillverQtyController.text) ?? 0;
                        ctl.calculateCustomAmountSillverQty(enteredAmount);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Amount in ${ctl.selectedSymbol.value}',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColor.white
                          : AppColor.appBlack),
                ),
                AppSizing.h08,
                Container(
                  height: screenWidth < 800 ? 53 : 80,
                  width: screenWidth * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.appColor),
                      borderRadius: BorderRadius.circular(8),
                      color: Get.theme.brightness == Brightness.light
                          ? AppColor.grey
                          : AppColor.grey400),
                  child: Obx(
                    () => Text(
                        ctl.formatAmount(ctl.selectedCustomAmount.value,
                            ctl.selectedCurrency.value),
                        style: AppTextStyle.bodyMedium(context)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
