import '../../../core/core.dart';

class LeaderboardDetails extends StatelessWidget {
  final String name;
  final String points;
  final String country;

  const LeaderboardDetails({
    super.key, required this.name, required this.points, required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth:((MediaQuery.of(context).size.width /3)-30).clamp(100, 200)),
          child: Text(name, style: AppTextStyle.h4Regular(context),overflow: TextOverflow.ellipsis,)),
        AppSizing.h04,
        Row(
          children: [
            Text(CountryFlagBuilder.getCountryFlag(country == '' ? 'Nigeria' : country),style: AppTextStyle.bodyMedium(context).copyWith(
          fontSize: 14,
          color: Theme.of(context).brightness == Brightness.light ? AppColor.appBlack : AppColor.white,fontWeight: FontWeight.w600
        ),),
        AppSizing.w04,
            Text(CountryFlagBuilder.getCountrySlug(country == '' ? 'Nigeria' : country),style: AppTextStyle.bodyMedium(context).copyWith(
          fontSize: 14,
          color: Theme.of(context).brightness == Brightness.light ? AppColor.appBlack : AppColor.white,fontWeight: FontWeight.w600
        ),),
          ],
        ),
        // NationalityWidget(svgFlag: svgFlag, flagName: flagName, textStyle: AppTextStyle.bodyMedium(context).copyWith(
        //   fontSize: 14,
        //   color: Theme.of(context).brightness == Brightness.light ? AppColor.appBlack : AppColor.white,fontWeight: FontWeight.w600
        // )),
        Text('$points Points', style: AppTextStyle.bodyMedium(context).copyWith(fontSize: 14,),),
      ],
    );
  }
}
