import '../../../core/core.dart';

class LearnCategoryListPage extends StatelessWidget {

  const LearnCategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final ctl = Get.put(ArticleListPageController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight < 640 ? 40 :  90,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        centerTitle: true,
        title: Text(
            "Learn",
            style: screenWidth < 850
                ? AppTextStyle.h5(context).copyWith( fontWeight: FontWeight.w800)
                : AppTextStyle.h4(context).copyWith( fontWeight: FontWeight.w500)
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: screenWidth,
              padding: MediaQuery.of(context).size.width <800
                  ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
                  : const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ArchiveWordsPremiumWidget(screenWidth: screenWidth),
                  AppSizing.h20,
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Career', name2: 'Entertainment', name3: 'Finance',
                    svgIcon1: Get.theme.brightness == Brightness.light ? Assets.careersIcon : Assets.careersDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light ? Assets.entertainmentIcon : Assets.entertainmentDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light ? Assets.financeIcon : Assets.financeDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Career'),
                    onTap2: () async => await ctl.loadCategoryData('Entertainment'),
                    onTap3: () async => await ctl.loadCategoryData('Finance'),
                  ),
                  AppSizing.h18,
          // Geography, Gist, Global Matters
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Gist', name2: 'Global Matters', name3: 'Grammar',
                    svgIcon1: Get.theme.brightness == Brightness.light ? Assets.gistIcon : Assets.gistDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light ? Assets.globalMattersIcon : Assets.globalMattersDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light ? Assets.grammarIcon : Assets.grammarDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Gist'),
                    onTap2: () async => await ctl.loadCategoryData('Global Matters'),
                    onTap3: () async => await ctl.loadCategoryData('Grammar'),
                  ),
                  AppSizing.h18,
          // Health, History, Leadership 101
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Health', name2: 'History', name3: 'Leadership 101',
                    svgIcon1: Get.theme.brightness == Brightness.light ? Assets.healthIcon : Assets.healthDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light ? Assets.historyIcon : Assets.historyDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light ? Assets.leadership101Icon : Assets.leadership101DarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Health'),
                    onTap2: () async => await ctl.loadCategoryData('History'),
                    onTap3: () async => await ctl.loadCategoryData('Leadership 101'),
                  ),
                  AppSizing.h18,
          // Lifestyle, Nature, Nutrition
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Lifestyle', name2: 'Nature', name3: 'Nutrition',
                    svgIcon1: Get.theme.brightness == Brightness.light ? Assets.lifestyleIcon : Assets.lifestyleDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light ? Assets.natureIcon : Assets.natureDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light ? Assets.nutritionIcon : Assets.nutritionDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Lifestyle'),
                    onTap2: () async => await ctl.loadCategoryData('Nature'),
                    onTap3: () async => await ctl.loadCategoryData('Nutrition'),
                  ),
                  AppSizing.h18,
          // Personalities, Places, Politics
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Personalities', name2: 'Places', name3: 'Politics',
                    svgIcon1: Get.theme.brightness == Brightness.light ? Assets.personalitiesIcon : Assets.personalitiesDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light ? Assets.geographyIcon : Assets.geographyDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light ? Assets.politicsIcon : Assets.politicsDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Personalities'),
                    onTap2: () async => await ctl.loadCategoryData('Places'),
                    onTap3: () async => await ctl.loadCategoryData('Politics'),
                  ),
                  AppSizing.h18,
          // Science, Socials, Spark
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Science', name2: 'Socials', name3: 'Spark',
                    svgIcon1: Get.theme.brightness == Brightness.light ? Assets.scienceTechIcon : Assets.scienceTechDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light ? Assets.socialIcon : Assets.socialDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light ? Assets.sparkIcon : Assets.sparkDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Science'),
                    onTap2: () async => await ctl.loadCategoryData('Socials'),
                    onTap3: () async => await ctl.loadCategoryData('Spark'),
                  ),
                  AppSizing.h18,
          // Specials, Sports
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Specials', name2: 'Sports', name3: '',
                    svgIcon1: Get.theme.brightness == Brightness.light ? Assets.specialsIcon : Assets.specialsDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light ? Assets.sportsIcon : Assets.sportsDarkIcon,
                    svgIcon3: Assets.sportsDarkIcon,
                    showThirdCategory: false,
                    onTap1: () async => await ctl.loadCategoryData('Specials'),
                    onTap2: () async => await ctl.loadCategoryData('Sports'),
                    onTap3: ()=>{},
                  ),

                ],
              ),
            ),
          ),

          GetX<ArticleListPageController>(
            builder: (controller) {
              if (controller.isLoading.value == true) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: LoadingAnimationWidget.threeArchedCircle(color: AppColor.appColor, size: 50),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

