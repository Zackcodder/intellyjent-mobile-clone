import 'dart:math';

import '../core/core.dart';

class UserAvatar2 extends StatelessWidget {
  final double screenWidth;
  final String fullName;
  final ProfilePageController controller;
  final double? avatarSize;

  const UserAvatar2({
    super.key,
    required this.fullName,
    required this.screenWidth,
    required this.controller, this.avatarSize = 0.27,
  });

  @override
  Widget build(BuildContext context) {
    List<String> userSpitedName = fullName.split(" ");


    // Generate a random light color
    Color randomColor = generateRandomColor();

    return LayoutBuilder(builder: (context, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final screenWidth = mediaQuery.size.width;

      var fontSize = 30.0;
      var radiusScale = 2.2;
      if (screenWidth > 800) {
        fontSize = 60;
        radiusScale = 2.8;
      }

      // final imageUrl = controller.userData.value?.image ?? '';
      final imageUrl = UserData.image ?? '';

      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: CircleAvatar(
                    radius: (screenWidth * (avatarSize ?? 0.27)) / radiusScale,
                    child:  imageUrl.isNotEmpty
                        ? imageUrl.endsWith('.svg')
                        ? SvgPicture.network(
                      imageUrl,
                      width: (screenWidth * (avatarSize ?? 0.5)),
                      fit: BoxFit.contain,
                      placeholderBuilder: (context) =>
                          _buildPlaceholder(context, userSpitedName, fontSize),
                    )
                        : CachedNetworkImage(
                      imageUrl: imageUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.userData.value?.image == null ||
                              controller.userData.value?.image == ''
                              ? randomColor
                              : null,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => _buildPlaceholder(context, userSpitedName, fontSize),
                      errorWidget: (context, url, error) => _buildPlaceholder(context, userSpitedName, fontSize),
                    ) : _buildPlaceholder(context, userSpitedName, fontSize),
                  ),

                )
              ],
            ),
          ),
        ],
      );
    }
    );
  }

  Widget _buildPlaceholder(BuildContext context, List<String> userSpitedName, double fontSize) {
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

class UserAvatar extends StatelessWidget {
  final double screenWidth;
  final String fullName;
  final ProfilePageController controller;
  final double? avatarSize;
  final VoidCallback onTap;

  const UserAvatar({
    super.key,
    required this.fullName,
    required this.screenWidth,
    required this.controller, this.avatarSize = 0.27, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> userSpitedName = fullName.split(" ");


    // Generate a random light color
    Color randomColor = generateRandomColor();

    return LayoutBuilder(builder: (context, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final screenWidth = mediaQuery.size.width;

      var fontSize = 30.0;
      var radiusScale = 2.2;
      if (screenWidth > 800) {
        fontSize = 60;
        radiusScale = 2.8;
      }

      // final imageUrl = controller.userData.value?.image ?? '';
      final imageUrl = UserData.image ?? '';

      return Container(
        width: screenWidth,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(UserData.username ?? 'User'),
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CircleAvatar(
                        radius: (screenWidth * (avatarSize ?? 0.27)) / radiusScale,
                        child:  imageUrl.isNotEmpty
                            ? imageUrl.endsWith('.svg')
                            ? SvgPicture.network(
                          imageUrl,
                          width: (screenWidth * (avatarSize ?? 0.5)),
                          fit: BoxFit.contain,
                          placeholderBuilder: (context) =>
                              _buildPlaceholder(context, userSpitedName, fontSize),
                        )
                            : CachedNetworkImage(
                          imageUrl: imageUrl,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.userData.value?.image == null ||
                                  controller.userData.value?.image == ''
                                  ? randomColor
                                  : null,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => _buildPlaceholder(context, userSpitedName, fontSize),
                          errorWidget: (context, url, error) => _buildPlaceholder(context, userSpitedName, fontSize),
                        ) : _buildPlaceholder(context, userSpitedName, fontSize),
                      ),

                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    );
  }

  Widget _buildPlaceholder(BuildContext context, List<String> userSpitedName, double fontSize) {
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

class HomeAvatar extends StatelessWidget {
  final double? avatarSize;

  const HomeAvatar({
    super.key,this.avatarSize = 0.27,
  });

  @override
  Widget build(BuildContext context) {


    // Generate a random light color
    Color randomColor = generateRandomColor();

    return LayoutBuilder(builder: (context, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final screenWidth = mediaQuery.size.width;

      var fontSize = 16.0;
      var radiusScale = 2.2;
      if (screenWidth > 800) {
        fontSize = 20;
        radiusScale = 2.3;
      }

      return Container(
        width: screenWidth,
        color: Colors.transparent,
        child: GetX<ProfilePageController>(
          builder: (controller) {
            final userData = controller.userData.value;
            List<String> userSpitedName;
            String fullName;
            String country;
            String imageUrl;

            if (userData != null) {
              userSpitedName = userData.fullName.split(" ");
              fullName = userData.fullName;
              country = userData.country;
              imageUrl = userData.image;
            } else {
              userSpitedName = 'Guest User'.split(" ");
              fullName = 'Guest User';
              country = 'Nigeria';
              imageUrl = UserData.image!;
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Welcome back!', style: AppTextStyle.bodyVerySmall(context),),
                    Row(
                      children: [
                        Text(CountryFlagBuilder.getCountryFlag(country),
                          style: AppTextStyle.bodySmallLight(context),),
                        AppSizing.w04,
                        Text(fullName, style: AppTextStyle.h5(context).copyWith(
                          fontSize: 18
                        ),),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8, right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CircleAvatar(
                          radius: (screenWidth * (avatarSize ?? 0.27)) / radiusScale,
                          child:  imageUrl.isNotEmpty
                              ? imageUrl.endsWith('.svg')
                              ? SvgPicture.network(
                            imageUrl,
                            width: (screenWidth * (avatarSize ?? 0.5)),
                            fit: BoxFit.contain,
                            placeholderBuilder: (context) =>
                                _buildPlaceholder(context, userSpitedName, fontSize),
                          )
                              : CachedNetworkImage(
                            imageUrl: imageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: randomColor,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => _buildPlaceholder(context, userSpitedName, fontSize),
                            errorWidget: (context, url, error) => _buildPlaceholder(context, userSpitedName, fontSize),
                          ) : _buildPlaceholder(context, userSpitedName, fontSize),
                        ),

                      )
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      );
    }
    );
  }

  Widget _buildPlaceholder(BuildContext context, List<String> userSpitedName, double fontSize) {
    return Text(
      userSpitedName.length > 1
          ? (userSpitedName.first[0] + userSpitedName.last[0]).toUpperCase()
          : userSpitedName.isEmpty || userSpitedName.first.length < 2
          ? "--"
          : userSpitedName.first.replaceRange(2, null, "").toUpperCase(),
      style: AppTextStyle.bodyVerySmall(context).copyWith(
        color: AppColor.white,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
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