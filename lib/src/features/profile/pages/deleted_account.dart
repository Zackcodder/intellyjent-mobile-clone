import 'package:intellyjent/src/core/core.dart';

class DeletedAccount extends StatelessWidget {
  const DeletedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        toolbarHeight: 90,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Delete account",
          style: AppTextStyle.h3Regular(context),
        ),
      ),
      body: Padding(
        padding: MediaQuery.of(context).size.width <800
            ? const EdgeInsets.symmetric(horizontal: 20)
            : const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          SvgPicture.asset(Get.theme.brightness == Brightness.light
                              ? Assets.assetsDeletedAccount : Assets.assetsDeletedAccountDark, fit: BoxFit.cover),
                          Text(
                            "Account deleted",
                            style: AppTextStyle.h4Regular(context),
                            textAlign: TextAlign.center,
                          ),
                          AppSizing.h04,
                          Text(
                            "Your account has been deleted at your request. Thank you again for using Intellyjent.",
                            style: AppTextStyle.bodyMedium(context),
                            textAlign: TextAlign.center,
                          ),
                         ],
                      )),
                      ButtonWidget(
                                  buttonText: 'Done',
                                  fontSize: 17,
                                  textColor: AppColor.white,
                                  borderSideColor: Colors.transparent,
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          AppColor.appColor),
                                  onPressed: () => Get.offAll(()=> const Login()),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).padding.bottom +20,
                                )
                              
                     ],
                  ),
                ),
      
    );
  }
}