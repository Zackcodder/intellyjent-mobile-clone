import '../../../core/core.dart';

class ArchivedListPage extends StatelessWidget {
  const ArchivedListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(ArchivedArticlePageController());

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: screenHeight < 640 ? 40 : 90,
          backgroundColor: Get.theme.brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkAppBg,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                padding: screenHeight < 650
                    ? const EdgeInsets.symmetric(vertical: 6)
                    : screenWidth < 800
                        ? const EdgeInsets.symmetric(vertical: 32)
                        : const EdgeInsets.symmetric(vertical: 25),
                child: SvgPicture.asset(
                  Assets.assetsArrowLeft,
                  color: Get.theme.brightness == Brightness.light
                      ? AppColor.appBlack
                      : AppColor.white,
                ),
              )),
          title: Text('Archive',
              style: screenWidth < 850
                  ? AppTextStyle.h5(context)
                      .copyWith(fontWeight: FontWeight.w800)
                  : AppTextStyle.h4(context)
                      .copyWith(fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: MediaQuery.of(context).size.width < 800
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
                : const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSizing.h20,
                GetX<ArchivedArticlePageController>(
                  builder: (ctl) {
                    if (ctl.archivedArticles.value.isNotEmpty){
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: ctl.archivedArticles.value.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var article = ctl.archivedArticles.value[index];
                          var img = article.imageUrl;
                          var title = article.title;
                          var body = article.body;
                            return Dismissible(
                              key: Key(article.id.toString()),
                              direction: DismissDirection.endToStart,
                              confirmDismiss: (direction) {
                                return Get.dialog(
                                    Dialog(
                                        backgroundColor: Colors.transparent,
                                        surfaceTintColor: Colors.transparent,
                                        clipBehavior: Clip.none,
                                        insetPadding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: AppDialog(
                                          msg: 'Are you sure you want \nto delete this content?',
                                          msgColor: AppColor.red,
                                          isSubText: false,
                                          buttonText: 'Continue',
                                          onTap: () {
                                            int removedIndex = ctl.archivedArticles.value.indexWhere(
                                                    (item) => item.id.toString() == article.id.toString());

                                            if (removedIndex != -1) {
                                              // Unarchive the article first before removing it from the list
                                              ctl.unArchiveArticle(ctl.archivedArticles.value[removedIndex].id);

                                              // Then remove the article from the list
                                              ctl.archivedArticles.value.removeAt(removedIndex);

                                              // Reassign the list to update the UI
                                              ctl.archivedArticles.value = ctl.archivedArticles.value.toList().obs;
                                            }
                                            Get.back();
                                          },
                                          isCancelButton: true,
                                        )),
                                    barrierDismissible: false);
                              },
                              // onDismissed: (direction) {
                              //     int removedIndex = ctl.archivedArticles.value.indexWhere(
                              //             (item) =>
                              //         item.id.toString() ==
                              //             ctl.archivedArticles.value[index].id
                              //                 .toString());
                              //     if (removedIndex != -1) {
                              //       ctl.archivedArticles.value.removeAt(removedIndex);
                              //       ctl.archivedArticles.value = ctl.archivedArticles.value.toList().obs;
                              //       ctl.unArchiveArticle(ctl.archivedArticles.value[removedIndex].id);
                              //     }
                              // },
                              child: GestureDetector(
                                onTap: ()=> Get.to(ArticlePage(
                                    article: article,
                                    ctl: ctl.articleControllers[index]), transition: Transition.upToDown),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                      color: Get.theme.brightness == Brightness.light ? AppColor.whiteOff : AppColor.darkAppNavBar,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if(img.isNotEmpty)
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            img,
                                            width: screenWidth,
                                            height: screenWidth * 0.4,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (context, child, loadingProgress) {
                                              if (loadingProgress == null) {
                                                // Image is loaded
                                                return child;
                                              } else {
                                                final double? loadingValue =
                                                loadingProgress
                                                    .expectedTotalBytes !=
                                                    null
                                                    ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                    : null;
                                                return Center(
                                                  child: SizedBox(
                                                    width: 100,
                                                    child: LinearProgressIndicator(
                                                      value: loadingValue,
                                                      color: AppColor.appColor,
                                                      borderRadius:
                                                      BorderRadius.circular(10),

                                                      // You can customize the color, background color, etc. of the indicator here
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                            errorBuilder: (context, error, stackTrace) {
                                              return Center(
                                                child: Text(
                                                  'Could not load Image',
                                                  style:
                                                  AppTextStyle.bodyMedium(context),
                                                ),
                                              );
                                            },
                                          )),
                                      if(img.isNotEmpty) AppSizing.h04,
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          title,
                                          style: AppTextStyle.bodyMedium(context)
                                              .copyWith(color: AppColor.appColor),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      AppSizing.h04,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.arrow_back,
                                            size: 16,
                                            color: Get.theme.brightness == Brightness.light ? null : Colors.white,
                                          ),
                                          AppSizing.w08,
                                          Text(
                                            'Swipe left to remove content',
                                            style: AppTextStyle.bodySmallLight(context),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                        },
                      );
                    }else {
                      if(ctl.isLoading.value == true ){
                        return GetX<ArchivedArticlePageController>(
                          builder: (controller) {
                            if (controller.isLoading.value == true) {
                              return Container(
                                alignment: Alignment.topCenter,
                                width: double.infinity,
                                height: Get.height,
                                child: Center(
                                  child: LoadingAnimationWidget.threeArchedCircle(
                                      color: AppColor.appColor, size: 50),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        );
                      }else{
                        return Padding(
                          padding: MediaQuery.of(context).size.width < 800
                              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 40)
                              : const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Get.theme.brightness == Brightness.light
                                  ? Assets.emptyArchiveImg : Assets.emptyArchiveImgDark),
                              AppSizing.h28,
                              Text('Archive is empty',
                                style: AppTextStyle.h4Regular(context),),
                              Text('You can add items here by hitting the archive icon on the learn page',
                                  style: AppTextStyle.bodyMedium(context).copyWith(
                                      color: Get.theme.brightness == Brightness.light
                                          ? AppColor.grey200 : AppColor.grey200
                                  ), textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      }

                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
