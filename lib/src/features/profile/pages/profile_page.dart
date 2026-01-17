import 'package:intellyjent/src/features/profile/pages/privacy_policy_page.dart';

import '../../../core/core.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double maxExtent = 0.85;
  double minExtents = 0.73;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    ProfilePageController cont = Get.find();
    print(UserData.token);
    print(UserData.userId);
    // print(UserData.currentPassword);


    return Scaffold(
      backgroundColor: Get.theme.brightness == Brightness.light
          ? AppColor.appColor
          : AppColor.darkAppBg,
      body: Stack(
        children: [
          SafeArea(child: headerSection(context, screenWidth, screenHeight)),
          DraggableScrollableSheet(
              initialChildSize: 0.73,
              maxChildSize: 0.85,
              minChildSize: 0.73,
              snap: true,
              builder: ((context, scrollController) => Stack(
                          children: [
                            Container(
                              width: double.maxFinite,
                              padding: MediaQuery.of(context).size.width <800
                                  ? const EdgeInsets.symmetric(horizontal: 20, vertical: 41)
                                  : const EdgeInsets.symmetric(horizontal: 40, vertical: 51),
                              decoration: BoxDecoration(
                                  color: Get.theme.brightness == Brightness.light
                                      ? AppColor.white
                                      : AppColor.darkAppNavBar,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              child: mainContent(
                                  context, screenWidth, screenHeight, cont,scrollController),
                            ),
                            Transform.translate(
                                offset: Offset(0, -(screenWidth * 0.17)),
                                child: Obx(() =>GestureDetector(
                                  onTap: ()=>Get.to(()=> const EditProfileMain(),transition: Transition.rightToLeft),
                                  child: Stack(
                                  children: [
                                    UserAvatar2(
                                        screenWidth: screenWidth,
                                        fullName:
                                            cont.userData.value?.fullName ?? "", controller: cont,
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Transform.translate(
                                          offset: Offset(
                                              0,
                                              screenWidth < 800
                                                  ? (screenWidth * 0.27)-7
                                                  : (screenWidth * 0.19)-7
                                          ),
                                          child: SvgPicture.asset(
                                            Assets.assetsEdit,
                                            width: screenWidth < 800 ? null : 50,
                                          ),)
                                      )
                                  ],
                                ),
                                ))),
                          ],
                        ))
        
                      )
                      
        ],
      ),
    );
  }

  Widget mainContent(BuildContext context, double screenWidth,
      double screenHeight, ProfilePageController cont,ScrollController controller) {
    var bestGameScore = cont.userData.value?.bestGame?.score ?? 0;
    return Obx(() => SingleChildScrollView(
      controller: controller,
      clipBehavior: Clip.antiAlias,
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              AppSizing.h24,
              Text(
                cont.userData.value?.fullName ?? '--',
                softWrap: true,
                textAlign: TextAlign.center,
                style: AppTextStyle.h5(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cont.userData.value?.username ?? "--",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyMedium(context).copyWith(
                      fontSize: 18,
                    ),
                  ),
                  AppSizing.w08,
                  Text(
                    CountryFlagBuilder.getCountryFlag(
                        cont.userData.value?.country ?? "Nigeria"),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyMedium(context).copyWith(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              AppSizing.h12,
              Container(
                height: screenHeight * 0.15,
                decoration: BoxDecoration(
                  color: AppColor.lightYellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //points
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Points',
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              fontWeight: FontWeight.normal,
                              color: AppColor.appBlack),
                        ),
                        Text(
                          bestGameScore.toStringAsFixed(0),
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.appBlack,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    ColumnDivider(screenHeight: screenHeight),
                    // sillver
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sillver',
                            style: AppTextStyle.bodySmallHeavy(context)
                                .copyWith(
                                    color: AppColor.appBlack,
                                    fontWeight: FontWeight.normal)),
                        Text(
                          cont.userData.value?.points.toString() ?? '--',
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.appBlack,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    ColumnDivider(screenHeight: screenHeight),
                    // position
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Position',
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              color: AppColor.appBlack,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          UserData.position == -1 || UserData.position == 0 ||  UserData.position == null ?  '--' : UserData.position.toString(),
                          style: AppTextStyle.bodySmallHeavy(context).copyWith(
                              fontSize: 18,
                              color: AppColor.appBlack,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppSizing.h32,
              //top up
              SettingsButtonWidget(
                buttonText: 'Top-Up',
                suffixIcon: Assets.assetsMoneys,
                suffixIconColor: AppColor.appColor,
                onPressed: () => Get.to(() => const TopUpPage(
                      showBackButton: true,
                    ), transition: Transition.upToDown),
              ),
              SettingsButtonWidget(
                buttonText: 'Tellybucks',
                suffixIcon: Assets.assetsTabler,
                onPressed: () => Get.to(
                        () => const TellyBucks(),
                        transition: Transition.upToDown
                ),
              ),
              SettingsButtonWidget(
                buttonText: 'About',
                suffixIcon: Assets.assetsInfoCircle,
                onPressed: () => Get.to(() => const AboutPage(), transition: Transition.upToDown),
              ),
              SettingsButtonWidget(
                buttonText: 'Help & Support',
                suffixIcon: Assets.assets24Support,
                onPressed: () => Get.to(() => const HelpAndSupport(), transition: Transition.upToDown),
              ),
              SettingsButtonWidget(
                buttonText: 'Privacy Policy',
                suffixIcon: Assets.assetsLock,
                suffixIconColor: AppColor.appColor,
                onPressed: ()=> Get.to(()=> PrivacyPolicyPage(), transition: Transition.upToDown),
              ),
              Row(
                children: [
                  Text(
                    'Settings',
                    style: AppTextStyle.bodyMedium(context),
                  ),
                ],
              ),
              Obx(
                ()=> SettingsButtonWidget(
                  buttonText: 'Notifications',
                  suffixIcon: Assets.assetsNotification,
                  showSwitch: true,
                  switchValue: cont.allowNotifications.value,
                ),
              ),
              SettingsButtonWidget(
                buttonText: 'Dark Mode',
                suffixIcon: Assets.assetsMoon,
                onPressed: () {
                  _showDarkModeDialog(context);
                },
              ),
              SettingsButtonWidget(
                buttonText: 'Logout',
                suffixIcon: Assets.assetsLogout,
                onPressed: () {
                  Get.dialog(
                      Dialog(
                          backgroundColor: Colors.transparent,
                          surfaceTintColor: Colors.transparent,
                          clipBehavior: Clip.none,
                          insetPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          child: PopScope(
                              canPop: true,
                              child: AppDialog(
                                msg: 'Are you sure you want to logout?',
                                buttonText: 'Continue',
                                onTap: () {
                                  UserData.logout();
                                  SecureCache.removeFromCache(CacheKeys.tellybucksPin);
                                  cont.logout();
                                  Get.offAll(() => const Login());
                                },
                                isCancelButton: true,
                              ))),
                      barrierDismissible: true);
                },
              ),
              AppSizing.h40,
              InkWell(
                onTap: () => Get.to(() => const DeletePage(), transition: Transition.upToDown),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.assetsDelete,
                        height: screenWidth < 800 ? 24 : 35,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).brightness == Brightness.dark
                              ? AppColor.grey200
                              : AppColor.grey400,
                          BlendMode.srcIn,
                        )),
                    screenWidth < 800 ? AppSizing.w08 : AppSizing.w16,
                    Text(
                      'Delete Account',
                      style: AppTextStyle.bodyMedium(context).copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Container headerSection(
      BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight * 0.350,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.appColor
            : AppColor.darkAppBg,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // circles
          Positioned(
            top: -screenHeight * 0.05,
            right: -screenWidth * 0.12,
            child: Container(
              width: screenWidth < 800 ? 124 : 180,
              height: screenWidth < 800 ? 124 : 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.03,
            left: -screenWidth * 0.08,
            child: Container(
              width: screenWidth < 800 ? 114 : 174,
              height: screenWidth < 800 ? 114 : 174,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightBlue,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.03,
            left: screenWidth * 0.12,
            child: Container(
              width: screenWidth < 800 ? 27 : 87,
              height: screenWidth < 800 ? 27 : 87,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.yellow,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.464,
            child: Container(
              width: screenWidth < 800 ? 10 : 70,
              height: screenWidth < 800 ? 10 : 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.orange,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.11,
            right: screenWidth * 0.044,
            child: Container(
              width: screenWidth < 800 ? 49 : 109,
              height: screenWidth < 800 ? 49 : 109,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.lightYellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDarkModeDialog(BuildContext context) {
    final DarkModeController darkModeController = Get.find();
    showDialog(
      context: context,
      builder: (context) {
        return DarkModeDialog(
          onDarkModeChanged: (isDarkMode) {
            darkModeController.setDarkMode(isDarkMode);
          },
        );
      },
    );
  }
}
