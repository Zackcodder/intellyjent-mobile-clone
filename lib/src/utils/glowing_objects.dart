import '../core/core.dart';

class GlowingWidget extends StatefulWidget {
  final double? size;
  final Widget child;
  final int milliseconds;
  const GlowingWidget(
      {super.key, this.size, required this.child, required this.milliseconds});

  @override
  State<GlowingWidget> createState() => _GlowingWidgetState();
}

class _GlowingWidgetState extends State<GlowingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController dotController;
  bool hasReversedAnim = false;
  bool isDisposed = false; // Track whether the widget is disposed

  @override
  void initState() {
    super.initState();
    dotController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliseconds));
    Future.delayed(const Duration(milliseconds: 700), () {
      if (!isDisposed) {
        // Check if the widget is not disposed
        dotController.forward();
        dotController.addListener(animationListener);
      }
    });
  }

  animationListener() {
    if (dotController.status == AnimationStatus.reverse) {
      hasReversedAnim = true;
    }
    if (dotController.status == AnimationStatus.dismissed && hasReversedAnim) {
      hasReversedAnim = false;
      dotController.reset();
      if (!isDisposed) {
        dotController.forward();
      }
    }
    if (dotController.status == AnimationStatus.completed) {
      if (!isDisposed) {
        dotController.reverse();
      }
    }
  }

  @override
  void dispose() {
    dotController.removeListener(animationListener);
    dotController.dispose();
    isDisposed = true; // Set the flag to true when disposing the widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: dotController,
      builder: (context, child) {
        return Opacity(
          opacity: dotController.value,
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}

