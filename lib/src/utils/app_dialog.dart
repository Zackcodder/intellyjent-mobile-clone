import 'package:intellyjent/src/core/core.dart';

class AppDialog extends StatelessWidget {
  final String msg;
  final String? subText;
  final String? cancelText;
  final double? height;
  final bool? isSubText;
  final Color? buttonColor;
  final Color? msgColor;
  final String buttonText;
  final bool isCancelButton;
  final bool? isDeleteAccount;
  final VoidCallback onTap;
  const AppDialog(
      {super.key,
      required this.msg,
      required this.buttonText,
      required this.onTap,
      required this.isCancelButton,
      this.height,
      this.isDeleteAccount = false, this.buttonColor, this.isSubText = false, this.subText,
        this.cancelText = 'Cancel', this.msgColor});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    return ClipPath(
      clipper: const FeedbackBackgroundClipper(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: screenHeight < 670 ? screenHeight * 0.6 : height ?? screenHeight * 0.4,
          width: double.maxFinite,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isDeleteAccount == true
                    ? Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.lighterPink
                  ),
                  child: SvgPicture.asset(Assets.assetsDeleteRed,
                      width: screenWidth < 800 ? 44 : 80,
                  ),

                ) : const SizedBox.shrink(),
                AppSizing.h40,
                Text(
                  msg,
                  style: AppTextStyle.h5(context).copyWith(
                      color: msgColor ?? (Theme.of(context).brightness == Brightness.light
                          ? AppColor.appBlack
                          : AppColor.white)),
                  textAlign: TextAlign.center,
                ),
                if (isSubText == true ) AppSizing.h12,
                if (isSubText == true )  Text(
                  subText!,
                  style: TextStyle(
                      fontSize: screenWidth < 800 ? 14 : 18,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.grey400
                          : AppColor.white),
                  textAlign: TextAlign.center,
                ),
                AppSizing.h20,
                InkWell(
                  onTap: onTap,
                  child: Container(
                    width: double.maxFinite,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6),
                    height: screenWidth < 800 ? 55 : 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonColor ?? AppColor.appColor),
                    child: Text(buttonText,
                        style: AppTextStyle.h4Regular(context).copyWith(
                            fontSize: 17,
                            color: AppColor.white,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                AppSizing.h12,
                isCancelButton
                    ? InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          width: double.maxFinite,
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.6),
                          height: screenWidth < 800 ? 55 : 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.grey),
                          child: Text(cancelText!,
                              style: AppTextStyle.h4Regular(context).copyWith(
                                  fontSize: 17,
                                  color: AppColor.appBlack,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadDialog extends StatelessWidget {
  final String msg;
  final double? height;
  const LoadDialog(
      {super.key,
      required this.msg,
      this.height,});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;

    return ClipPath(
      clipper: const FeedbackBackgroundClipper(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height ?? MediaQuery.of(context).size.height * 0.4,
          width: double.maxFinite,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  msg,
                  style: AppTextStyle.h5(context).copyWith(
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.appBlack
                          : AppColor.white),
                  textAlign: TextAlign.center,
                ),
                AppSizing.h20,
                LoadingAnimationWidget.threeArchedCircle(
                    color: AppColor.appColor,
                    size: screenWidth < 800 ? 50 : 80
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppDialogWidgetExt extends StatelessWidget {
  final double? height;
  final Widget widget;
  const AppDialogWidgetExt(
      {super.key,
        this.height, required this.widget,});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    return ClipPath(
      clipper: const FeedbackBackgroundClipper(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: screenHeight < 670 ? screenHeight * 0.6 : height ?? screenHeight * 0.4,
          width: double.maxFinite,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: widget,
          ),
        ),
      ),
    );
  }
}
