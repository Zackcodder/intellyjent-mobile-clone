import 'package:intellyjent/src/core/core.dart';

class FeedbackBackgroundClipper extends CustomClipper<Path> {
  final double radius;
  const FeedbackBackgroundClipper({this.radius = 20});

  @override
  Path getClip(Size size) {
    final h = size.height;
    final w = size.width;

    double calculateRadiusPoint() {
      return (radius*2) + h * 0.3;
    }

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h * 0.3);
    path.arcToPoint(Offset(0, calculateRadiusPoint()), radius: const Radius.circular(10));
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w,calculateRadiusPoint());
    path.arcToPoint(Offset(w, h * 0.3), radius: const Radius.circular(10));
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
