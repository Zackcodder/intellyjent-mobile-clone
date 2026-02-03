import 'dart:math';
import 'package:intellyjent/src/utils/refresh_indicator.dart';

import '../../../core/core.dart';

class LeaderboardPage extends StatelessWidget {
  final bool? showBackButton;

  const LeaderboardPage({super.key, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    final cnt = Get.put(ProfilePageController());
    final controller = Get.put(LeaderBoardController());
    print('top leadership page ${controller.dataLastWeek}');
    print('all leadership page ${controller.data}');

    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HeaderWidget(
          title: 'Leaderboard',
          showBackButton: showBackButton!,
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppBg,
      ),
      body: RefreshIndicator(
        onRefresh: () async => await controller.refreshData(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PullToRefreshBanner(),
              Obx(() => controller.dataLastWeek.value.isEmpty
                  ? const Offstage()
                  : Padding(
                      padding: MediaQuery.of(context).size.width < 800
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          ///top 3 winner last month
                          InkWell(
                            onTap: () async {
                              await controller.getLeaderBoardData();
                            },
                            child: Text(
                              'Last ${cnt.selectedGem.value.name == 'Emerald' ? "Month’s" : cnt.selectedGem.value.name == 'Launchpad' ? "Year’s" : cnt.selectedGem.value.name == 'Ruby' ? "Quarter’s " : "Week’s"} Champions',
                              style: AppTextStyle.h4Regular(context),
                            ),
                          ),
                          AppSizing.h48,

                          Obx(() {
                            String leaderboardTitle =
                                cnt.selectedGem.value.name;
                            String iconPath = cnt.selectedGem.value.imagePath;

                            return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(iconPath),
                                  const SizedBox(width: 8),
                                  Text(leaderboardTitle,
                                      style: AppTextStyle.h4Regular(context)
                                          .copyWith(fontSize: 16)),
                                ]);
                          }),
                          AppSizing.h48,
                          TopThreeWidget(
                            topThree:
                                controller.dataLastWeek.value.take(3).toList(),
                          ),
                          AppSizing.h28,
                        ],
                      ),
                    )),
              const Divider(
                color: AppColor.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    AppSizing.h28,
                    Text(
                      'This ${cnt.selectedGem.value.name == 'Emerald' ? "Month’s" : cnt.selectedGem.value.name == 'Launchpad' ? "Year’s" : cnt.selectedGem.value.name == 'Ruby' ? "Quarter’s " : "Week’s"} Leaderboard',
                      style: AppTextStyle.h4Regular(context)
                          .copyWith(fontSize: 18),
                    ),
                    AppSizing.h08,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Earn as much points in the quiz and rise to the top of this ${cnt.selectedGem.value.name == 'Emerald' ? "month’s" : cnt.selectedGem.value.name == 'Launchpad' ? "year’s" : cnt.selectedGem.value.name == 'Ruby' ? "quarter’s " : "week’s"} leaderboard ',
                        style: AppTextStyle.bodyMedium(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Obx(() {
                      if (controller.pageController.value == null ||
                          controller.data.value.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 80),
                          child: Text(
                            "Leaderboard is Empty",
                            style: AppTextStyle.h3(context)
                                .copyWith(color: AppColor.grey200),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      String leaderboardTitle = cnt.selectedGem.value.name;
                      String iconPath = cnt.selectedGem.value.imagePath;

                      return Column(
                        children: [
                          AppSizing.h56,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(iconPath),
                                const SizedBox(width: 8),
                                Text(leaderboardTitle,
                                    style: AppTextStyle.h4Regular(context)
                                        .copyWith(fontSize: 16)),
                              ]),
                          const SizedBox(
                            height: 8,
                          ),
                          _buildLeaderBoard(context),
                          //nav
                          AppSizing.h32,
                          _buildPaginator(controller, context),
                          AppSizing.h42,
                        ],
                      );
                    }),
                    GetX<ProfilePageController>(builder: (ctl) {
                      var bestGameScore =
                          ctl.userData.value?.bestGame?.score ?? 0;
                      int userPosition =
                          controller.getPositionByUsername(UserData.username!);
                      if (userPosition == -1) {
                        UserData.position = 0;
                      } else {
                        UserData.position = userPosition;
                      }

                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColor.lightYellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            UserAvatar2(
                              screenWidth: screenWidth,
                              fullName: ctl.userData.value?.fullName ?? "",
                              controller: ctl,
                              avatarSize: 0.18,
                            ),
                            // you
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You',
                                  style: AppTextStyle.bodyMedium(context)
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.appBlack),
                                ),
                                ctl.userData.value?.country == null
                                    ? const Offstage()
                                    : Text(
                                        CountryFlagBuilder.getCountryFlag(
                                            ctl.userData.value?.country ?? ""),
                                        style: AppTextStyle.bodyMedium(context)
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.white),
                                      ),
                              ],
                            ),
                            //points
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Points',
                                  style: AppTextStyle.bodyVerySmall(context)
                                      .copyWith(color: AppColor.appBlack),
                                ),
                                Text(
                                  bestGameScore.toStringAsFixed(0),
                                  style: AppTextStyle.bodySmallHeavy(context)
                                      .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.appBlack),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Position',
                                  style: AppTextStyle.bodyVerySmall(context)
                                      .copyWith(color: AppColor.appBlack),
                                ),
                                Text(
                                  userPosition != -1
                                      ? userPosition.toString()
                                      : '--',
                                  style: AppTextStyle.bodySmallHeavy(context)
                                      .copyWith(
                                          color: AppColor.appBlack,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            AppSizing.w04,
                          ],
                        ),
                      );
                    }),
                    AppSizing.h42,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildPaginator(
          LeaderBoardController controller, BuildContext context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent),
            child: InkWell(
                onTap: () {
                  controller.onPageChange(ControllerAction.prev);
                },
                child: SvgPicture.asset(
                  Assets.assetsArrowLeft,
                  width: MediaQuery.of(context).size.width < 800 ? 20 : 30,
                  color: controller.pageController.value!.hasPrev
                      ? null
                      : Get.theme.brightness == Brightness.dark
                          ? AppColor.grey200
                          : AppColor.grey400,
                )),
          ),
          // SvgPicture.asset(
          //   Assets.assetsArrowLeft,
          // colorFilter: const ColorFilter.mode(
          //   AppColor.grey200,
          //   BlendMode.srcIn,
          // ),
          // ),
          Wrap(
              spacing: ((MediaQuery.of(context).size.width /
                          controller.pageController.value!.totalPage) -
                      50)
                  .clamp(10, 30),
              children: List.generate(
                controller.pageController.value!.totalPage,
                (index) => Container(
                  height: MediaQuery.of(context).size.width < 800 ? 25 : 35,
                  width: MediaQuery.of(context).size.width < 800 ? 15 : 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.pageController.value!.currentPage ==
                              index + 1
                          ? AppColor.lighterBlue
                          : Colors.transparent),
                  child: Text(
                    (index + 1).toString(),
                    style: AppTextStyle.bodyVerySmall(context).copyWith(
                        color: controller.pageController.value!.currentPage ==
                                index + 1
                            ? AppColor.appBlack
                            : AppColor.grey200),
                  ),
                ),
              )),
          Theme(
            data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent),
            child: InkWell(
                onTap: () {
                  controller.onPageChange(ControllerAction.next);
                },
                child: Transform.rotate(
                    angle: -(pi / 2),
                    child: SvgPicture.asset(
                      Assets.assetsArrowDown,
                      width: MediaQuery.of(context).size.width < 800 ? 20 : 30,
                      color: controller.pageController.value!.hasNext
                          ? null
                          : Get.theme.brightness == Brightness.dark
                              ? AppColor.grey200
                              : AppColor.grey400,
                    ))),
          )
        ],
      );

  Widget _buildPlaceholder(
      BuildContext context, List<String> userSpitedName, double fontSize) {
    return Text(
      userSpitedName.length > 1
          ? (userSpitedName.first[0] + userSpitedName.last[0]).toUpperCase()
          : userSpitedName.isEmpty || userSpitedName.first.length < 2
              ? "--"
              : userSpitedName.first.replaceRange(2, null, "").toUpperCase(),
      style: AppTextStyle.h4(context).copyWith(
        color: AppColor.white,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildLeaderBoard(BuildContext context) {
    final LeaderBoardController controller = Get.find();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: controller.pageObject.value?.length ?? 0,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          LeaderboardItem item = controller.pageObject.value!.elementAt(index);

          int pos = (controller.pageController.value!.currentPage - 1) *
                  controller.pageController.value!.perPage +
              index +
              1;

          Color randomColor = Color((Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0);

          List<String> userSpitedName = item.fullname.split(" ");

          return Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                color:
                    index % 2 != 0 ? AppColor.lighterBlue : AppColor.lightPink,
                borderRadius: BorderRadius.circular(4),
                border: Border(
                  left: BorderSide(
                      width: 5,
                      color: index <= 3 &&
                              controller.pageController.value!.currentPage ==
                                  controller.pageController.value!.initialPage
                          ? AppColor.appColor
                          : Colors.transparent),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // left
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NumberingWidget(index: pos.toString()),
                    AppSizing.w12,
                    // avatar
                    ClipOval(
                      child: CircleAvatar(
                        radius: screenWidth < 800 ? 15 : 35,
                        backgroundColor: randomColor,
                        child: item.user_profile_image != null &&
                                item.user_profile_image!.endsWith('.svg')
                            ? SvgPicture.network(
                                item.user_profile_image!,
                                placeholderBuilder: (context) =>
                                    _buildPlaceholder(
                                  context,
                                  item.fullname.split(" "),
                                  10,
                                ),
                              )
                            : item.user_profile_image != null
                                ? ClipOval(
                                    child: CachedNetworkImage(
                                        imageUrl: '${item.user_profile_image}',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: item.user_profile_image ==
                                                                null ||
                                                            item.user_profile_image ==
                                                                ''
                                                        ? randomColor
                                                        : null,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )),
                                  )
                                : Text(
                                    userSpitedName.length > 1
                                        ? (userSpitedName.first[0] +
                                                userSpitedName.last[0])
                                            .toUpperCase()
                                        : userSpitedName.first.length > 2
                                            ? userSpitedName.first
                                                .replaceRange(2, null, "")
                                                .toUpperCase()
                                            : userSpitedName.first
                                                .toUpperCase(),
                                    style: AppTextStyle.h5(context).copyWith(
                                        color: Colors.white,
                                        fontSize: screenWidth < 800 ? 16 : 25),
                                  ),
                      ),
                    ),
                    AppSizing.w12, // Add some spacing
                    // name nationality
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.fullname,
                          style: AppTextStyle.bodySmallHeavy(context)
                              .copyWith(color: AppColor.appBlack),
                        ),
                        Row(
                          children: [
                            Text(
                              CountryFlagBuilder.getCountryFlag(item.country!),
                              style: AppTextStyle.bodyMedium(context).copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColor.appBlack
                                      : AppColor.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            AppSizing.w04,
                            Text(
                              CountryFlagBuilder.getCountrySlug(item.country!),
                              style: AppTextStyle.bodyMedium(context).copyWith(
                                  fontSize: 14,
                                  color: AppColor.appBlack,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //right
                Text(
                  "${item.score.toInt()} points",
                  style: AppTextStyle.bodySmallHeavy(context)
                      .copyWith(color: AppColor.appBlack),
                )
              ],
            ),
          );
        });
  }

  Color generateRandomColor() {
    // List of light colors
    List<Color> lightColors = [
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.teal,
      Colors.pink,
    ];

    // Generate a random index
    int randomIndex = Random().nextInt(lightColors.length);

    // Return the random color
    return lightColors[randomIndex];
  }
}
