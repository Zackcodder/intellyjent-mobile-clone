import '../core/core.dart';

// enum BottomIconType { quiz, leaderboard, topUp, account }
//comment
enum BottomIconType { quiz, leaderboard, topUp, account, learn }

class Root extends StatefulWidget {
  const Root({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController _controller;
  late BottomIconType _selectedIcon;
  final duration = const Duration(milliseconds: 10);

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
    _selectedIcon = _getIconType(widget.initialIndex);
    ProfilePageController user = Get.put(ProfilePageController());
    LeaderBoardController board = Get.put(LeaderBoardController());
    board.onInit();
    user.getUserData();

    final DarkModeController darkModeController = Get.find();
    final Brightness statusBarIconBrightness =
        darkModeController.isDarkMode ? Brightness.light : Brightness.dark;

    // Set initial system UI overlay style
    _updateSystemUIOverlayStyle(statusBarIconBrightness);

    // Observe changes in dark mode and update system UI overlay style
    ever<bool>(darkModeController.isDarkMode.obs, (isDarkMode) {
      final Brightness newIconBrightness =
          isDarkMode ? Brightness.light : Brightness.dark;
      _updateSystemUIOverlayStyle(newIconBrightness);
    });

    if (UserData.username != null) {
      OneSignal.login(UserData.username!);
    }
    OneSignal.User.pushSubscription.optIn();
  }

  void _updateSystemUIOverlayStyle(Brightness statusBarIconBrightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarIconBrightness == Brightness.light
            ? AppColor.darkAppBg
            : Colors.transparent,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  BottomIconType _getIconType(int index) {
    switch (index) {
      case 0:
        return BottomIconType.quiz;
      case 1:
        return BottomIconType.leaderboard;
      case 2:
        return BottomIconType.topUp;
      case 3:
        return BottomIconType.learn;
      //comment
      case 4:
        return BottomIconType.account;
      default:
        return BottomIconType.quiz;
    }
  }

  void _onIconTapped(BottomIconType iconType, int index) {
    setState(() => _selectedIcon = iconType);
    _controller.animateToPage(
      index,
      duration: duration,
      curve: Curves.easeIn,
    );
  }

  final GlobalKey<ScaffoldState> _rootScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _rootScaffoldKey,
      drawer: const RootDrawer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: BottomAppBar(
          height: MediaQuery.of(context).size.width > 790 ? 100 : 84,
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          color: Theme.of(context).brightness == Brightness.light
              ? AppColor.white
              : AppColor.darkAppNavBar,
          surfaceTintColor: Colors.white,
          elevation: 10,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAnimatedIcon(
                image: _selectedIcon == BottomIconType.quiz
                    ? Assets.assetsQuizSelected
                    : Assets.assetsQuizUnselected,
                onPressed: () => _onIconTapped(BottomIconType.quiz, 0),
                isSelected: _selectedIcon == BottomIconType.quiz,
                title: 'Quiz',
              ),
              CustomAnimatedIcon(
                image: _selectedIcon == BottomIconType.leaderboard
                    ? Assets.assetsRankingSelected
                    : Assets.assetsRanking,
                // width: 18,
                onPressed: () => _onIconTapped(BottomIconType.leaderboard, 1),
                isSelected: _selectedIcon == BottomIconType.leaderboard,
                title: 'Leaderboard',
              ),
              CustomAnimatedIcon(
                image: _selectedIcon == BottomIconType.topUp
                    ? Assets.assetsMoneysSelected
                    : Assets.assetsMoneys,
                // width: 16.782,
                onPressed: () => _onIconTapped(BottomIconType.topUp, 2),
                isSelected: _selectedIcon == BottomIconType.topUp,
                title: 'Top-Up',
              ),
              CustomAnimatedIcon(
                image: _selectedIcon == BottomIconType.learn
                    ? Assets.assetsBookDark
                    : Assets.assetsBook,
                onPressed: () => _onIconTapped(BottomIconType.learn, 3),
                isSelected: _selectedIcon == BottomIconType.learn,
                title: 'Learn',
              ),
              CustomAnimatedIcon(
                image: _selectedIcon == BottomIconType.account
                    ? Assets.assetsProfileSelected
                    : Assets.assetsProfile,
                onPressed: () => _onIconTapped(BottomIconType.account, 4),
                isSelected: _selectedIcon == BottomIconType.account,
                title: 'Account',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _selectedIcon = _getIconType(index);
            });
          },
          children: [
            HomePage(rootScaffoldKey: _rootScaffoldKey),
            const LeaderboardPage(),
            const TopUpPage(),
            //comment
            const LearnCategoryListPage(),
            const ProfilePage(),
          ],
        ),
      ),
    );
  }
}

class CustomAnimatedIcon extends StatelessWidget {
  final String? image;
  final String title;
  final bool isSelected;
  final double width;
  final void Function()? onPressed;
  const CustomAnimatedIcon({
    super.key,
    this.isSelected = false,
    this.onPressed,
    this.image,
    this.width = 18,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: isSelected ? 65 : 60,
        color: Get.theme.brightness == Brightness.light
            ? AppColor.white
            : AppColor.darkAppNavBarIcons,
        width: MediaQuery.of(context).size.width < 800 ? 70 : 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image!,
              width: MediaQuery.of(context).size.width > 790 ? 23 : 22,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.light
                    ? isSelected
                        ? AppColor.appColor
                        : AppColor.grey400
                    : isSelected
                        ? AppColor.appColor
                        : AppColor.grey200,
                BlendMode.srcIn,
              ),
            ),
            AppSizing.h04,
            Text(
              title,
              style: AppTextStyle.bodyVerySmall(context).copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? isSelected
                          ? AppColor.appColor
                          : AppColor.grey400
                      : isSelected
                          ? AppColor.appColor
                          : AppColor.grey200,
                  fontSize: MediaQuery.of(context).size.width > 800 ? 12 : 11),
            )
          ],
        ),
      ),
    );
  }
}
