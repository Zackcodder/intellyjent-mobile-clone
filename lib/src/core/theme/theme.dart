import '../core.dart';

ThemeData lightMode = ThemeData().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColor.appBg,
        primary: AppColor.appBlack
    ),
    dialogBackgroundColor: AppColor.white,
    brightness: Brightness.light,
    splashColor: AppColor.appColor,
    highlightColor: Colors.transparent,
    datePickerTheme: const DatePickerThemeData().copyWith(
        elevation: 5,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        headerHeadlineStyle:
        GoogleFonts.lato(fontSize: 30, color: Colors.white),
        yearStyle: GoogleFonts.lato(fontSize: 18),
        headerBackgroundColor: AppColor.appColor,
        headerForegroundColor: Colors.white,
        backgroundColor: AppColor.appBg,
        dayStyle: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w600)),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: AppColor.appBlack),
          bodyMedium: TextStyle(color:  AppColor.appBlack),
          bodyLarge: TextStyle(color:  AppColor.appBlack),
          labelSmall: TextStyle(color:  AppColor.appBlack),
          labelMedium: TextStyle(color:  AppColor.appBlack),
          labelLarge: TextStyle(color:  AppColor.appBlack),
          displaySmall: TextStyle(color:  AppColor.appBlack),
          displayMedium: TextStyle(color:  AppColor.appBlack),
          displayLarge: TextStyle(color:  AppColor.appBlack),
          titleSmall: TextStyle(color:  AppColor.appBlack),
          titleMedium: TextStyle(color:  AppColor.appBlack),
          titleLarge: TextStyle(color:  AppColor.appBlack),


        ),
);

ThemeData darkMode = ThemeData().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(
      background: AppColor.darkAppBg,
      primary: AppColor.white,

    ),
    splashColor: AppColor.darkAppBg,
    brightness: Brightness.dark,
    highlightColor: Colors.transparent,
    dialogBackgroundColor: AppColor.darkAppBg,
    dialogTheme: const DialogTheme(
        contentTextStyle: TextStyle(color: AppColor.white)
    ),
    datePickerTheme: const DatePickerThemeData().copyWith(
      elevation: 5,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      headerHeadlineStyle:
          GoogleFonts.lato(fontSize: 30, color: Colors.white),
      yearStyle: GoogleFonts.lato(fontSize: 18),
      headerBackgroundColor: AppColor.darkContainer,
      todayBackgroundColor: const MaterialStatePropertyAll(AppColor.white),
      headerForegroundColor: Colors.white,
      backgroundColor: AppColor.darkAppBg,
      dayStyle: GoogleFonts.lato(fontSize: 14),
    ),
);
