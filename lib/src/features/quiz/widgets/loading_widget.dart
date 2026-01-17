

import '../../../core/core.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controllerTop;
  late AnimationController _controllerBottom;
  late List<Animation<double>> _opacityAnimations;
  late List<Animation<double>> _opacityAnimationsBottom;
  final List<Color> _squareColors = [AppColor.lightBlue, AppColor.lightYellow, AppColor.lightBlue];
  final List<Color> _squareColors2 = [AppColor.white, AppColor.lightYellow, AppColor.white];

  @override
  void initState() {
    super.initState();
    _controllerTop = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controllerBottom = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Create opacity animations for each square
    _opacityAnimations = List.generate(3, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _controllerTop,
          curve: Interval(index * 0.33, (index + 1) * 0.33,
              curve: Curves.easeIn),
        ),
      );
    });
    _opacityAnimationsBottom = List.generate(3, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _controllerTop,
          curve: Interval(index * 0.25, (index + 1) * 0.25,
              curve: Curves.easeIn),
        ),
      );
    });

    _controllerTop.repeat(reverse: true);
    _controllerBottom.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controllerTop.dispose();
    _controllerBottom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Row(),
        AnimatedOpacity(
          opacity: 1,
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 1000),
          child: SvgPicture.asset(
            Assets.assetsLogo,
            width: 100.0,
            height: 100.0,
            alignment: Alignment.center,
          ),
        ),
        const SizedBox(height: 16.0),
        const Text(
          'LOADING',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        const SizedBox(height: 16.0),
        _buildRowWithSquares(_squareColors2),
        _buildRowWithSquaresBottom(_squareColors),
        AppSizing.h20,
        const Text(
          '"Strap in! Your quiz adventure is about to begin!"',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }

  Widget _buildRowWithSquares(List<Color> colorList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
            (index) => _buildSquare(index, colorList),
      ),
    );
  }

  Widget _buildRowWithSquaresBottom(List<Color> colorList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
            (index) => _buildSquareBottom(index, colorList),
      ),
    );
  }

  Widget _buildSquare(int index, List<Color> colorList) {
    return AnimatedBuilder(
      animation: _opacityAnimations[index],
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimations[index].value,
          child: Container(
            width: 20.0,
            height: 20.0,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: colorList[index], // Use individual colors
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSquareBottom(int index, List<Color> colorList) {
    return AnimatedBuilder(
      animation: _opacityAnimationsBottom[index],
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimationsBottom[index].value,
          child: Container(
            width: 20.0,
            height: 20.0,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: colorList[index],
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        );
      },
    );
  }
}
