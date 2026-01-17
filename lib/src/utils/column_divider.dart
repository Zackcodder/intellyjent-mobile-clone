import '../core/core.dart';

class ColumnDivider extends StatelessWidget {
  const ColumnDivider({
    super.key,
    required this.screenHeight, this.color,
  });

  final double screenHeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColor.grey200,
      width: 1,
      height: screenHeight * 0.07,
    );
  }
}