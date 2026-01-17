
import '../core/core.dart';

class NumberingWidget extends StatelessWidget {
  final String index;
  const NumberingWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(1.0),
      alignment: Alignment.center,
      width: screenWidth < 800 ? 17 : 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.appColor,
      ),
      child: Text(index,style: AppTextStyle.bodyVerySmall(context).copyWith(
          color: AppColor.white ,
          fontSize: 12),),
    );
  }
}