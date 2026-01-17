import '../../../core/core.dart';

class DarkModeDialog extends StatefulWidget {
  final Function(bool) onDarkModeChanged;

  const DarkModeDialog({super.key, required this.onDarkModeChanged});

  @override
  State<DarkModeDialog> createState() => _DarkModeDialogState();
}

class _DarkModeDialogState extends State<DarkModeDialog> {
  final DarkModeController darkModeController = Get.find();
  Brightness platformBrightness = Brightness.light;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updatePlatformBrightness();
  }

  void updatePlatformBrightness() {
    setState(() {
      platformBrightness = MediaQuery.of(context).platformBrightness;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.none,
      surfaceTintColor: Colors.transparent,
      child: ClipPath(
          clipper: const FeedbackBackgroundClipper(),
          clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Get.theme.brightness == Brightness.light ? AppColor.white : AppColor.darkContainer,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Dark Mode',
                    style: AppTextStyle.h5(context).copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
                ListTile(
                  title: GestureDetector(
                    onTap: () {
                      setState(() {
                        darkModeController.deselectOnOff();
                        darkModeController.setSystemMode(true);
                        darkModeController.setDarkMode(
                          platformBrightness == Brightness.dark,
                        );
                        widget.onDarkModeChanged(darkModeController.isDarkMode);
                      });
                    },
                    child: Text(
                      'System Settings',
                      style: AppTextStyle.bodySmallLight(context),
                    ),
                  ),
                  leading: Radio(
                    value: 'system',
                    activeColor: AppColor.appColor,
                    groupValue: darkModeController.radioGroupValue,
                    onChanged: (value) {
                      setState(() {
                        darkModeController.deselectOnOff();
                        darkModeController.setSystemMode(value == 'system');
                        darkModeController.setDarkMode(
                          platformBrightness == Brightness.dark,
                        );
                        widget.onDarkModeChanged(darkModeController.isDarkMode);
                      });
                    },
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      darkModeController.deselectSystem();
                      darkModeController.setDarkMode(false);
                      widget.onDarkModeChanged(darkModeController.isDarkMode);
                    });
                  },
                  child: ListTile(
                    title: Text('Off', style: AppTextStyle.bodySmallLight(context)),
                    leading: Radio(
                      value: 'off',
                      activeColor: AppColor.appColor,
                      groupValue: darkModeController.radioGroupValue,
                      onChanged: (value) {
                        setState(() {
                          darkModeController.deselectSystem();
                          darkModeController.setDarkMode(value == 'dark' ? true : false);
                          widget.onDarkModeChanged(darkModeController.isDarkMode);
                        });
                      },
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      darkModeController.deselectSystem();
                      darkModeController.setDarkMode(true);
                      widget.onDarkModeChanged(darkModeController.isDarkMode);
                    });
                  },
                  child: ListTile(
                    title: Text('On', style: AppTextStyle.bodySmallLight(context)),
                    leading: Radio(
                      value: 'on',
                      activeColor: AppColor.appColor,
                      groupValue: darkModeController.radioGroupValue,
                      onChanged: (value) {
                        setState(() {
                          darkModeController.deselectSystem();
                          darkModeController.setDarkMode(
                          value == 'on' ? true : false);
                          widget.onDarkModeChanged(
                              darkModeController.isDarkMode);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

