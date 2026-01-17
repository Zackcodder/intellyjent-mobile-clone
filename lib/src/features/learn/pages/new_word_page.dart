import '../../../core/core.dart';

class NewWordIdiomPage extends StatelessWidget {
  final String wordIdiom;
  final int sillverCount;
  final Article article;
  final bool? isIdiom;
  const NewWordIdiomPage({super.key, required this.wordIdiom, required this.sillverCount, this.isIdiom = false, required this.article});

  @override
  Widget build(BuildContext context) {
    print(wordIdiom);
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final ctl = Get.put(NewWordController(isIdiom == true ? 'saved-idioms': 'saved-words' , wordIdiom));

    // Parsing the wordIdiom string
    final wordSections = _parseWordIdiom(wordIdiom, context, ctl, screenWidth);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: screenWidth < 370
                  ? const EdgeInsets.symmetric(vertical: 32)
                  : screenWidth < 650
                  ? const EdgeInsets.symmetric(vertical: 27)
                  : const EdgeInsets.symmetric(vertical: 25),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft,
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.grey200
                    : AppColor.white,
              ),
            )),
        title: Text(isIdiom == false ? "New Word" : 'New Idiom',
            style: screenWidth < 850
                ? AppTextStyle.h5(context).copyWith(fontWeight: FontWeight.w800)
                : AppTextStyle.h4(context)
                    .copyWith(fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        ()=> SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: MediaQuery.of(context).size.width < 800
                ? const EdgeInsets.only(left: 20, right: 20, bottom: 41)
                : const EdgeInsets.only(left: 40, right: 40, bottom: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...wordSections,
                AppSizing.h24,
                if (ctl.isIdiomSaved.value == false) ButtonWidget(
                  buttonText: sillverCount == 0 ? 'Save' : 'Save for ${sillverCount.toString()} Sillver',
                  fontSize: 17,
                  backgroundColor: const MaterialStatePropertyAll(AppColor.appColor),
                  textColor: AppColor.white,
                  borderSideColor: Colors.transparent,
                  onPressed: () => Get.dialog(
                      Dialog(
                          backgroundColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          clipBehavior: Clip.none,
                          insetPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                          child: PopScope(
                              canPop: true,
                              child: AppDialog(
                                msg: sillverCount == 0 ? 'Save' : 'Save for ${sillverCount.toString()} Sillver?',
                                cancelText: 'No',
                                buttonText: 'Yes',
                                onTap: () async {
                                  await ctl.postSaveWordIdiom(article.id, isIdiom == true ? 'save_idiom' : 'save_word',
                                      isIdiom == true ? 'idiom' : 'word');
                                  Get.back();
                                },
                                isCancelButton: true,
                              ))),
                      barrierDismissible: true),
                ),
                ButtonWidget(
                  buttonText: 'Close',
                  onPressed: () => Get.back(),
                  textColor: AppColor.appColor,
                  fontSize: 17,
                  borderSideColor: AppColor.appColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Function to parse the wordIdiom string into widgets
  List<Widget> _parseWordIdiom(String text, BuildContext context, NewWordController ctl, double screenWidth) {
    List<Widget> widgets = [];

    // Find the first colon to separate the word and phonetic transcription from the rest of the text
    int colonIndex = text.indexOf(':');

    if (colonIndex != -1) {
      // Extract the title and phonetic transcription (e.g., "Nascent: UK  /ˈneɪ.sənt/ US  /ˈneɪ.sənt/")
      String title = text.substring(0, colonIndex).trim();

      ctl.savedWordIdiom.value = title.split(':').first;

      // Create the Row with the title, phonetic transcription, and the speaker icon
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: screenWidth * 0.7,
              ),
              child: Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.bodyMedium(context)
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.volume_down_outlined,
                size: 20,
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.appBlack
                    : AppColor.white,
              ),
              onPressed: () => ctl.speak(title.split(':').first), // Only speak the word "Nascent"
            ),
          ],
        ),
      );

      // Add the remaining text after the colon for further processing
      String remainingText = text.substring(colonIndex + 1).trim();

      ctl.savedMeaning.value = remainingText;
      text = remainingText;
    }

    // Use a regex to identify different sections and compartmentalize them
    RegExp regex = RegExp(r'(Contextual meaning|Other meaning|Synonyms|Antonyms):');
    Iterable<RegExpMatch> matches = regex.allMatches(text);

    int lastMatchEnd = 0;

    // Process the text with the matches
    for (int i = 0; i < matches.length; i++) {
      var match = matches.elementAt(i);
      if (lastMatchEnd < match.start) {
        String betweenText = text.substring(lastMatchEnd, match.start).trim();
        if (betweenText.isNotEmpty) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                betweenText,
                style: TextStyle(
                  color: Get.theme.brightness == Brightness.dark
                      ? Colors.white
                      : AppColor.appBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      }

      // Add section titles (e.g., "Contextual meaning:", "Other meaning:")
      String matchText = match.group(0)!.trim();
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            matchText,
            style: TextStyle(
              color: Get.theme.brightness == Brightness.dark
                  ? Colors.white
                  : AppColor.appBlack,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      );

      lastMatchEnd = match.end;

      // Handle the "Other meaning" section separately for numbering
      if (matchText.startsWith("Other meaning:")) {
        String otherMeaningText = text.substring(lastMatchEnd).trim();

        // Stop processing if we encounter "Synonyms" or "Antonyms" sections
        RegExp stopRegex = RegExp(r'(Synonyms|Antonyms):');
        var stopMatch = stopRegex.firstMatch(otherMeaningText);
        if (stopMatch != null) {
          otherMeaningText = otherMeaningText.substring(0, stopMatch.start).trim();
          lastMatchEnd = text.indexOf(stopMatch.group(0)!);
        } else {
          lastMatchEnd = text.length;
        }

        RegExp numberRegex = RegExp(r'(\d+\.\s)([^\d]*)');
        Iterable<RegExpMatch> numberMatches = numberRegex.allMatches(otherMeaningText);

        for (var numberMatch in numberMatches) {
          String numberText = numberMatch.group(1)!.trim();
          String associatedText = numberMatch.group(2)!.trim();

          widgets.add(
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$numberText  ',
                      style: TextStyle(
                        color: Get.theme.brightness == Brightness.dark
                            ? Colors.white
                            : AppColor.appBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: associatedText,
                          style: TextStyle(
                            color: Get.theme.brightness == Brightness.dark
                                ? Colors.white
                                : AppColor.appBlack,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSizing.h08,
                ],
              ),
            ),
          );
        }
      }
    }

    // Add the remaining text after the last match
    if (lastMatchEnd < text.length) {
      String remainingText = text.substring(lastMatchEnd).trim();
      if (remainingText.isNotEmpty) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              remainingText,
              style: TextStyle(
                color: Get.theme.brightness == Brightness.dark
                    ? Colors.white
                    : AppColor.appBlack,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        );
      }
    }

    return widgets;
  }

// Helper function to capitalize the first letter of each word in a string
  String _capitalize(String text) {
    return text.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }


}
