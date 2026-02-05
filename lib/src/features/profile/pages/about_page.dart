import 'package:flutter/gestures.dart';

import '../../../core/core.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final Uri _url = Uri.parse('https://jvecsolutions.com');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var bio =
        "Learning is an essential part of life – a crucial aspect of life that is life-long. The traditional mode of teaching comes with its peculiar challenges, as students at all cadres are sometimes faced with the challenge of understanding topics or concepts, which often leads to demotivation.\n\n"
        "Intellyjent is an e-learning platform that tackles this challenge by turning learning into a game. A meta-analysis by Clark & Mayer (2014) found that educational games led to a moderate gain in student achievement across various subjects and age groups. Specifically, students using games scored 8% higher on assessments compared to traditional methods.\n\n"
        "Intellyjent uses gamified learning and performance-based incentives to help youths build critical cognitive and in-demand skills and connect them to global job opportunities through our HR Partners.\n\n"
        "We use incentives to drive consistent engagement and skill development. Our Gamification approach transforms passive learning into an active, rewarding experience.\n\n"
        "By merging skill building, motivation and employability, we’re creating a pathway for a new generation to emerge - a knowledge-based generation.\n\n";

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      appBar: AppBar(
        title: const HeaderWidget(title: 'About Us'),
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///company logo and name
              Container(
                height: screenHeight * 0.310,
                width: screenWidth,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ///background continaer design
                    InfoCard().infoCardAbout(context),

                    ///logo and name
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Row(),

                        ///company logo
                        SvgPicture.asset(
                          Assets.assetsLogo,
                          width: 70.0,
                          height: 70.0,
                          alignment: Alignment.center,
                        ),
                        AppSizing.h04,

                        ///company name
                        AnimatedOpacity(
                          opacity: 1,
                          // controller.showLogoText.value ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            'Intellyjent',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.h4(context)
                                .copyWith(color: AppColor.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              ///bio write up
              Text(
                textAlign: TextAlign.justify,
                bio,
                style: AppTextStyle.bodySmallLight(context),
              ),

              ///footer
              Text.rich(
                textAlign: TextAlign.justify,
                TextSpan(
                  text:
                      'Powered by JVEC Solutions Inc. \u2014 A Software development and Cybersecurity Company | ',
                  style: AppTextStyle.bodySmallLight(context),
                  children: [
                    TextSpan(
                      text: 'www.jvecsolutions.com',
                      style: const TextStyle(
                        color: AppColor.appColor,
                        decoration: TextDecoration.none,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchUrl();
                        },
                    ),
                  ],
                ),
              ),

              AppSizing.h40,
            ],
          ),
        ),
      ),
    );
  }
}
