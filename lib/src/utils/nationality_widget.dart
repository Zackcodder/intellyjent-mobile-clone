import '../core/core.dart';

class NationalityWidget extends StatelessWidget {
  const NationalityWidget({
    super.key,
    required this.svgFlag,
    required this.flagName, this.flagHeight, this.textStyle,
  });

  final String svgFlag;
  final String flagName;
  final double? flagHeight;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(CountryFlagBuilder.getCountryFlag(flagName)),
        // SvgPicture.asset(svgFlag, height: flagHeight ?? 12,),
        AppSizing.w04,
        Text(CountryFlagBuilder.getCountrySlug(flagName), style: textStyle ?? AppTextStyle.h4Regular(context).copyWith(
            color: AppColor.appBlack,
            fontSize: 14
        ),)
      ],
    );
  }
}