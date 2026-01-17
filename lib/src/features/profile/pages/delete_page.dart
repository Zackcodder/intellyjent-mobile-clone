import '../../../core/core.dart';

class DeletePage extends StatelessWidget {
  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(DeletePageController());
    const title = 'We are sorry to see you leave. Please kindly let us understand why you want to delete your account. Your feedback is invaluable.';

    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppNavBar,
      appBar: AppBar(
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppNavBar,
        title:
        const HeaderWidget(title: 'Delete Account'),
        automaticallyImplyLeading: false,
        toolbarHeight: screenWidth > 800 ? 90 : null,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: MediaQuery.of(context).size.width <800
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSizing.h56,
              Text(title, style: AppTextStyle.bodySmallLight(context),),
              AppSizing.h40,
              GetX<DeletePageController>(
                builder: (controller) {
                  List<Widget> deletionReasonWidgets = [];

                  for (var i = 0; i < controller.checkboxValues.length; i++) {
                    if (controller.deletionReasons.isNotEmpty && i < controller.deletionReasons.length) {
                      deletionReasonWidgets.add(
                        InkWell(
                          onTap: ()=> controller.toggleCheckbox(i),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: controller.checkboxValues[i],
                                checkColor: AppColor.white,
                                activeColor: AppColor.appColor,
                                side: const BorderSide(
                                  color: AppColor.grey400, width: 1,
                                ),
                                onChanged: (value) {
                                  controller.toggleCheckbox(i);
                                },
                              ),
                              Text(controller.deletionReasons[i], style: AppTextStyle.bodySmallLight(context)),
                            ],
                          ),
                        ),
                      );
                    }
                  }

                  return Column(
                    children: deletionReasonWidgets,
                  );
                },
              ),
              AppSizing.h20,
              Row(
                children: [
                  Text('Others (Comment)', style: AppTextStyle.bodySmallLight(context),),
                ],
              ),
              AppSizing.h16,
              TextField(
                maxLines: 5,
                style: TextStyle(color: Get.theme.brightness == Brightness.light
                    ? AppColor.appBlack
                    : AppColor.white),
                onChanged: (value) {
                  ctl.otherReason.value = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: AppColor.grey400
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColor.grey400
                      )
                  ),

                ),
              ),
              AppSizing.h40,
              ButtonWidget(buttonText: 'Delete',
                  fontSize: 18,
                  backgroundColor: const MaterialStatePropertyAll(AppColor.red),
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
                                  msg: 'Delete your account permanently?',
                                  isSubText: true,
                                  subText: 'You will lose your data; your referrals, Sillver, and leaderboard points. This cannot be reversed.',
                                  buttonText: 'Delete',
                                  height: screenHeight * 0.6,
                                  buttonColor: AppColor.red,
                                  isDeleteAccount: true,
                                  onTap: () {
                                    ctl.deleteUserAccount();
                                  }, isCancelButton: true,))),
                        barrierDismissible: true);
                  }
              ),
              AppSizing.h40
            ],
          ),
        ),
      ),
    );
  }
}
