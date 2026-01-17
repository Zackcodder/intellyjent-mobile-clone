import '../../../core/core.dart';

class TopSheetHandle extends StatelessWidget {
  const TopSheetHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 6,
      decoration: BoxDecoration(
          color: Get.theme.brightness == Brightness.light
              ? AppColor.grey : AppColor.grey400.withOpacity(0.3),
          borderRadius: BorderRadius.circular(9)
      ),
    );
  }
}