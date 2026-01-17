import '../../../core/core.dart';

class SelectBankDialog extends StatelessWidget {
  final BankPageController ctl;
  final int selectedIndex;
  const SelectBankDialog(
      {super.key, required this.ctl, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedBankPosition =
          selectedIndex * (screenWidth < 800 ? mediaQuery.size.height * .084 : mediaQuery.size.height * .85);
      ctl.scrollController.jumpTo(selectedBankPosition);
    });

    return ClipPath(
      clipper: const FeedbackBackgroundClipper(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.maxFinite,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkContainer,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 40),
            child: SingleChildScrollView(
              controller: ctl.scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Click here to choose',
                    style: AppTextStyle.h5(context).copyWith(
                      fontWeight: FontWeight.bold
                    ),),
                  AppSizing.h18,
                  Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: AppColor.lighterBlue,
                      shape: BoxShape.circle
                    ),
                    child: ClipOval(
                      clipBehavior: Clip.none,
                        child: SvgPicture.asset(Assets.assetsBankBlack,
                        width: 30, height: 30,)),
                  ),
                  AppSizing.h32,
                  if (ctl.banks.isEmpty) AppSizing.h20,
                  if (ctl.banks.isEmpty) SizedBox(
                    width: screenWidth,
                      child: Text('No Internet Connection', style: AppTextStyle.h4(context).copyWith(
                        color: AppColor.grey400
                      ), textAlign: TextAlign.center,)),
                  if (ctl.banks.isNotEmpty) Column(
                    children: ctl.banks.asMap().entries.map((entry) {
                      final bankIndex = entry.key;
                      final bank = entry.value;
                      return Column(
                        children: [
                          SelectBankButtons(
                            index: bankIndex,
                            text: bank.name,
                          ),
                          AppSizing.h08,
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}