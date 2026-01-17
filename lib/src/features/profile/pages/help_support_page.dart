import 'package:flutter/gestures.dart';

import '../../../core/core.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final ctl = Get.put(HelpAndSupportController());
    final mediaQuery = MediaQuery.of(context).size;
    final screenWidth = mediaQuery.width;
    final screenHeight = mediaQuery.height;

    return Scaffold(
      appBar: AppBar(
        title:
        const HeaderWidget(title: 'Help & Support', showBackButton: true),
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight < 670 ? 60 : 90,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: MediaQuery.of(context).size.width <800
              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
              : const EdgeInsets.symmetric(horizontal: 40, vertical: 51),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('We are here to help and assist you. Please send us a mail.',
                style: AppTextStyle.h5(context),
              ),
              AppSizing.h24,
              InkWell(
                onTap: ()=> Get.to(()=> const MessageUsPage(), transition: Transition.upToDown),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFECF0FC),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('Message-Text'.isvg),
                      ),
                      AppSizing.w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Inbox', style: AppTextStyle.bodySmallLight(context),),
                          Text('Send us a quick message', style: AppTextStyle.bodySmallLight(context).copyWith(
                            color: AppColor.grey200
                          ),),
                        ],
                      )
                    ]
                  ),
                  SvgPicture.asset(Assets.assetsArrowRightCurved, colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? AppColor.grey200 : AppColor.grey400,
                    BlendMode.srcIn, ))
                ],
              )),
              AppSizing.h42,
              Row(
                children: [
                  Text('FAQ', style: AppTextStyle.h5(context),),
                ],
              ),
              AppSizing.h12,
              ListView.builder(
                shrinkWrap: true,
                itemCount: ctl.questions.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FAQTile(index: index, helpAndSupportController: ctl,);
                },
              ),
              Row(
                children: [
                  Text('FAILED TOP-UPS', style: AppTextStyle.h5(context),),
                ],
              ),
              AppSizing.h12,
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text: 'If you didn’t get your Sillver after payment, please kindly fill out this ',
                    style: AppTextStyle.bodySmallHeavy(context),
                    children: [
                      TextSpan(
                        text: '(form)',
                        style: const TextStyle(
                          color: AppColor.appColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            ctl.launchTopUp();
                          },
                      ),
                      TextSpan(
                        text: ' and it will be resolved. Thank you.',
                        style: AppTextStyle.bodySmallHeavy(context),
                      ),
                    ],
                  ),
                ),
              ),
              AppSizing.h24,
              Row(
                children: [
                  Text('FEEDBACK', style: AppTextStyle.h5(context),),
                ],
              ),
              AppSizing.h12,
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text: 'We love to hear from you; '
                        'suggestions to make the App better, new features you like us to build, complaints, or App reviews. Please click ',
                    style: AppTextStyle.bodySmallHeavy(context),
                    children: [
                      TextSpan(
                        text: '(here)',
                        style: const TextStyle(
                          color: AppColor.appColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            ctl.launchFeedback();
                          },
                      ),
                      TextSpan(
                        text: ' to drop your feedback, thank you. ',
                        style: AppTextStyle.bodySmallHeavy(context),
                      ),
                    ],
                  ),
                ),
              ),
              AppSizing.h24,
            ],
          ),
        ),
      ),
    );
  }
}
