import 'package:intellyjent/src/core/core.dart';

class TellyBucksDashboardPage extends StatefulWidget {
  const TellyBucksDashboardPage({super.key});

  @override
  State<TellyBucksDashboardPage> createState() =>
      _TellyBucksDashboardPageState();
}

class _TellyBucksDashboardPageState extends State<TellyBucksDashboardPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final cont = Get.put(TellybucksDashboardPageController());
    final controller = Get.find<ProfilePageController>();

    void showAvatarDialog(ProfilePageController controller) {
      Get.dialog(
        Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          clipBehavior: Clip.none,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          child: PopScope(
              canPop: true, child: AvatarOptionsDialog(controller: controller)),
        ),
        useSafeArea: true,
        barrierDismissible: true,
      );
    }
print(Get.width);
    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppBg,
      appBar: AppBar(
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.whiteOff
            : AppColor.darkAppBg,
        toolbarHeight: 110,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: screenWidth < 370
                  ? const EdgeInsets.symmetric(vertical: 22)
                  : screenWidth < 650
                      ? const EdgeInsets.symmetric(vertical: 40)
                      : screenWidth < 800
                          ? const EdgeInsets.symmetric(vertical: 42)
                          : const EdgeInsets.symmetric(vertical: 42),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft,
                width: screenWidth < 800 ? null : 50,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColor.grey200
                    : AppColor.grey400,
              ),
            )),
        title: UserAvatar(
          screenWidth: screenWidth,
          avatarSize: screenHeight < 670 ? 0.13 : 0.15,
          fullName: controller.userData.value?.fullName ?? "",
          controller: controller,
          onTap: () => showAvatarDialog(controller),
        ),
        titleSpacing: 1,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: MediaQuery.of(context).size.width < 800
                ? const EdgeInsets.symmetric(horizontal: 20)
                : const EdgeInsets.symmetric(horizontal: 40),
            child: LayoutBuilder(
                builder: ((context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: GetX<TellybucksDashboardPageController>(
                              builder: (ctl) {
                            return Column(
                              children: [
                                AppSizing.h20,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // balance
                                    Container(
                                      width: screenWidth,
                                      padding: const EdgeInsets.all(24),
                                      height: screenHeight * 0.2,
                                      decoration: BoxDecoration(
                                        color: Get.theme.brightness ==
                                                Brightness.light
                                            ? const Color(0xFF4169e1)
                                            : AppColor.darkContainer,
                                        borderRadius: BorderRadius.circular(15),
                                        image: Get.theme.brightness ==
                                                Brightness.light
                                            ? DecorationImage(
                                                image: AssetImage(
                                                    Assets.assetsBlueStripes),
                                                repeat: ImageRepeat.repeat)
                                            : null,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Your balance',
                                                style: AppTextStyle
                                                        .bodySmallLight(context)
                                                    .copyWith(
                                                        color: AppColor.white),
                                              ),
                                              AppSizing.w12,
                                              GestureDetector(
                                                onTap: () {
                                                  cont.hideAccountBalance
                                                          .value =
                                                      !cont.hideAccountBalance
                                                          .value;
                                                },
                                                child: Obx(
                                                  () => SvgPicture.asset(
                                                    cont.hideAccountBalance
                                                            .isFalse
                                                        ? Assets.eyeTellybucks
                                                        : Assets
                                                            .assetsClosedEye,
                                                    width: 18,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Obx(
                                                () => Text(
                                                  cont.hideAccountBalance
                                                          .isFalse
                                                      ? '₦${ctl.formattedAmount.value}'
                                                      : '**********',
                                                  style: AppTextStyle.h5(
                                                          context)
                                                      .copyWith(
                                                          color: AppColor.white,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w100),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  await ctl
                                                      .geAffiliateInfo(false);

                                                  bool pinExists = await ctl
                                                      .checkTellybucksPin();
                                                  if (!pinExists) {
                                                    return;
                                                  }

                                                  if (cont.affiliateInfo.value?.accountNumber != null) {
                                                    ctl.resetBankControllers();
                                                    Get.bottomSheet(
                                                      WithdrawBottomSheet(
                                                        cont: ctl,
                                                      ),
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                    );
                                                  } else {
                                                    ctl.resetBankControllers();
                                                    Get.bottomSheet(
                                                      SaveEditBankBottomSheet(
                                                        cont: ctl,
                                                      ),
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                    padding: const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 14),
                                                    decoration: BoxDecoration(
                                                        color: Get.theme.brightness ==
                                                                Brightness.light
                                                            ? AppColor.white
                                                            : AppColor.darkAppNavBarIcons
                                                                .withOpacity(
                                                                    0.7),
                                                        borderRadius: BorderRadius.circular(
                                                            7)),
                                                    child: Text('Withdraw',
                                                        style: AppTextStyle.bodySmallHeavy(context).copyWith(
                                                            color: Get.theme.brightness == Brightness.light
                                                                ? AppColor.appColor
                                                                : AppColor.lightBlue,
                                                            fontWeight: FontWeight.bold))),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    AppSizing.h24,
                                    // total signups
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildContainer(
                                          context: context,
                                          labelText: 'Total Sign-ups',
                                          valueText: ctl.affiliateInfo.value
                                                  ?.totalSignups
                                                  .toString() ??
                                              '0',
                                          assetPath: Assets.groupPeopleIcon,
                                        ),
                                        // weekly signups
                                        buildContainer(
                                          context: context,
                                          labelText: 'Weekly Sign-ups',
                                          valueText: ctl.affiliateInfo.value
                                                  ?.signupsByDate.weeklySignups
                                                  .toString() ??
                                              '0',
                                          assetPath: Assets.peoplePlusIcon,
                                        ),
                                      ],
                                    ),
                                    AppSizing.h24,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buildContainer(
                                          context: context,
                                          labelText: 'Monthly Sign-ups',
                                          valueText: ctl.affiliateInfo.value
                                                  ?.signupsByDate.monthlySignups
                                                  .toString() ??
                                              '0',
                                          assetPath: Assets.twoPeoplePlusIcon,
                                        ),
                                        buildContainer(
                                          context: context,
                                          labelText: 'Yearly Sign-ups',
                                          valueText: ctl.affiliateInfo.value
                                                  ?.signupsByDate.yearlySignups
                                                  .toString() ??
                                              '0',
                                          assetPath: Assets.twoPeopleIcon,
                                        ),
                                      ],
                                    ),
                                    AppSizing.h24,
                                    // total commissions
                                    buildCommissionCard(
                                      context: context,
                                      bgColor: Get.theme.brightness ==
                                              Brightness.light
                                          ? AppColor.lightBlue.withOpacity(0.3)
                                          : AppColor.green.withOpacity(0.2),
                                      titleText: 'Total Commission',
                                      valueText: (ctl
                                          .affiliateInfo
                                          .value
                                          ?.commission ??
                                          0.0)
                                          .toStringAsFixed(
                                        ctl
                                            .affiliateInfo
                                            .value
                                            ?.commission !=
                                            null &&
                                            ctl
                                                .affiliateInfo
                                                .value!
                                                .totalCommissionEarned %
                                                1 !=
                                                0
                                            ? 2
                                            : 0,
                                      ),
                                    ),
                                    AppSizing.h24,
                                    buildCommissionCard(
                                        context: context,
                                        bgColor: Get.theme.brightness ==
                                                Brightness.light
                                            ? AppColor.lighterPink
                                                .withOpacity(0.8)
                                            : AppColor.orange.withOpacity(0.3),
                                        titleText:
                                            'Commission Earned This Week',
                                        valueText: (ctl
                                                    .affiliateInfo
                                                    .value
                                                    ?.commissionByDate
                                                    .weeklyCommission ??
                                                0.0)
                                            .toStringAsFixed(
                                          ctl
                                                          .affiliateInfo
                                                          .value
                                                          ?.commissionByDate
                                                          .weeklyCommission !=
                                                      null &&
                                                  ctl
                                                              .affiliateInfo
                                                              .value!
                                                              .commissionByDate
                                                              .weeklyCommission %
                                                          1 !=
                                                      0
                                              ? 2
                                              : 0,
                                        )),
                                    AppSizing.h24,
                                    // commission this month
                                    buildCommissionCard(
                                      context: context,
                                      bgColor: Get.theme.brightness ==
                                              Brightness.light
                                          ? AppColor.grey.withOpacity(0.5)
                                          : AppColor.darkAppNavBarIcons
                                              .withOpacity(0.3),
                                      titleText:
                                          'Total Commission For The Month',
                                      valueText: (ctl
                                          .affiliateInfo
                                          .value
                                          ?.commissionByDate
                                          .monthlyCommission ??
                                          0.0)
                                          .toStringAsFixed(
                                        ctl
                                            .affiliateInfo
                                            .value
                                            ?.commissionByDate
                                            .monthlyCommission !=
                                            null &&
                                            ctl
                                                .affiliateInfo
                                                .value!
                                                .commissionByDate
                                                .monthlyCommission %
                                                1 !=
                                                0
                                            ? 2
                                            : 0,
                                      ),
                                    ),
                                    AppSizing.h24,
                                    // commission this year
                                    buildCommissionCard(
                                      context: context,
                                      bgColor: Get.theme.brightness ==
                                              Brightness.light
                                          ? AppColor.grey.withOpacity(0.5)
                                          : AppColor.darkAppNavBarIcons
                                              .withOpacity(0.3),
                                      titleText:
                                          'Total Commission For The Year',
                                      valueText: (ctl
                                          .affiliateInfo
                                          .value
                                          ?.commissionByDate
                                          .yearlyCommission ??
                                          0.0)
                                          .toStringAsFixed(
                                        ctl
                                            .affiliateInfo
                                            .value
                                            ?.commissionByDate
                                            .yearlyCommission !=
                                            null &&
                                            ctl
                                                .affiliateInfo
                                                .value!
                                                .commissionByDate
                                                .yearlyCommission %
                                                1 !=
                                                0
                                            ? 2
                                            : 0,
                                      ),
                                    ),
                                    AppSizing.h32,
                                  ],
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ))),
          ),
          GetX<TellybucksDashboardPageController>(
            builder: (controller) {
              if (controller.isLoading.value == true) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColor.appColor, size: 50),
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

  Container buildCommissionCard({
    required BuildContext context,
    required String titleText,
    required String valueText,
    required Color bgColor,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(18),
      height: screenHeight * 0.14,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText, // Dynamic title text
                style: AppTextStyle.bodySmallLight(context),
              ),
              Text(
                valueText, // Dynamic value text
                style: AppTextStyle.bodyMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            Get.theme.brightness == Brightness.light
                ? Assets.moneyBagIcon
                : Assets.moneyBagDarkIcon,
            width: 68,
          ),
        ],
      ),
    );
  }

  Container buildContainer({
    required BuildContext context,
    required String labelText,
    required String valueText,
    required String assetPath,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.42,
      padding: const EdgeInsets.all(4),
      height: screenHeight * 0.14,
      decoration: BoxDecoration(
        color: Get.theme.brightness == Brightness.light
            ? AppColor.lightLightBlue
            : AppColor.darkAppNavBarIcons.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Get.theme.brightness == Brightness.light
                  ? AppColor.whiteOff
                  : AppColor.darkContainer,
            ),
            child: SvgPicture.asset(
              assetPath,
              color: AppColor.appColor,
              width: 28,
            ),
          ),
          AppSizing.w04,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  labelText, // Dynamic label text
                  style: AppTextStyle.bodyVerySmall(context),
                ),
                AppSizing.h04,
                Text(
                  valueText, // Dynamic value text
                  style: AppTextStyle.bodySmallHeavy(context)
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
