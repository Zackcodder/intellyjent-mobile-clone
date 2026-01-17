import 'package:flutter_html/flutter_html.dart';

import '../../../core/core.dart';

class ArticlePage extends StatefulWidget {
  final Article article;
  final ArticlePageController ctl;
  const ArticlePage(
      {super.key,
      required this.ctl, required this.article});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {


  @override
  void initState() {
    super.initState();

    _readCountForFreePages();
  }

  Future<void> _readCountForFreePages() async {
    print(widget.article.read);
    if (widget.article.silverCount == 0 && widget.article.read == false) {
      await widget.ctl.postArticleUpdate(widget.article.id, 'read');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight < 640 ? 60 : 90,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
              widget.ctl.showFullContent.value = false;
            },
            child: Container(
              padding: screenHeight < 640
                  ? const EdgeInsets.symmetric(vertical: 15)
                  : screenWidth < 800
                      ? const EdgeInsets.symmetric(vertical: 32)
                      : const EdgeInsets.symmetric(vertical: 25),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft,
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.appBlack.withOpacity(0.8)
                    : AppColor.white,
              ),
            )),
        title: Text("",
            style: screenWidth < 850
                ? AppTextStyle.h5(context).copyWith(fontWeight: FontWeight.w800)
                : AppTextStyle.h4(context)
                    .copyWith(fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: MediaQuery.of(context).size.width < 800
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
                : const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(widget.article.imageUrl.isNotEmpty)ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(imageUrl: widget.article.imageUrl)),
                AppSizing.h20,
                Text(
                  widget.article.title,
                  style: AppTextStyle.h4Regular(context),
                ),
                AppSizing.h20,
                Obx(
                  () {
                    return Html(
                    data: widget.ctl.isRead.value || widget.article.silverCount == 0
                        ? widget.article.body
                        :  '${widget.article.body.substring(0, 250)}...',
                    style: {
                      "body": Style(
                        fontSize: FontSize.large,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        textDecorationColor: Get.theme.brightness == Brightness.light
                            ? AppColor.grey400
                            : AppColor.grey200,
                        color: Get.theme.brightness == Brightness.light
                            ? AppColor.grey400
                            : AppColor.white,
                      ),
                    },
                    onAnchorTap: (url, attributes, element) {
                      if (url != null) {
                        if (url.startsWith("#idiom1")) {
                          Get.to(() => NewWordIdiomPage(wordIdiom: widget.article.idioms1, article: widget.article,
                            sillverCount: widget.article.wordsIdiomsSillverCount, isIdiom: true,), transition: Transition.upToDown);
                        } else if (url.startsWith("#idiom2")) {
                          Get.to(() => NewWordIdiomPage(wordIdiom: widget.article.idioms2,
                              sillverCount: widget.article.wordsIdiomsSillverCount, article: widget.article, isIdiom: true,), transition: Transition.upToDown);
                        } else if (url.startsWith("#idiom3")) {
                          Get.to(() => NewWordIdiomPage(wordIdiom: widget.article.idioms3,
                              sillverCount: widget.article.wordsIdiomsSillverCount, article: widget.article, isIdiom: true,), transition: Transition.upToDown);
                        } else if (url.startsWith("#newWord1")) {
                          Get.to(() => NewWordIdiomPage(wordIdiom: widget.article.newWord1!, article: widget.article, sillverCount: widget.article.wordsIdiomsSillverCount), transition: Transition.upToDown);
                        } else if (url.startsWith("#newWord2")) {
                          Get.to(() => NewWordIdiomPage(wordIdiom: widget.article.newWord2!, article: widget.article, sillverCount: widget.article.wordsIdiomsSillverCount), transition: Transition.upToDown);
                        } else if (url.startsWith("#newWord3")) {
                          Get.to(() => NewWordIdiomPage(wordIdiom: widget.article.newWord3!, article: widget.article, sillverCount: widget.article.wordsIdiomsSillverCount), transition: Transition.upToDown);
                        }
                      }
                    },
                  );
                  },
                ),
                AppSizing.h32,
                if (!widget.ctl.isRead.value)
                  ButtonWidget(
                      buttonText: 'Continue Reading',
                      textColor: AppColor.white,
                      borderSideColor: Colors.transparent,
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColor.appColor),
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
                                    msg: 'Continue Reading for ${widget.ctl.chargeForFullRead.value} Sillver',
                                    cancelText: 'No',
                                    buttonText: 'Yes',
                                    onTap: () async {
                                      await widget.ctl.postArticleUpdate(widget.article.id, 'read');
                                      Get.back();
                                    },
                                    isCancelButton: true,
                                  ))),
                          barrierDismissible: true),
                      fontSize: 17),
                //like archive
                if (widget.ctl.isRead.value)
                  LikeReadArchiveWidget(
                    ctl: widget.ctl,
                    showEye: false,
                  ),
                if (widget.ctl.isRead.value)AppSizing.h18
              ],
            ),
          ),
        ),
      ),
    );
  }
}
