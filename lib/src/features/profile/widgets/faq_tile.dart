import 'package:flutter/gestures.dart';

import '../../../core/core.dart';
import 'dart:math';

class FAQTile extends StatelessWidget {
  final int index;
  final HelpAndSupportController helpAndSupportController;

  const FAQTile(
      {super.key, required this.index, required this.helpAndSupportController});

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
                    angle: helpAndSupportController.isExpanded(index)
                        ? -pi / 2.0
                        : pi / 2.0,
                    child: SvgPicture.asset(Assets.assetsArrowRightCurved,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).brightness == Brightness.dark
                              ? AppColor.grey200
                              : AppColor.grey400,
                          BlendMode.srcIn,
                        )),
                  ),
                ],
              ),
            ),
            MediaQuery.of(context).size.height < 670
                ? const SizedBox.shrink()
                : AppSizing.h24,
            if (helpAndSupportController.isExpanded(index))
              buildAnswerText(context, helpAndSupportController.answers[index]),
          ],
        );
      },
    );
  }

  Widget buildAnswerText(BuildContext context, String answer) {
    // Regex pattern to detect URLs in text
    final urlPattern = RegExp(
      r'(https?://[^\s]+)|(www\.[^\s]+)',
      caseSensitive: false,
    );

    final matches = urlPattern.allMatches(answer);

    if (matches.isEmpty) {
      // No URLs found, return simple text
      return Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Text(
              answer,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width < 800 ? null : 20,
                color: Get.theme.brightness == Brightness.dark
                    ? Colors.white
                    : AppColor.appBlack,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppSizing.h28,
          ],
        ),
      );
    }

    // Build rich text with clickable URLs
    final List<TextSpan> textSpans = [];
    int lastEnd = 0;

    for (final match in matches) {
      // Add text before the URL
      if (match.start > lastEnd) {
        textSpans.add(TextSpan(
          text: answer.substring(lastEnd, match.start),
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 800 ? null : 20,
            color: Get.theme.brightness == Brightness.dark
                ? Colors.white
                : AppColor.appBlack,
            fontWeight: FontWeight.w400,
          ),
        ));
      }

      final String url = match.group(0)!;

      // Determine which launcher to use based on URL
      final bool isLaunchpad = url.toLowerCase().contains('launchpad');

      textSpans.add(TextSpan(
        text: url,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width < 800 ? null : 20,
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            if (isLaunchpad) {
              helpAndSupportController.openLaunchpad();
            } else {
              helpAndSupportController.launchWeb();
            }
          },
      ));

      lastEnd = match.end;
    }

    // Add remaining text after last URL
    if (lastEnd < answer.length) {
      textSpans.add(TextSpan(
        text: answer.substring(lastEnd),
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width < 800 ? null : 20,
          color: Get.theme.brightness == Brightness.dark
              ? Colors.white
              : AppColor.appBlack,
          fontWeight: FontWeight.w400,
        ),
      ));
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          RichText(
            text: TextSpan(children: textSpans),
          ),
          AppSizing.h28,
        ],
      ),
    );
  }
}
