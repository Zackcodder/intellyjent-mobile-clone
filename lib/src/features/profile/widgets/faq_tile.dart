import 'package:flutter/gestures.dart';

import '../../../core/core.dart';
import 'dart:math';

class FAQTile extends StatelessWidget {
  final int index;
  final HelpAndSupportController helpAndSupportController;

  const FAQTile({super.key, required this.index, required this.helpAndSupportController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpAndSupportController>(
      init: helpAndSupportController,
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                helpAndSupportController.toggleFAQ(index);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      helpAndSupportController.questions[index],
                      style: AppTextStyle.bodySmallHeavy(context),
                    ),
                  ),
                  Transform.rotate(
                    angle: helpAndSupportController.isExpanded(index) ? -pi / 2.0 : pi / 2.0,
                    child: SvgPicture.asset(Assets.assetsArrowRightCurved, colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColor.grey200 : AppColor.grey400,
                      BlendMode.srcIn, )),
                  ),
                ],
              ),
            ),
            MediaQuery.of(context).size.height < 670 ? const SizedBox.shrink() : AppSizing.h24,
            if (helpAndSupportController.isExpanded(index))
              buildAnswerText(context, helpAndSupportController.answers[index]),
          ],
        );
      },
    );
  }
  Widget buildAnswerText(BuildContext context, String answer) {
    final List<String> parts = answer.split('www.intellyjent.com');
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: parts[0],
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 800 ? null : 20,
                      color: Get.theme.brightness == Brightness.dark
                          ? Colors.white
                          : AppColor.appBlack,
                      fontWeight: FontWeight.w400,
                  ),
                ),
                if (parts.length > 1)
                  TextSpan(
                    text: 'www.intellyjent.com',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width < 800 ? null : 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        helpAndSupportController.launchWeb();
                      },
                  ),
                if (parts.length > 1) TextSpan(text: parts[1]),
              ],
            ),
          ),
          AppSizing.h28,
        ],
      ),
    );
  }
}
