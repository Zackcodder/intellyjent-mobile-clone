
import '../../../core/core.dart';

class BankDOBPage extends StatelessWidget {
  const BankDOBPage({super.key, required this.sillver, required this.amount});

  final int sillver;
  final int amount;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(BankPageController());

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Pay With Bank'),
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        ()=> SingleChildScrollView(
                  child: Container(
        width: screenWidth,
        padding: MediaQuery.of(context).size.width <800
            ? const EdgeInsets.symmetric(horizontal: 20)
            : const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: screenWidth,
              child: Text('Enter your birthday for verification',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Get.theme.brightness == Brightness.dark
                      ? Colors.white
                      : AppColor.appBlack,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            AppSizing.h28,
            SizedBox(
              width: screenWidth,
              child: SvgPicture.asset(
                Assets.assetsBankBlack,
              ),
            ),
            AppSizing.h12,
            CustomInputField(
              controller: ctl
                  .dobController.value,
              readOnly: true,
              onTap: () async {
                final currentDate =
                DateTime.now();
                final earliestDate = DateTime(
                    currentDate.year - 130,
                    currentDate.month,
                    currentDate.day);
                final latestDate = DateTime(
                    currentDate.year - 15,
                    currentDate.month,
                    currentDate.day);

                showDatePicker(
                    context: context,
                    firstDate: earliestDate,
                    initialDate: latestDate,
                    lastDate: latestDate)
                    .then((value) =>
                    ctl
                        .updateDob(value));
              },
              hintText:
              "16/04/1999", fieldName: '',
            ),
            AppSizing.h48,
            ButtonWidget(
                buttonText: 'Proceed',
                fontSize: 17,
                backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                borderSideColor: Colors.transparent,
                textColor: AppColor.white,
                onPressed:() {
                  Get.to(()=> BankOtpPage(sillver: sillver, amount: amount), transition: Transition.upToDown);
                }
            ),
            ButtonWidget(
                buttonText: 'Change Payment Method',
                fontSize: 17,
                borderSideColor: Colors.transparent,
                textColor: Colors.black,
                onPressed:() {
                  Get.back();
                }
            ),
          ],
        ),
                  ),
                ),
      ),
    );
  }
}
