import 'package:intellyjent/src/utils/custom_switch.dart';

import '../core/core.dart';

class SettingsButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String? buttonText;
  final String suffixIcon;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? suffixIconColor;
  final Color? buttonColor;
  final bool showSwitch;
  final bool switchValue;
  final bool? disableTap;
  final void Function(bool)? onSwitchChanged;
  const SettingsButtonWidget({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.textColor,
    this.buttonColor,
    this.fontWeight,
    required this.suffixIcon,
    this.suffixIconColor,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged, this.disableTap = false,
  });

  @override
  State<SettingsButtonWidget> createState() => _SettingsButtonWidgetState();
}

class _SettingsButtonWidgetState extends State<SettingsButtonWidget> with SingleTickerProviderStateMixin{
  late bool localSwitchValue;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    localSwitchValue = widget.switchValue;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
          return Transform.scale(
            scale: 1.0 - (0.1 * _controller.value),
            child: SizedBox(
              width: double.infinity,
              height: screenWidth < 800 ? 55 : 110,
              child: ElevatedButton(
                onPressed: (){
                  if(widget.disableTap == true){
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    }
                    return;
                  }
                  _controller.forward().then((value) {
                    _controller.reverse();
                    if (widget.onPressed != null) {
                      widget.onPressed!();
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: Theme.of(context).brightness == Brightness.dark
                      ? const MaterialStatePropertyAll(AppColor.darkAppNavBar) : const MaterialStatePropertyAll(AppColor.white),
                  shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                    (states) => RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColor.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                child: Padding(
                  padding: screenWidth < 800 ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            widget.suffixIcon,
                            width: screenWidth < 800 ? 24 : 35,
                            height: screenWidth < 800 ? 24 : 35,
                            colorFilter: widget.suffixIconColor != null
                                ? ColorFilter.mode(
                                    widget.suffixIconColor!,
                                    BlendMode.srcIn,
                                  )
                                : null,
                          ),
                          screenWidth < 800 ? AppSizing.w20 : AppSizing.w28,
                          Text(
                            widget.buttonText ?? '',
                            style: GoogleFonts.lato(
                              color: Theme.of(context).brightness == Brightness.light
                                  ? widget.textColor ??  AppColor.appBlack : widget.textColor ??  AppColor.white,
                              fontWeight: widget.fontWeight ?? FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      if (widget.showSwitch)
                      const CustomSwitch(
                      )
                      else
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColor.white : AppColor.appBlack,
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
