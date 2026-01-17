import 'package:intellyjent/src/core/core.dart';

class CustomSwitch extends StatefulWidget {
  final Function(bool value)? onChanged;
  const CustomSwitch({super.key, this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isSwitchedOn = true;

  @override
  initState(){
    super.initState();
    loadSwitchState();
  }

  void loadSwitchState() async {
      isSwitchedOn = bool.parse(
          await SecureCache.retrieveFromCache(CacheKeys.notification) ?? "true");

      updateOneSignalSetting(isSwitchedOn);
      if (mounted) {
        setState(() {});
      }
  }

  void saveSwitchState(bool isEnabled) async {
    SecureCache.writeToCache(CacheKeys.notification, isEnabled.toString());
  }

  void updateOneSignalSetting(bool isEnabled) {
    if (isEnabled) {
      OneSignal.User.pushSubscription.optIn();
    } else {
      OneSignal.User.pushSubscription.optOut();
    }
  }

  switchController() {
    isSwitchedOn = !isSwitchedOn;
    if (widget.onChanged != null) {
      widget.onChanged!(isSwitchedOn);
    }
    updateOneSignalSetting(isSwitchedOn);
    saveSwitchState(isSwitchedOn);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switchController();
      },
      child: Stack(
        children: [
          Align(
            child: Container(
              height: 13,
              width: 41,
              decoration: ShapeDecoration(
                  color: isSwitchedOn ? AppColor.appColor : Colors.grey,
                  shape: const StadiumBorder()),
            ),
          ),
          AnimatedPositioned(
            right: isSwitchedOn ? 0 : 18,
            bottom: 0.5,
            top: 0.5,
            duration: const Duration(milliseconds: 100),
            child: Container(
              height: 23,
              width: 23,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(57, 60, 60, 60),
                        spreadRadius: 2.0,
                        blurRadius: 3)
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
