import '../../../core/core.dart';

class ResultWidget extends StatelessWidget {
  final Alignment alignment;
  final String score;
  final String title;
  final Color circleColor;
  final FontWeight? scoreFontWeight;

  const ResultWidget({
    super.key, required this.alignment, required this.score, required this.title, required this.circleColor, this.scoreFontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        Container(
          width: 10,
          height: 10,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: circleColor
          ),
        ),
        AppSizing.w04,
        Row(
          children: [
            AppSizing.w20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(score == '0' ? '0' : score.padLeft(2, '0'), style: AppTextStyle.bodyMedium(context).copyWith(
                  color: AppColor.appBlack,
                    fontWeight: scoreFontWeight ?? FontWeight.w400),),
                Text(title, style: AppTextStyle.bodySmallHeavy(context).copyWith(
                    color: AppColor.appBlack, fontWeight: FontWeight.w400),),
              ],
            ),
          ],
        )
      ],
    );
  }
}