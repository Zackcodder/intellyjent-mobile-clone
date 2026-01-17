import '../core/core.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle h4Regular(BuildContext context) => GoogleFonts.lato(
    fontSize: 20,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodySmallHeavy(BuildContext context) => GoogleFonts.lato(
    fontSize: 14,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bodySmallLight(BuildContext context) => GoogleFonts.lato(
    fontSize: 14,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyVerySmall(BuildContext context) => GoogleFonts.lato(
    fontSize: 12,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.lato(
    fontSize: 16,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
    fontWeight: FontWeight.w400,
  );

  static TextStyle h3Regular(BuildContext context) => GoogleFonts.inter(
    fontSize: 24,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h5(BuildContext context) => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
  );

  static TextStyle h4(BuildContext context) => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
  );

  static TextStyle h3(BuildContext context) => GoogleFonts.outfit(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
  );

  static TextStyle h2(BuildContext context) => GoogleFonts.outfit(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
  );

  static TextStyle h1(BuildContext context) => GoogleFonts.inter(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    color: Get.theme.brightness == Brightness.dark
        ? Colors.white
        : AppColor.appBlack,
  );
}
