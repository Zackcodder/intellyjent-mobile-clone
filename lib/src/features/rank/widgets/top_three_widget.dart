import 'dart:math';

import 'package:intellyjent/src/core/core.dart';

class TopThreeWidget extends StatelessWidget {
  final List<LastWeeksWinners> topThree;
  const TopThreeWidget({super.key, required this.topThree});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            // spacing: 20,
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // _buildRankingWidgetPlaceHolder(constraints, 2),
              if (topThree.isEmpty) const SizedBox.shrink(),
              if (topThree.length >= 2)
                _buildRankingWidget(constraints, 2, topThree[1], context),
              AppSizing.w28,
              if (topThree.isNotEmpty)
                _buildRankingWidget(constraints, 1, topThree[0], context),
              AppSizing.w28,
              if (topThree.length >= 3)
                _buildRankingWidget(constraints, 3, topThree[2], context)
            ],
          )),
    );
  }
}

Widget _buildRankingWidget(BoxConstraints constraints, int position,
    LastWeeksWinners data, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildCustomAvatarHolder(constraints, position, data, context),
      AppSizing.h16,
      LeaderboardDetails(
        name: data.fullname.split(" ").first,
        country: data.country == '' ? "Nigeria" : data.country!,
        points: "${data.score.toInt()}",
      ),
    ],
  );
}

Widget _buildCustomAvatarHolder(BoxConstraints constraints, int position,
    LastWeeksWinners data, BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;

  List<String> userSpitedName = data.fullname.split(" ");
  double radius = screenWidth < 800
      ? ((constraints.maxWidth / 3) - 72).clamp(25, 40)
      : ((constraints.maxWidth / 3) - 30).clamp(35, 60);

  Color randomColor =
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  return Container(
    alignment: Alignment.bottomCenter,
    height: radius * 2,
    child: Stack(
      children: [
        CircleAvatar(
          radius: position != 1 ? radius - 5 : radius,
          backgroundColor: data.user_profile_image == null ? randomColor : null,
          backgroundImage: data.user_profile_image == null
              ? null
              : data.user_profile_image != null && data.user_profile_image!.endsWith('svg')
              ? null : NetworkImage(
                  '${data.user_profile_image}',
                ),
          child: data.user_profile_image != null && data.user_profile_image!.endsWith('svg')
                  ? SvgPicture.network(
                      data.user_profile_image!, width: screenWidth < 800 ? null : 120,
                    )
                  : data.user_profile_image == null
                  ? Text(
                      userSpitedName.length > 1
                          ? (userSpitedName.first[0] + userSpitedName.last[0])
                              .toUpperCase()
                          : userSpitedName.first
                              .replaceRange(0, null, "")
                              .toUpperCase(),
                      style: screenWidth < 800
                          ? AppTextStyle.h4Regular(context)
                              .copyWith(color: Colors.white)
                          : AppTextStyle.h3(context)
                              .copyWith(color: Colors.white),
                    ) : null,
        ),
        Positioned(
          right: 1,
          left: 1,
          bottom: 0,
          child: Transform.translate(
            offset: const Offset(0, 10),
            child: CircleAvatar(
              radius: screenWidth < 800 ? 12 : 20,
              backgroundColor: AppColor.appColor,
              child: Text(
                position.toString(),
                style: TextStyle(
                    fontSize: screenWidth < 800 ? null : 25,
                    color: AppColor.white),
              ),
            ),
          ),
        ),
        if (position == 1)
          Positioned(
            right: 1,
            left: 1,
            child: Transform.translate(
              offset: const Offset(0, -18),
              child: SvgPicture.asset(
                Assets.assetsCrown,
                width: 30,
              ),
            ),
          )
      ],
    ),
  );
}
