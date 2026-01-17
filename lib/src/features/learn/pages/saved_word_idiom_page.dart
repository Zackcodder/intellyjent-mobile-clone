import 'package:flutter_tts/flutter_tts.dart';

import '../../../core/core.dart';

class SavedWordIdiomPage extends StatefulWidget {
  final String wordIdiom;
  final String meaning;
  final bool? isIdiom;
  const SavedWordIdiomPage({super.key, required this.wordIdiom, this.isIdiom = false, required this.meaning,});

  @override
  State<SavedWordIdiomPage> createState() => _SavedWordIdiomPageState();
}

class _SavedWordIdiomPageState extends State<SavedWordIdiomPage> {
  late FlutterTts flutterTts;

  @override
  void initState(){
    super.initState();
    flutterTts = FlutterTts();
  }

  Future<void> speak(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(word);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.wordIdiom);
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    // Parsing the wordIdiom string
    final wordSections = _parseWordIdiom(widget.meaning, context, widget.wordIdiom, screenWidth);

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
              padding: screenWidth < 800
                  ? const EdgeInsets.symmetric(vertical: 32)
                  : const EdgeInsets.symmetric(vertical: 25),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft,
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.grey200
                    : AppColor.white,
              ),
            )),
        title: Text(widget.isIdiom == false ? "New Word" : 'New Idiom',
            style: screenWidth < 850
                ? AppTextStyle.h5(context).copyWith(fontWeight: FontWeight.w800)
                : AppTextStyle.h4(context)
                .copyWith(fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
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
        ],
      ),
                ),
              ),
    );
  }

  // Function to parse the wordIdiom string into widgets
  List<Widget> _parseWordIdiom(String meaning, BuildContext context, String word, double screenWidth) {
    List<Widget> widgets = [];
    RegExp regex = RegExp(r'(Automated|Contextual meaning|Other meaning|Synonyms|Antonyms):');
    Iterable<RegExpMatch> matches = regex.allMatches(meaning);

    int lastMatchEnd = 0;
    bool firstMatchProcessed = false;

    // Add the title (word) with the icon first
    widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: screenWidth * 0.67),
            child: Text(
              word,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.bodyMedium(context).copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
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
            onPressed: () async => await speak(word),
          ),
        ],
      ),
    );

    // If there are no matches, treat the entire meaning text as normal content
    if (matches.isEmpty) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            meaning.trim(),
            style: TextStyle(color: Get.theme.brightness == Brightness.dark
                ? Colors.white
                : AppColor.appBlack,
                fontWeight: FontWeight.w400,fontSize: 16),
          ),
        ),
      );
      return widgets;
    }

    // Process the meaning with the matches
    for (int i = 0; i < matches.length; i++) {
      var match = matches.elementAt(i);
      if (lastMatchEnd < match.start) {
        String betweenText = meaning.substring(lastMatchEnd, match.start).trim();
        if (betweenText.isNotEmpty) {
          // Add list items (a., b., c., etc.)
          RegExp listRegex = RegExp(r'([a-c]\.\s+(?:.|\n)*?(?=[a-c]\.|$))');
          Iterable<RegExpMatch> listMatches = listRegex.allMatches(betweenText);
          int listLastMatchEnd = 0;

          for (int j = 0; j < listMatches.length; j++) {
            var listMatch = listMatches.elementAt(j);
            if (listLastMatchEnd < listMatch.start) {
              String listBetweenText = betweenText.substring(listLastMatchEnd, listMatch.start).trim();
              if (listBetweenText.isNotEmpty) {
                widgets.add(
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      listBetweenText,
                      style: TextStyle(color: Get.theme.brightness == Brightness.dark
                          ? Colors.white
                          : AppColor.appBlack,
                          fontWeight: FontWeight.w400,fontSize: 16),
                    ),
                  ),
                );
              }
            }
            listLastMatchEnd = listMatch.end;
            widgets.add(
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  listMatch.group(0)!.trim(),
                  style: TextStyle(color: Get.theme.brightness == Brightness.dark
                      ? Colors.white
                      : AppColor.appBlack,
                      fontWeight: FontWeight.w500,fontSize: 16),
                  ),
                ),
            );
          }

          if (listLastMatchEnd < betweenText.length) {
            String listRemainingText = betweenText.substring(listLastMatchEnd).trim();
            if (listRemainingText.isNotEmpty) {
              widgets.add(
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    listRemainingText,
                    style: TextStyle(color: Get.theme.brightness == Brightness.dark
                        ? Colors.white
                        : AppColor.appBlack,
                        fontWeight: FontWeight.w400,fontSize: 16),
                  ),
                ),
              );
            }
          }
        }
      }

      // Process each match as a section title with space
      String matchText = match.group(0)!.trim();
      if (!firstMatchProcessed) {
        matchText = _capitalize(matchText);
        widgets.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizing.h12,
              Text(
                matchText,
                style: AppTextStyle.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
        firstMatchProcessed = true;
      } else {
        widgets.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSizing.h12,
              Text(
                matchText,
                style: AppTextStyle.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      }

      lastMatchEnd = match.end;
    }

    // Add the remaining meaning text after the last match
    if (lastMatchEnd < meaning.length) {
      String remainingText = meaning.substring(lastMatchEnd).trim();
      if (remainingText.isNotEmpty) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              remainingText,
              style: AppTextStyle.bodyMedium(context).copyWith(fontSize: 16),
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
