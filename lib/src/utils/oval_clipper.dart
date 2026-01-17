import '../core/core.dart';

class OvalClipper extends CustomClipper<Path> {
  final double size;
  final Offset position;
  final double offset;

  OvalClipper({
    required this.size,
    required this.position,
    required this.offset,
  });

  @override
  Path getClip(Size size) {
    final path = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(
            size.width * position.dx + offset,
            size.height * position.dy + offset,
          ),
          radius: size.width / 5,
        ),
      );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
