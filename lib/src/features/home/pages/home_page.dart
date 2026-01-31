import '../../../core/core.dart';
import '../../../utils/custom_point_shimmer.dart';
import '../../../core/models/quiz/gamemode_model.dart';

// ignore_for_file: deprecated_member_use

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> rootScaffoldKey;

  const HomePage({super.key, required this.rootScaffoldKey});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final profilePageController = Get.put(ProfilePageController());

    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.white
          : AppColor.darkAppNavBar,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          margin: const EdgeInsets.only(left: 18),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.grey200, width: 0.5),
              color: Colors.transparent),
          child: GestureDetector(
            onTap: () => rootScaffoldKey.currentState?.openDrawer(),
            child: ClipOval(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: (screenWidth * (0.15)) / 2.2,
                child: SvgPicture.asset(
                  Get.theme.brightness == Brightness.light
                      ? Assets.assetsMoreIcon
                      : Assets.assetsMoreDarkIcon,
                  width: 30,
                ),
              ),
            ),
          ),
        ),
        toolbarHeight: screenWidth > 800 ? 90 : 70,
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppNavBar,
        title: const HomeAvatar(
          avatarSize: 0.11,
        ),
      ),
      body: SingleChildScrollView(
          child: buildHomePageUI(screenWidth, screenHeight, context)),
    );
  }

  Container buildHomePageUI(
      double screenWidth, double screenHeight, BuildContext context) {
    if (UserData.token == null) {
      // Redirect to login page if the token is null
      Future.microtask(() {
        Get.offAll(() => const Login());
      });
      return Container();
    } else {
      return Container(
          width: screenWidth,
          padding: screenWidth < 800
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 40),
          child: GetX<ProfilePageController>(
            builder: (controller) {
              var bestGameScore =
                  controller.userData.value?.bestGame?.score ?? 0;
              var sapphireGameScore =
                  controller.userData.value?.sapphireGame?.score ?? 0;
              var rubyGameScore =
                  controller.userData.value?.rubyGame?.score ?? 0;
              var diamondGameScore =
                  controller.userData.value?.diamondGame?.score ?? 0;

              OneSignal.User.addTagWithKey("highscore", bestGameScore);
              OneSignal.User.addTagWithKey(
                  "username", controller.userData.value?.username);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///dropdown box
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ///game mode title
                            Text(
                              'Quiz Mode',
                              style: AppTextStyle.bodyMedium(context).copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),

                            ///game mode drop down button
                            const SizedBox(height: 6),
                            Obx(() {
                              return Container(
                                width: 150,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF73C8F4),
                                      Color(0xFF3A7BD5)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<Gem>(
                                    isExpanded: true,
                                    dropdownColor: Colors.white,
                                    value: controller.selectedGem.value,
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Colors.white),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    onChanged: (Gem? newGem) {
                                      if (newGem != null) {
                                        controller.setSelectedGem(newGem);
                                        // Force a refresh of the UI to update the displayed points
                                        controller
                                            .update(); // or equivalent based on your state management
                                      }
                                    },
                                    selectedItemBuilder: (context) {
                                      return controller.gems.map((gem) {
                                        return Row(
                                          children: [
                                            Image.asset(gem.imagePath,
                                                width: 20, height: 20),
                                            const SizedBox(width: 8),
                                            Text(
                                              gem.name,
                                              style: const TextStyle(
                                                color: AppColor.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList();
                                    },
                                    items: controller.gems.map((gem) {
                                      return DropdownMenuItem<Gem>(
                                        value: gem,
                                        child: Row(
                                          children: [
                                            Image.asset(gem.imagePath,
                                                width: 20, height: 20),
                                            const SizedBox(width: 8),
                                            Text(gem.name,
                                                style: const TextStyle(
                                                  color: AppColor.appBlack,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // display for the user points, sillver and position
                  Obx(() {
                    return controller.isLoading.value
                        ? PointsFadeShimmer(screenHeight: screenHeight)
                        : Container(
                            height: screenWidth * 0.479,
                            width: screenWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: const Alignment(0, 0),
                                    child: InfoCard().infoCard(context)),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.08,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          //the new UI that includes the points the user was able to get form the game they just played
                                          // Points column with the new implementation

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Points',
                                                style: AppTextStyle
                                                        .bodySmallHeavy(context)
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: AppColor.white),
                                              ),
                                              Text(
                                                controller.selectedGem.value
                                                            .name ==
                                                        'Emerald'
                                                    ? bestGameScore
                                                        .toStringAsFixed(0)
                                                    : controller.selectedGem
                                                                .value.name ==
                                                            'Launchpad'
                                                        ? diamondGameScore
                                                            .toStringAsFixed(0)
                                                        : controller
                                                                    .selectedGem
                                                                    .value
                                                                    .name ==
                                                                'Ruby'
                                                            ? rubyGameScore
                                                                .toStringAsFixed(
                                                                    0)
                                                            : sapphireGameScore
                                                                .toStringAsFixed(
                                                                    0),
                                                style: AppTextStyle
                                                        .bodySmallHeavy(context)
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColor.white,
                                                        fontSize: 18),
                                              ),
                                            ],
                                          ),

                                          ColumnDivider(
                                              screenHeight: screenHeight,
                                              color: AppColor.white),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Sillver',
                                                  style: AppTextStyle
                                                          .bodySmallHeavy(
                                                              context)
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              AppColor.white)),
                                              Text(
                                                controller
                                                        .userData.value?.points
                                                        .toString() ??
                                                    '--',
                                                style: AppTextStyle
                                                        .bodySmallHeavy(context)
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColor.white,
                                                        fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          ColumnDivider(
                                              screenHeight: screenHeight,
                                              color: AppColor.white),
                                          // position
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Position',
                                                style: AppTextStyle
                                                        .bodySmallHeavy(context)
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14,
                                                        color: AppColor.white),
                                              ),
                                              Text(
                                                UserData.position == -1 ||
                                                        UserData.position ==
                                                            0 ||
                                                        UserData.position ==
                                                            null
                                                    ? '--'
                                                    : UserData.position
                                                        .toString(),
                                                style: AppTextStyle
                                                        .bodySmallHeavy(context)
                                                    .copyWith(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColor.white),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                  }),

                  ///winner image illustration
                  SvgPicture.asset(
                    Theme.of(context).brightness == Brightness.light
                        ? 'Home Illustration'.lsvg
                        : 'Home Ilustration Dark'.lsvg,
                    width: screenWidth > 800 ? 350 : 200,
                  ),
                  AppSizing.h08,

                  ///quiz guidelines text
                  Text(
                    'Quiz Guidelines',
                    style: AppTextStyle.bodyMedium(context)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  AppSizing.h04,

                  ///quiz gideline inforamtion on marks allocations
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• Every correct answer attracts 5 marks.',
                        style: AppTextStyle.bodySmallLight(context),
                      ),
                      AppSizing.h04,
                      Text(
                        '• Every wrong answer attracts -1 mark.',
                        style: AppTextStyle.bodySmallLight(context),
                      ),
                      AppSizing.h04,
                      controller.selectedGem.value.name == 'Emerald'
                          ? Text(
                              '• This quiz mode costs 3 sillver.',
                              style: AppTextStyle.bodySmallLight(context),
                            )
                          : controller.selectedGem.value.name == 'Diamond'
                              ? Text(
                                  '• This quiz mode costs 5 sillver.',
                                  style: AppTextStyle.bodySmallLight(context),
                                )
                              : controller.selectedGem.value.name == 'Ruby'
                                  ? Text(
                                      '• This quiz mode costs 4 sillver.',
                                      style:
                                          AppTextStyle.bodySmallLight(context),
                                    )
                                  : Text(
                                      '• This quiz mode costs 2 sillver.',
                                      style:
                                          AppTextStyle.bodySmallLight(context),
                                    ),
                    ],
                  ),
                  AppSizing.h24,

                  ///let's do it button
                  ButtonWidget(
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColor.appColor),
                      borderSideColor: Colors.transparent,
                      textColor: AppColor.white,
                      onPressed: () {
                        if ((controller.userData.value?.points ?? 0) > 0) {
                          Get.offAll(() => const QuizQuestionsPage());
                        } else {
                          Get.dialog(
                            Dialog(
                              backgroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              clipBehavior: Clip.none,
                              insetPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: PopScope(
                                canPop: false,
                                child: AppDialog(
                                  msg: 'Sorry 😢, you are out of Silver',
                                  buttonText: 'Top up',
                                  // height: 231,
                                  onTap: () {
                                    Get.to(() => const TopUpPage());
                                  },
                                  isCancelButton: true,
                                ),
                              ),
                            ),
                            barrierDismissible: true,
                          );
                        }
                      },
                      buttonText: 'Let\'s do this!',
                      fontSize: 17),
                ],
              );
            },
          ));
    }
  }
}
