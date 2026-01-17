import '../../../core/core.dart';

class CircleButtons extends StatefulWidget {
  final String svgImg;
  final String title;
  final VoidCallback? onTap;

  const CircleButtons({
    super.key, required this.svgImg, required this.title, this.onTap,
  });

  @override
  State<CircleButtons> createState() => _CircleButtonsState();
}

class _CircleButtonsState extends State<CircleButtons> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Column(
      children: [
        InkWell(
          splashColor: AppColor.appColor,
          borderRadius: BorderRadius.circular(50),
          onTap: (){
            _controller.forward().then((value) {
              _controller.reverse();
              if (widget.onTap != null) {
                widget.onTap!();
              }
            });
          },
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
              return Transform.scale(
                scale: (1.0 + (0.1 * _controller.value)).clamp(1.0, 1.05),
                child: Container(
                  width: screenWidth < 850 ? 42 : 100,
                  height: screenWidth < 850 ? 42 : 100,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: AppColor.grey,
                      shape: BoxShape.circle
                  ),
                  child: SvgPicture.asset(widget.svgImg,),
                ),
              );
            }
          ),
        ),
        AppSizing.h08,
        Text(widget.title, style: AppTextStyle.bodySmallHeavy(context),),
      ],
    );
  }
}