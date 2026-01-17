

import '../core/core.dart';

class RootDrawer extends StatelessWidget {
  const RootDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      width: screenWidth * 0.7,
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              color: Get.theme.brightness == Brightness.light
                  ? const Color(0xFF4169e1) : AppColor.darkContainer,
              image: Get.theme.brightness == Brightness.light
                  ?  DecorationImage(
                  image: AssetImage(Assets.assetsBlueDots),
                  repeat: ImageRepeat.repeat
              ) : null,
            ),
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.assetsLogo,
                    width: screenWidth < 800 ? 39 : 49,
                    colorFilter: const ColorFilter.mode(
                      AppColor.white,
                      BlendMode.srcIn,
                    ),),
                  AppSizing.w16,
                  Text(
                    'Intellyjent',
                    style: AppTextStyle.h3Regular(context).copyWith( fontWeight: FontWeight.w500).copyWith(
                      color: AppColor.white
                    )
                    ,
                  ),
                ],
              ),
              AppSizing.h48,
              buildTiles(context, Assets.newWordsIcon, 'New Words',
                  ()=> Get.to(()=> const NewWordsListPage(), transition: Transition.upToDown)),
              AppSizing.h32,
              buildTiles(context, Assets.assetsIdiomsDrawerIcon, 'Idioms',
                      ()=> Get.to(()=> const IdiomsListPage(), transition: Transition.upToDown)),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildTiles(BuildContext context, String asset, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    asset, width: 30,
                  ),
                  AppSizing.w08,
                  Text(title, style: AppTextStyle.h3Regular(context).copyWith(
                    color: AppColor.white, fontSize: 17, fontWeight: FontWeight.w500
                  ),)
                ],
              ),
    );
  }
}