import 'package:intellyjent/src/core/core.dart';

class CountryFlagBuilder {
  static String countryCodeToEmoji(String countryCode) {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }

  static String getCountryFlag(String countryName) {
    if(countryName.isEmpty){
      countryName =  'Nigeria';
    }
    List<Country> country = CountryService().getAll();
    String countryCode = country
        .where((element) =>
            element.name.toLowerCase() == countryName.toLowerCase())
        .first
        .countryCode;
    return countryCodeToEmoji(countryCode);
  }
  static String getCountrySlug(String countryName) {
    if(countryName.isEmpty){
      countryName =  'Nigeria';
    }
    List<Country> country = CountryService().getAll();
    return country
        .where((element) =>
            element.name.toLowerCase() == countryName.toLowerCase())
        .first
        .displayNameNoCountryCode.split("(").last.replaceFirst(")", "");
  }
}
