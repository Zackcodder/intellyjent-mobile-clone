import '../core/core.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    required this.image, this.height, this.width,
  });

  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 30,
      height: height ?? 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}