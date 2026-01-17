
import '../../../core/core.dart';

class BankOtpPage extends StatelessWidget {
  const BankOtpPage({super.key, required this.sillver, required this.amount});

  final int sillver;
  final int amount;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    // final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(BankPageController());

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'Pay With Bank'),
        toolbarHeight: 90,
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
                 child: Container(
       width: screenWidth,
       padding: MediaQuery.of(context).size.width <800
           ? const EdgeInsets.symmetric(horizontal: 20)
           : const EdgeInsets.symmetric(horizontal: 40),
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: [
           Container(
             width: screenWidth,
             padding: MediaQuery.of(context).size.width <800
                 ? const EdgeInsets.symmetric(horizontal: 20)
                 : const EdgeInsets.symmetric(horizontal: 50),
             child: Text('Please enter the One Time Password (OTP) code sent to you',
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
           AppSizing.h48,
           SizedBox(
             width: screenWidth,
             child: SvgPicture.asset(
               Assets.assetsBankBlack,
             ),
           ),
           AppSizing.h20,
           Padding(
             padding: MediaQuery.of(context).size.width <800
                 ? const EdgeInsets.symmetric(horizontal: 30)
                 : const EdgeInsets.symmetric(horizontal: 60),
             child: Pinput(
               length: 5,
               preFilledWidget: Container(
                 width: screenWidth < 800 ? 10 : 20,
                 height: screenWidth < 800 ? 3 : 6,
                 color: AppColor.grey200,
               ),
               controller: ctl.otpController,
               defaultPinTheme: PinTheme(
                   height: screenWidth < 800 ? 40 : 80,
                   width: screenWidth < 800 ? 60 : 100,
                   textStyle: AppTextStyle.h5(context),
                   decoration: BoxDecoration(
                       color: Colors.transparent,
                       borderRadius: BorderRadius.circular(5),
                       border: Border.all(width: 1, color: AppColor.grey))),
             ),
           ),
           AppSizing.h48,
           Text('Didn\'t receive any code?', style: AppTextStyle.bodySmallLight(context),),
           AppSizing.h08,
           Text('Resend Code.', style: AppTextStyle.bodySmallLight(context).copyWith(
             color: AppColor.appColor,
             fontWeight: FontWeight.bold
           ),),
           AppSizing.h48,
           ButtonWidget(
               buttonText: 'Proceed',
               fontSize: 17,
               backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
               borderSideColor: Colors.transparent,
               textColor: AppColor.white,
               onPressed:() {
                 Get.dialog(
                     Dialog(
                         backgroundColor: Colors.transparent,
                         surfaceTintColor: Colors.transparent,
                         clipBehavior: Clip.none,
                         insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                         child: PopScope(canPop: true,
                             child: AppDialog(
                               msg: 'Successful!!!'
                               ,
                               msgColor: AppColor.appColor,
                               subText: 'You just paid\n ₦${amount.toInt()} for ${sillver.toInt()} sillver',
                               buttonText: 'Continue',
                               isSubText: true,
                               onTap: () {
                                 Get.back();
                                 return;
                               }, isCancelButton: false,))),
                     barrierDismissible: true);
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
    );
  }
}
