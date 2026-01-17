import '../../../core/core.dart';

class DarkModeController extends GetxController {
  final RxBool _isDarkMode = false.obs;
  final GetStorage getStorage = GetStorage();
  RxBool isSystemMode = false.obs;
  RxBool initLoad = true.obs;

  bool get isDarkMode => _isDarkMode.value;

  DarkModeController() {
    _isDarkMode.value = getStorage.read('isDarkMode') ?? false;
    isSystemMode.value = getStorage.read('isSystemMode') ?? false;
  }

  void setDarkMode(bool value) {
    _isDarkMode.value = value;
    getStorage.write('isDarkMode', value);
    final Brightness statusBarIconBrightness =
    isDarkMode ? Brightness.light : Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDarkMode ? AppColor.darkAppBg : Colors.transparent,
        statusBarIconBrightness: statusBarIconBrightness,
      ),
    );
    update();
  }

  void setSystemMode(bool value) {
    isSystemMode.value = value;
    getStorage.write('isDarkMode', value);
  }

  String get radioGroupValue =>
      isSystemMode.value ? 'system' : isDarkMode ? 'on' : 'off';

  void deselectSystem() {
    setSystemMode(false);
  }

  void deselectOnOff() {
    setDarkMode(false);
  }

  //theme
  final ThemeData _lightMode = lightMode;
  final ThemeData _darkMode = darkMode;

  ThemeData get themeData => isDarkMode ? _darkMode : _lightMode;

  Future<void> updateSystemUiOverlayStyle() async {
    if (initLoad.value) {
      initLoad.value = false;
      try {
        final bool savedBrightness = getStorage.read('isDarkMode') ?? false;
        setDarkMode(savedBrightness);

        final Brightness statusBarIconBrightness =
        isDarkMode ? Brightness.light : Brightness.dark;

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: isDarkMode ? AppColor.darkAppBg : Colors.transparent,
            statusBarIconBrightness: statusBarIconBrightness,
          ),
        );
      } catch (e) {
        ErrorResponse(message: 'Error reading saved brightness: $e');
      }
    } else{return;}
  }

}