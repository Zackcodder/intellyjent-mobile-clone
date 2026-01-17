import '../../../core/core.dart';
import 'package:flutter_html/flutter_html.dart';


class PremiumArticleListPage extends StatelessWidget {
  final bool? isPremium;
  const PremiumArticleListPage({super.key, this.isPremium = false});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final ctl = Get.put(PremiumListPageController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height < 640 ? 70 : 100,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              if (ctl.showSearch.value) {
                ctl.showSearch.value = false;
                ctl.searchResults.value.clear();
              } else {
                ctl.showSearch.value = false;
                ctl.searchResults.value.clear();
                ctl.articles.value.clear();
                Get.back();
              }
            },
            child: Container(
              padding:
              Get.width < 370
                  ? const EdgeInsets.symmetric(vertical: 15)
                  : Get.width < 650
                  ? const EdgeInsets.symmetric(vertical: 35)
                  : Get.width < 800
                  ? const EdgeInsets.symmetric(vertical: 60)
                  : const EdgeInsets.symmetric(vertical: 60),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft,
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.appBlack
                    : AppColor.white,
              ),
            )),
        actions: [
          Obx(
                () => SizedBox(
              width: ctl.showSearch.value == false ? 40 : Get.width * 0.8,
              child: Row(
                children: [
                  ctl.showSearch.value == true
                      ? Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        onChanged: (value) => ctl.searchArticles(value),
                        style: AppTextStyle.bodyMedium(context),
                        decoration: InputDecoration(
                            hintText: 'Search articles...',
                            border: InputBorder.none,
                            hintStyle: AppTextStyle.bodyMedium(context)),
                      ),
                    ),
                  )
                      : GestureDetector(
                      onTap: () {
                        ctl.showSearch.value = true;
                      },
                      child: SvgPicture.asset(
                        Assets.searchIcon,
                        color: Get.theme.brightness == Brightness.light
                            ? null
                            : Colors.white,
                      )),
                ],
              ),
            ),
          ),
          AppSizing.w12,
        ],
        automaticallyImplyLeading: false,
        title: ctl.showSearch.value == false
            ? Obx(
                  () => Text(ctl.currentCategory.value,
                  style: Get.width < 790
                      ? AppTextStyle.h5(context)
                      .copyWith(fontWeight: FontWeight.w800)
                      : AppTextStyle.h4(context)
                      .copyWith(fontWeight: FontWeight.w500)),
            )
            : null,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GetBuilder<PremiumListPageController>(
        builder: (cnt) {
          if (cnt.searchResults.value.isNotEmpty) {
          return GetX<PremiumListPageController>(
              builder: (contx) {
              return SingleChildScrollView(
                child: Container(
                  color: Get.theme.brightness == Brightness.light
                      ? AppColor.white
                      : AppColor.darkContainer,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Display search results in a dropdown menu
                      for (var article in contx.searchResults.value)
                        ListTile(
                          title: Column(
                            children: [
                              Text(article.title, style: AppTextStyle.h4Regular(context).copyWith(
                                color: Get.theme.brightness == Brightness.light
                                    ? AppColor.appBlack
                                    : AppColor.white,
                              ),),
                              AppSizing.h04,
                              Html(
                                data: '${article.body.substring(0, 150)}...',
                                style: {
                                  "body": Style(
                                    fontSize: Get.width < 370
                                        ? FontSize.small : FontSize.medium,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.justify,
                                    color: Get.theme.brightness == Brightness.light
                                        ? AppColor.appBlack
                                        : AppColor.white,
                                  ),
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            var index = contx.articles.value.indexWhere((element) => element == article);
                            var title = article.title;
                            var image = article.imageUrl;
                            var content = article.body;
                            if(index != -1){

                              Get.to(()=> ArticlePage(
                                article: article, ctl: contx.articleControllers[index],
                               ), transition: Transition.upToDown
                              );
                            }
                          },)
                    ],
                  ),
                ),
              );
            }
          );
        }
          else {
            if(cnt.articles.value.isNotEmpty){
              return GetBuilder<PremiumListPageController>(
                  builder: (cont) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          width: Get.width,
                          padding: MediaQuery.of(context).size.width <800
                              ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
                              : const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(cont.currentCategoryImage.value,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        // Image is loaded
                                        return child;
                                      } else {
                                        // Image is still loading, show a linear progress indicator
                                        final double? loadingValue = loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                            : null;
                                        return Center(
                                          child: SizedBox(
                                            width: 100,
                                            child: LinearProgressIndicator(
                                              value: loadingValue,
                                              color: AppColor.appColor,
                                              borderRadius: BorderRadius.circular(10),

                                              // You can customize the color, background color, etc. of the indicator here
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  )
                              ),
                              AppSizing.h20,
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cont.articles.value.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var article = cont.articles.value[index];

                                    return GestureDetector(
                                      onTap: ()=> Get.to(()=> ArticlePage(
                                        article: article,
                                        ctl: cont.articleControllers[index],), transition: Transition.upToDown),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          AppSizing.h16,
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                color: Get.theme.brightness == Brightness.light ? AppColor.whiteOff : AppColor.darkAppNavBar,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                // article img
                                                ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: article.imageUrl.isNotEmpty
                                                        ? Image.network(article.imageUrl,
                                                      width: Get.width * 0.32,
                                                      height: Get.width * 0.32,
                                                      fit: BoxFit.cover,
                                                      loadingBuilder: (context, child, loadingProgress) {
                                                        if (loadingProgress == null) {
                                                          // Image is loaded
                                                          return child;
                                                        } else {
                                                          // Image is still loading, show a linear progress indicator
                                                          final double? loadingValue = loadingProgress.expectedTotalBytes != null
                                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                              : null;
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 100,
                                                              child: LinearProgressIndicator(
                                                                value: loadingValue,
                                                                color: AppColor.appColor,
                                                                borderRadius: BorderRadius.circular(10),

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
                                                            style: AppTextStyle.bodyMedium(context),
                                                          ),
                                                        );
                                                      },
                                                    )
                                                        : const SizedBox.shrink()
                                                ),

                                                AppSizing.w12,
                                                Flexible(
                                                  child: Column(
                                                    children: [
                                                      // title
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text(article.title,
                                                          style: AppTextStyle.h4Regular(context).copyWith(
                                                              fontWeight: FontWeight.w900
                                                          ), textAlign: TextAlign.left,
                                                          maxLines: 3, overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ),
                                                      //body
                                                      Html(
                                                        data: '${article.body.substring(0, 150)}...',
                                                        style: {
                                                          "body": Style(
                                                            fontSize: Get.width < 370
                                                                ? FontSize.xxSmall : FontSize.medium,
                                                            fontWeight: FontWeight.bold,
                                                            textAlign: TextAlign.justify,
                                                            color: Get.theme.brightness == Brightness.light
                                                                ? AppColor.grey400
                                                                : AppColor.white,
                                                          ),
                                                        },
                                                      ),
                                                      //likes views
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                        child: LikeReadArchiveWidget(
                                                          ctl: cont.articleControllers[index], ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          AppSizing.h16,
                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Get.theme.brightness == Brightness.light
                            ? AppColor.white
                            : AppColor.darkAppBg,
                        height: Get.width < 650
                            ? Get.width * 0.18 : Get.width * 0.15,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        width: Get.width,
                        child: SizedBox(
                          width: double.infinity,
                          height: Get.width < 650
                              ? Get.width * 0.1 : Get.width * 0.15,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ctl.categoryList.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                String chatName = ctl.categoryList.value[index];
                                return Row(
                                  children: [
                                    AppSizing.w04,
                                    GestureDetector(
                                      onTap: () async => await ctl.loadCategoryData(ctl.categoryList.value[index]),
                                      child: Card(
                                        elevation: 0,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        color: Get.theme.brightness == Brightness.light
                                            ? AppColor.grey200.withOpacity(0.5)
                                            : AppColor.darkAppNavBar,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 12),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(chatName,
                                                  style: AppTextStyle.bodyVerySmall(
                                                      context))),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],

                  );
                }
              );
            }else{
              return GetBuilder<PremiumListPageController>(
                  builder: (cont2) {
                  return Stack(
                    children: [
                      Padding(
                        padding: MediaQuery.of(context).size.width < 800
                            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 40)
                            : const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                        child: SizedBox(
                          width: mediaQuery.size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Get.theme.brightness == Brightness.light
                                  ? Assets.emptyArchiveImg : Assets.emptyArchiveImgDark),
                              AppSizing.h28,
                              Text('No articles for this category',
                                style: AppTextStyle.h4Regular(context), textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Get.theme.brightness == Brightness.light
                            ? AppColor.white
                            : AppColor.darkAppBg,
                        height: Get.width < 650
                            ? Get.width * 0.18 : Get.width * 0.15,
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: SizedBox(
                          width: double.infinity,
                          height: Get.width < 650
                              ? Get.width * 0.1 : Get.width * 0.15,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cont2.categoryList.value.length,
                              itemBuilder: (BuildContext context, int index) {
                                String chatName = cont2.categoryList.value[index];
                                return Row(
                                  children: [
                                    AppSizing.w04,
                                    GestureDetector(
                                      onTap: () async => await cont2.loadCategoryData(cont2.categoryList.value[index]),
                                      child: Card(
                                        elevation: 0,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        color: Get.theme.brightness == Brightness.light
                                            ? AppColor.grey200.withOpacity(0.5)
                                            : AppColor.darkAppNavBar,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 12),
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(chatName,
                                                  style: AppTextStyle.bodyVerySmall(
                                                      context))),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  );
                }
              );
            }
          }
        },
      ),
    );
  }
}

