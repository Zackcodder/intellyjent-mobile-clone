import '../../../core/core.dart';

class PremiumCategoryListPage extends StatelessWidget {
  const PremiumCategoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    final ctl = Get.put(PremiumListPageController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
        centerTitle: true,
        title: Text("Premium+",
            style: screenWidth < 850
                ? AppTextStyle.h5(context).copyWith(fontWeight: FontWeight.w800)
                : AppTextStyle.h4(context)
                    .copyWith(fontWeight: FontWeight.w500)),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: screenHeight < 640
                  ? const EdgeInsets.symmetric(vertical: 30)
                  : screenWidth < 800
                  ? const EdgeInsets.symmetric(vertical: 32)
                  : const EdgeInsets.symmetric(vertical: 25),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft,
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.grey200
                    : AppColor.white,
              ),
            )),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: screenWidth,
              padding: MediaQuery.of(context).size.width < 800
                  ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                  : const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Alphabetical Order with All Categories
                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Career+',
                    name2: 'Chronic Disease Management',
                    name3: 'Entertainment+',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.careersIcon
                        : Assets.careersDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.chronicDiseaseManagementIcon
                        : Assets.chronicDiseaseManagementDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.entertainmentIcon
                        : Assets.entertainmentDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Career+'),
                    onTap2: () async => await ctl.loadCategoryData('Chronic Disease Management'),
                    onTap3: () async => await ctl.loadCategoryData('Entertainment+'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Finance+',
                    name2: 'General Health',
                    name3: 'Gist+',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.financeIcon
                        : Assets.financeDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.generalHealthIcon
                        : Assets.generalHealthDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.gistIcon
                        : Assets.gistDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Finance+'),
                    onTap2: () async => await ctl.loadCategoryData('General Health'),
                    onTap3: () async => await ctl.loadCategoryData('Gist+'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Global Matters+',
                    name2: 'Grammar+',
                    name3: 'Health+',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.globalMattersIcon
                        : Assets.globalMattersDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.grammarIcon
                        : Assets.grammarDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.healthIcon
                        : Assets.healthDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Global Matters+'),
                    onTap2: () async => await ctl.loadCategoryData('Grammar+'),
                    onTap3: () async => await ctl.loadCategoryData('Health+'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'History+',
                    name2: 'Leadership 101+',
                    name3: 'Lifestyle+',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.historyIcon
                        : Assets.historyDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.leadership101Icon
                        : Assets.leadership101DarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.lifestyleIcon
                        : Assets.lifestyleDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('History+'),
                    onTap2: () async => await ctl.loadCategoryData('Leadership 101+'),
                    onTap3: () async => await ctl.loadCategoryData('Lifestyle+'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Luxury',
                    name2: 'Men’s Health',
                    name3: 'Mental Health',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.luxuryIcon
                        : Assets.luxuryDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.mensHealthIcon
                        : Assets.mensHealthDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.mentalHealthIcon
                        : Assets.mentalHealthDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Luxury'),
                    onTap2: () async => await ctl.loadCategoryData('Men’s Health'),
                    onTap3: () async => await ctl.loadCategoryData('Mental Health'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Nature+',
                    name2: 'Nutrition+',
                    name3: 'Parenting',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.natureIcon
                        : Assets.natureDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.nutritionIcon
                        : Assets.nutritionDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.parentingIcon
                        : Assets.parentingDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Nature+'),
                    onTap2: () async => await ctl.loadCategoryData('Nutrition+'),
                    onTap3: () async => await ctl.loadCategoryData('Parenting'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Personalities+',
                    name2: 'Places+',
                    name3: 'Politics+',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.personalitiesIcon
                        : Assets.personalitiesDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.geographyIcon
                        : Assets.geographyDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.politicsIcon
                        : Assets.politicsDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Personalities+'),
                    onTap2: () async => await ctl.loadCategoryData('Places+'),
                    onTap3: () async => await ctl.loadCategoryData('Politics+'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Preventive Health Care',
                    name2: 'Relationship',
                    name3: 'Science+',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.preventiveHealthCareIcon
                        : Assets.preventiveHealthCareDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.relationshipIcon
                        : Assets.relationshipDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.scienceTechIcon
                        : Assets.scienceTechDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Preventive Health Care'),
                    onTap2: () async => await ctl.loadCategoryData('Relationship'),
                    onTap3: () async => await ctl.loadCategoryData('Science+'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Sleep Health',
                    name2: 'Socials+',
                    name3: 'Spark+',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.sleepHealthIcon
                        : Assets.sleepHealthDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.socialIcon
                        : Assets.socialDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.sparkIcon
                        : Assets.sparkDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Sleep Health'),
                    onTap2: () async => await ctl.loadCategoryData('Socials+'),
                    onTap3: () async => await ctl.loadCategoryData('Spark+'),
                  ),
                  AppSizing.h18,

                  CategoryRows(
                    screenWidth: screenWidth,
                    name1: 'Specials+',
                    name2: 'Sports+',
                    name3: 'Women’s Health',
                    svgIcon1: Get.theme.brightness == Brightness.light
                        ? Assets.specialsIcon
                        : Assets.specialsDarkIcon,
                    svgIcon2: Get.theme.brightness == Brightness.light
                        ? Assets.sportsIcon
                        : Assets.sportsDarkIcon,
                    svgIcon3: Get.theme.brightness == Brightness.light
                        ? Assets.womensHealthIcon
                        : Assets.womensHealthDarkIcon,
                    onTap1: () async => await ctl.loadCategoryData('Specials+'),
                    onTap2: () async => await ctl.loadCategoryData('Sports+'),
                    onTap3: () async => await ctl.loadCategoryData('Women’s Health'),
                  ),
                  AppSizing.h28,

                ],
              ),
            ),
          ),
          GetX<PremiumListPageController>(
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
