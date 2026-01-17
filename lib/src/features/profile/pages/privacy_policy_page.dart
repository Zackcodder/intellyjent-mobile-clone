import 'package:flutter/gestures.dart';

import '../../../core/core.dart';

class PrivacyPolicyPage extends StatelessWidget {
  PrivacyPolicyPage({super.key});

  final Uri _urlWeb = Uri.parse('https://jvecsolutions.com');
  final Uri _urlMail = Uri.parse('mailto:hello@jvecsolutions.com');

  Future<void> _launchWeb() async {
    if (!await launchUrl(_urlWeb)) {
      throw Exception('Could not launch $_urlWeb');
    }
  }

  Future<void> _launchMail() async {
    if (!await launchUrl(_urlMail)) {
      throw Exception('Could not launch $_urlMail');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const HeaderWidget(title: 'Privacy Policy'),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'INTELLYJENT – PRIVACY POLICY',
                    style: AppTextStyle.bodySmallLight(context),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              AppSizing.h20,
              //about intellyjent
              Row(
                children: [
                  Text(
                    'About Intellyjent ',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              AppSizing.h20,
              Flexible(
                flex: 1,
                child: Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                    text:
                        'JVEC Solutions is the developer, operator and publisher of online games for the web and mobile, in various platforms and devices. The Company operates, among others, the mobile application for android of the app “Intellyjent”, and also the website ',
                    style: AppTextStyle.bodySmallLight(context),
                    children: [
                      TextSpan(
                        text: 'https://www.jvecsolutions.com',
                        style: const TextStyle(
                          color: AppColor.appColor,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchWeb();
                          },
                      ),
                    ],
                  ),
                ),
              ),
              AppSizing.h20,
              //who are we
              Row(
                children: [
                  Text(
                    'Who are we?',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              AppSizing.h20,
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'JVEC Solutions is the developer and operator of the platforms, including website and all services supplied by it (all, the ” Platform”).',
                      style: AppTextStyle.bodySmallLight(context),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              AppSizing.h20,
              // Privacy Policy
              Row(
                children: [
                  Text(
                    'What’s this Privacy Policy about?',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              AppSizing.h20,
              Flexible(
                flex: 1,
                child: Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                    text:
                        ' We have created this Privacy Policy because we highly evaluate your Personal Data and information. Please read it, as it includes important information in respect to your Personal Data and information. We make our best efforts to protect our users’ privacy, and to be compatible with privacy protection laws and regulations, including the Nigerian Data Protection Regulation (the “NDPR”). We have created this document and our privacy practices with great efforts to comply with the NDPR. Please read this Privacy Policy carefully. For any questions or concerns, please contact us via our email address: ',
                    style: AppTextStyle.bodySmallLight(context),
                    children: [
                      TextSpan(
                        text: 'hello@jvecsolutions.com.',
                        style: const TextStyle(
                          color: AppColor.appColor,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchMail();
                          },
                      ),
                    ],
                  ),
                ),
              ),
              AppSizing.h20,
              //consent
              Flexible(
                child: Text(
                  'Consent : By using the Platform or allowing someone else to use it on your behalf, you give your consent to our collection, use, disclosure, transfer and storage of any Personal Data and information received by us as a result of such use, in accordance with this Privacy Policy.',
                  style: AppTextStyle.bodySmallLight(context)
                      .copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                ),
              ),
              AppSizing.h20,
              //warning
              Flexible(
                child: Text(
                  'Be advised that under the NDPR, our classification is of a Controller of the Personal Data provided to us by you. As such, we will make our best efforts to make sure that the following shall apply to your Personal ',
                  style: AppTextStyle.bodySmallLight(context),
                  textAlign: TextAlign.justify,
                ),
              ),
              AppSizing.h20,
              //data held
              Row(
                children: [
                  Text(
                    'Data we hold:',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Text(
                '\n1. We shall use it lawfully, fairly and transparent.'
                '\n2. We shall collect it for specific and legitimate purposes.'
                '\n3. We shall limit the amount of Personal Data to be adequate and relevant.'
                '\n4. It shall be as accurate and up-to-date as possible.'
                '\n5. We shall limit the possibility of your identification to the minimum possible.'
                '\n6. We shall keep it secure.',
                style: AppTextStyle.bodySmallLight(context),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              AppSizing.h20,
              Row(
                children: [
                  Text(
                    'Which Information do we collect? ',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '1. Personal Data ',
                    style: AppTextStyle.bodySmallLight(context),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              AppSizing.h20,
              Row(
                children: [
                  Text(
                    'How do we use your Information?',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Text(
                '\n1.  Personal Data Any Personal Data we collect is being used in a way that is consistent with this Privacy Policy, and may be used as follows: '
                '\na.  Access and Use: Any Personal Data provided to us by you in order to obtain access to any functionality of the Platform may be used by us in order to provide you with access to the required functionality and to monitor your use of such functionality. '
                '\nb.  Company’s Business Purposes: Any Personal Data provided to us by you may be used by us in order to help us improve the functionality of the Platform, to better understand our users, to protect against, identify or address wrongdoing, to enforce our Terms of Use, and to generally manage the Platform and our business. '
                '\nc.  A Specific Reason: Any Personal Data provided to us by you for a specific reason may be used by us in connection with that specific reason. '
                '\nd.  Marketing: Any Personal Data provided to us by you may be used by us to contact you in the future for our marketing and advertising purposes, including without limitation to inform you about new services or Platforms we believe might be of interest to you, and to develop promotional or marketing materials and provide those materials to you. '
                '\ne.  Statistics: Any Personal Data provided to us by you may be used by us for statistic reports containing aggregated information.'
                '\n\n2.  Non-Personal Data Since Non-Personal Data cannot be used to identify you in person, we may use such data in any way permitted by law. ',
                style: AppTextStyle.bodySmallLight(context),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              AppSizing.h20,
              Row(
                children: [
                  Text(
                    'General Terms for Data Transfer ',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              AppSizing.h20,
              Text(
                'Please be advised as your Personal Data may be kept, processed or transferred to servers located outside the country that you live in. We shall keep records of all activities relevant to Personal Data transfer, as required by the NDPR. We shall only transfer your Personal Data to companies that apply to the conditions set forth in the NDPR, subject to your consent to this Privacy Policy. Our cloud is hosted by Heroku at the United States, which are in compliance with the NDPR. ',
                style: AppTextStyle.bodySmallLight(context),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              AppSizing.h20,
              Row(
                children: [
                  Text(
                    'Duration of Data Retention',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              AppSizing.h20,
              Text(
                'We shall retain your Personal Data and activity logs for at least 24 months after the last time you accessed the Services, unless you specifically request us to delete your Personal Data earlier, in such case we will delete it as requested. Which Information do we share with Third Parties? ',
                style: AppTextStyle.bodySmallLight(context),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              AppSizing.h20,
              //personal data 1
              Row(
                children: [
                  Text(
                    '1.  Personal Data ',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              AppSizing.h20,
              Text(
                'We have no intention of selling your Personal Data to any other third party. However, naturally, there are circumstances in which we may disclose, share or transfer your Personal Data, without a further notice, as follows:'
                'a.  Required by Law – If we believe in good faith that disclosure is required by law, including but not limited to, orders by any governmental entity, court or any other judicial entity, in any jurisdiction.'
                'b.  To Prevent Wrongdoing – If we believe in good faith that disclosure is required in order to prevent any kind of illegal activity, fraud or civil wrong.'
                'c.  Business Purposes: As we develop our business, we might sell or buy businesses or assets. In the event of a corporate sale, merger, reorganization, dissolution or similar event, Personal Data may be part of the transferred assets. You acknowledge and agree that any successor to or acquirer of the Company (or its assets) will continue to have the right to use your Personal Data and information in accordance with the terms of this Privacy Policy.',
                style: AppTextStyle.bodySmallLight(context),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              AppSizing.h20,
              //non-personal data 1
              Flexible(
                flex: 1,
                child: Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                    text: '2.  Non-Personal Data:',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                        text:
                            ' Since Non-Personal Data cannot be used to identify you in person, we may disclose such data in any way permitted by law.',
                        style: AppTextStyle.bodySmallLight(context),
                      ),
                    ],
                  ),
                ),
              ),
              AppSizing.h20,
              Text(
                'Links to Other Web Sites Intellyjent may contain links to other websites and/or third-party services. We are not responsible for the privacy policies of such websites and/or services, and we advise you to review their privacy policies. ',
                style: AppTextStyle.bodySmallLight(context),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              AppSizing.h20,
              //personal data 1
              Row(
                children: [
                  Text(
                    'Storage and Security',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              AppSizing.h20,
              Flexible(
                flex: 1,
                child: Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                    text:
                        'We are strongly committed to the protection of your Personal Data and information, and we will take reasonable technical steps, which are accepted in our industry, to keep your Information secured and protect it from loss, misuse or alteration. However, if you notice a risk or any security violations, we advise you to report to us on ',
                    style: AppTextStyle.bodySmallLight(context),
                    children: [
                      TextSpan(
                        text: 'hello@jvecsolutions.com, ',
                        style: const TextStyle(
                          color: AppColor.appColor,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchMail();
                          },
                      ),
                      TextSpan(
                        text: 'so we can resolve it as soon as possible. ',
                        style: AppTextStyle.bodySmallLight(context),
                      ),
                    ],
                  ),
                ),
              ),
              AppSizing.h20,
              //personal data 1
              Row(
                children: [
                  Text(
                    'Other Terms ',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              AppSizing.h20,
              Text(
                '1.  Changes to This Privacy Policy The Platform and our business may change from time to time. As a result, at times, it may be necessary for us to make changes to this Privacy Policy. We reserve the right, in our sole discretion, to update or modify this Privacy Policy at any time (collectively, “Modifications”). Modifications to this Privacy Policy will be displayed by the “Last Updated” date at the top of this Privacy Policy. Please review this Privacy Policy periodically, and especially before you provide any Personal Data or information. This Privacy Policy was last updated on the date indicated above. Your continued use of the Services following the effectiveness of any Modifications to this Privacy Policy constitutes acceptance of those Modifications. If any Modification to this Privacy Policy is not acceptable to you, your sole remedy is to cease accessing, browsing and otherwise using the Platform. '
                '\n\n2. Direct Messages\n\n'
                'a.  The Company may send you, from time to time, information regarding its services, including advertisements, via short messages or emails.\n'
                'b.  By using the Platform, including providing your phone number or email address, you explicitly consent to receive such messages. However, at any time you may inform us of your removing such consent, by sending proper email to: hello@jvecsolutions.com. We may, however, send direct messages we believe are critical for your use of the platform, even following your choice to unsubscribe. \n\n'
                '3. Cookies\n\n'
                'a.  We may use Cookies for the proper and continuous operation of the Platform or website, including collection of statistics, verifications, modifications etc.\n\n'
                '4.  Third Party’s Advertisements\n\n'
                'a.  As part of the services, some third party’s advertisements may appear on the Platform or website. Such advertisements are provided by an external supplier which adapt content according to the user’s habits.\n'
                'b.  Such third-party services may use Cookies. It is hereby clarified that such services are subject to the third party’s privacy policy and not to this document.\n\n'
                '5. Dispute Resolution:\n\n'
                'The laws of Lagos State shall govern this Privacy Policy. Any dispute which may arise in connection with this Privacy Policy shall be brought to the competent court in Lagos State, Nigeria, which shall be granted exclusive jurisdiction. ',
                style: AppTextStyle.bodySmallLight(context),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              AppSizing.h20,
              Row(
                children: [
                  Text(
                    'Contact Information\n'
                    'JVEC Solutions, ',
                    style: AppTextStyle.bodySmallLight(context)
                        .copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '12 Rev. Ogunbiyi street, Ikeja GRA, Lagos State.',
                    style: AppTextStyle.bodySmallLight(context),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              AppSizing.h20,
              Flexible(
                flex: 1,
                child: Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(
                    text:
                        'If you have any questions about this Policy, please contact us at ',
                    style: AppTextStyle.bodySmallLight(context),
                    children: [
                      TextSpan(
                        text: 'hello@jvecsolutions.com',
                        style: const TextStyle(
                          color: AppColor.appColor,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchMail();
                          },
                      ),
                    ],
                  ),
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
