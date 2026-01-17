import 'package:intellyjent/src/core/core.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.none,
      surfaceTintColor: Colors.transparent,
      child: ClipPath(
        clipper: const FeedbackBackgroundClipper(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.maxFinite,
            color: Get.theme.brightness == Brightness.light ? AppColor.white : AppColor.darkContainer,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("successs".lsvg),
                  AppSizing.h12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Congratulations!!",
                        style: AppTextStyle.h5(context),
                      ),
                      SvgPicture.asset("sucessEmoji".lsvg),
                    ],
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8),
                      child: Text(
                        "You are fully set up to take on the world!",
                        style: AppTextStyle.bodyMedium(context),
                        textAlign: TextAlign.center,
                      )),
                  AppSizing.h40,
                  InkWell(
                    onTap: () {
                      Get.offAll(()=> const Root());
                    },
                    child: Container(
                      width: double.maxFinite,
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8),
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.appColor),
                      child: Text("Go to home",
                          style: AppTextStyle.h4Regular(context).copyWith(
                              fontSize: 17, color: AppColor.white,
                              fontWeight: FontWeight.w400)),
                    ),
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
