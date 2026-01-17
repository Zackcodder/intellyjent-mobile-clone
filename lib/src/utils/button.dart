import '../core/core.dart';

class ButtonWidget extends StatefulWidget {
  final Function()? onPressed;
  final String? buttonText;
  final bool shouldShowLoader;
  final double fontSize;
  final bool? iconAllowed;
  final FontWeight? fontWeight;
  final Icon? icon;
  final Color? textColor;
  final EdgeInsets? padding;
  final MaterialStateProperty<Color?>? backgroundColor;
  final Widget? child;
  final Color? buttonColor;
  final Color? borderSideColor;
  const ButtonWidget({
    super.key,
    this.onPressed,
    this.shouldShowLoader = false,
    this.padding,
    required this.buttonText,
    required this.fontSize,
    this.icon,
    this.iconAllowed = false,
    this.textColor,
    this.child,
    this.buttonColor,
    this.borderSideColor,
    this.backgroundColor,
    this.fontWeight,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  bool isLoading = false;
  updateIsLoading(bool value) {
    if (mounted) {
      // Define a separate function for the status listener
      void onAnimationStatus(AnimationStatus status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          // Animation has completed or been dismissed, update the state
          setState(() {
            isLoading = value;
          });
          _controller.removeStatusListener(onAnimationStatus);
        }
      }

      if (_controller.isAnimating) {
        _controller.addStatusListener(onAnimationStatus);
      } else {
        // Animation is not running, safe to call setState directly
        setState(() {
          isLoading = value;
        });
      }
    }
  }



  @override
  void dispose() {
    if (_controller.isAnimating) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: (1.0 + (0.1 * _controller.value)).clamp(1.0, 1.05),
              child: SizedBox(
                width: double.infinity,
                height: screenWidth >= 790 ? 90 : 55,
                child: ElevatedButton(
                  onPressed: () async {
                    if (isLoading) return;
                    _controller.forward().then((value) async {
                      _controller.reverse();
                      if (widget.onPressed != null) {
                        if (widget.shouldShowLoader) {
                          updateIsLoading(true);
                        }
                        await widget.onPressed!();
                        updateIsLoading(false);
                      }
                    });
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateTextStyle.resolveWith(
                      (states) => GoogleFonts.inter(
                        fontSize: widget.fontSize,
                        color: widget.textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    backgroundColor: widget.backgroundColor ??
                        const MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (states) => RoundedRectangleBorder(
                        side: BorderSide(
                          color: widget.borderSideColor ?? AppColor.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: isLoading
                      ? ConstrainedBox(
                          constraints:
                              const BoxConstraints(maxHeight: 23, maxWidth: 23),
                          child: LoadingAnimationWidget.threeArchedCircle(
                            color: AppColor.white,
                            size: screenWidth < 800 ? 55 : 100,
                          ),
                        )
                      : widget.child ??
                          Text(
                            widget.buttonText ?? '',
                            style: GoogleFonts.inter(
                              color: widget.textColor,
                              fontWeight: widget.fontWeight ?? FontWeight.w600,
                              fontSize: widget.fontSize,
                            ),
                          ),
                ),
              ),
            );
          }),
    );
  }
}
