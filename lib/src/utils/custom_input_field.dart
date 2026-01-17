// ignore_for_file: prefer_if_null_operators

import 'package:intellyjent/src/core/core.dart';

class CustomInputField extends StatefulWidget {
  final String fieldName;
  final TextEditingController controller;
  final InputDecoration decoration;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool disabled;
  final double prefixMaxWidth;
  final bool showLockIcon;
  final TextInputType? inputType;
  final String? Function(dynamic)? validator;
  final Function()? onTap;
  final List<TextInputFormatter>? formatter;
  final Function(String value)? onChange;
  final bool? readOnly;
  final bool showBorder;
  final bool showRightBorder;
  const CustomInputField(
      {super.key,
      required this.fieldName,
      required this.controller,
      this.showRightBorder = true,
      this.formatter,
      this.prefixMaxWidth = 50,
      this.isPassword = false,
      this.disabled = false,
      this.showLockIcon = true,
      this.readOnly,
      this.onChange,
      this.showBorder = true,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.validator,
      this.inputType = TextInputType.text,
      this.decoration = const InputDecoration()});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool obscurePassword = true;

  void updatePassword() => setState(() => obscurePassword = !obscurePassword);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: AppTextStyle.h4Regular(context).copyWith(
              fontSize: 14,
              color:
                  widget.disabled ? const Color(0xff8A8A8A)
                      : Get.theme.brightness == Brightness.light
                      ? AppColor.grey400 : AppColor.white),
        ),
        AppSizing.h04,
        SizedBox(
          height: MediaQuery.of(context).size.width < 800 ? null : 100,
          child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.inputType,
              onTap: widget.onTap,
              readOnly: widget.readOnly ?? widget.disabled,
              enabled: !widget.disabled,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: widget.isPassword ? obscurePassword : false,
              cursorColor: AppColor.appColor,
              onChanged: widget.onChange,
              inputFormatters: widget.formatter,
              // maxLength: widget.maxlength,
              validator: widget.validator ??
                  (string) {
                    if (string.toString().isEmpty) {
                      return "${widget.fieldName} cannot be empty";
                    }
                    return null;
                  },
              decoration: widget.decoration.copyWith(
                  hintStyle: AppTextStyle.h4Regular(context)
                      .copyWith(fontSize: 15, color: Get.theme.brightness == Brightness.light
                      ? const Color(0xff8A8A8A) : AppColor.grey200),
                  hintText: widget.hintText,
                  contentPadding: const EdgeInsets.all(15),
                  prefixIcon: (widget.isPassword && widget.showLockIcon) ||
                          widget.prefixIcon != null
                      ? Container(
                          constraints:
                              BoxConstraints(maxWidth: widget.prefixMaxWidth),
                          margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  right: widget.showBorder
                                      ? BorderSide(
                                          width: 2, color: Get.theme.brightness == Brightness.light
                                      ? const Color(0xffE6E6E6) : AppColor.grey200)
                                      : BorderSide.none)),
                          child: widget.prefixIcon == null
                              ? widget.isPassword
                                  ? SvgPicture.asset(
                                      Assets.assetsLock,
                                    )
                                  : null
                              : widget.prefixIcon,
                        )
                      : null,
                  suffixIcon: widget.isPassword || widget.suffixIcon != null
                      ? Container(
                          constraints: const BoxConstraints(maxWidth: 50),
                          margin: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  left:
                                      widget.isPassword || !widget.showRightBorder
                                          ? BorderSide.none
                                          : BorderSide(
                                              width: 2,
                                              color: Get.theme.brightness == Brightness.light
                                                  ? const Color(0xffE6E6E6) : AppColor.grey200 ))),
                          child: widget.suffixIcon == null
                              ? widget.isPassword
                                  ? InkWell(
                                      onTap: () => updatePassword(),
                                      child: SvgPicture.asset(
                                          obscurePassword
                                              ? Assets.assetsClosedEye
                                              : Assets.assetsOpenEye,
                                          colorFilter: ColorFilter.mode(
                                            Get.theme.brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : AppColor.grey400,
                                            BlendMode.srcIn,
                                          ),
                                      ))
                                  : null
                              : widget.suffixIcon,
                        )
                      : null,
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 216, 55, 55))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 216, 55, 55))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE6E6E6))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE6E6E6))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Get.theme.brightness == Brightness.light
                          ? const Color(0xffE6E6E6) : AppColor.grey200 ))),
              style: AppTextStyle.h4Regular(context).copyWith(
                fontSize: 15,
                color:
                    widget.disabled ? const Color(0xff8A8A8A) :
                    Get.theme.brightness == Brightness.light
                        ? AppColor.grey400 : AppColor.white,
              )),
        )
      ],
    );
  }
}

class CustomInputFieldBank extends StatefulWidget {
  final String fieldName;
  final String controller;
  final InputDecoration decoration;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool disabled;
  final double prefixMaxWidth;
  final bool showLockIcon;
  final TextInputType? inputType;
  final String? Function(dynamic)? validator;
  final Function()? onTap;
  final List<TextInputFormatter>? formatter;
  final Function(String value)? onChange;
  final bool? readOnly;
  final bool showBorder;
  final bool showRightBorder;
  const CustomInputFieldBank(
      {super.key,
        required this.fieldName,
        required this.controller,
        this.showRightBorder = true,
        this.formatter,
        this.prefixMaxWidth = 50,
        this.isPassword = false,
        this.disabled = false,
        this.showLockIcon = true,
        this.readOnly,
        this.onChange,
        this.showBorder = true,
        this.onTap,
        this.prefixIcon,
        this.suffixIcon,
        this.hintText,
        this.validator,
        this.inputType = TextInputType.text,
        this.decoration = const InputDecoration()});

  @override
  State<CustomInputFieldBank> createState() => _CustomInputFieldBankState();
}

class _CustomInputFieldBankState extends State<CustomInputFieldBank> {
  bool obscurePassword = true;

  void updatePassword() => setState(() => obscurePassword = !obscurePassword);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: AppTextStyle.h4Regular(context).copyWith(
              fontSize: 14,
              color:
              widget.disabled ? const Color(0xff8A8A8A)
                  : Get.theme.brightness == Brightness.light
                  ? AppColor.grey400 : AppColor.white),
        ),
        AppSizing.h04,
        SizedBox(
          height: MediaQuery.of(context).size.width < 800 ? null : 100,
          child: TextFormField(
              controller: TextEditingController(text: widget.controller),
              keyboardType: widget.inputType,
              onTap: widget.onTap,
              readOnly: widget.readOnly ?? widget.disabled,
              enabled: !widget.disabled,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: widget.isPassword ? obscurePassword : false,
              cursorColor: AppColor.appColor,
              onChanged: widget.onChange,
              inputFormatters: widget.formatter,
              // maxLength: widget.maxlength,
              validator: widget.validator ??
                      (string) {
                    if (string.toString().isEmpty) {
                      return "${widget.fieldName} cannot be empty";
                    }
                    return null;
                  },
              decoration: widget.decoration.copyWith(
                  hintStyle: AppTextStyle.h4Regular(context)
                      .copyWith(fontSize: 15, color: Get.theme.brightness == Brightness.light
                      ? const Color(0xff8A8A8A) : AppColor.grey200),
                  hintText: widget.hintText,
                  contentPadding: const EdgeInsets.all(15),
                  enabled: widget.disabled,
                  prefixIcon: (widget.isPassword && widget.showLockIcon) ||
                      widget.prefixIcon != null
                      ? Container(
                    constraints:
                    BoxConstraints(maxWidth: widget.prefixMaxWidth),
                    margin: const EdgeInsets.fromLTRB(0, 5, 15, 5),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            right: widget.showBorder
                                ? BorderSide(
                                width: 2, color: Get.theme.brightness == Brightness.light
                                ? const Color(0xffE6E6E6) : AppColor.white)
                                : BorderSide.none)),
                    child: widget.prefixIcon == null
                        ? widget.isPassword
                        ? SvgPicture.asset(
                      Assets.assetsLock,
                    )
                        : null
                        : widget.prefixIcon,
                  )
                      : null,
                  suffixIcon: widget.isPassword || widget.suffixIcon != null
                      ? Container(
                    constraints: const BoxConstraints(maxWidth: 100),
                    margin: const EdgeInsets.fromLTRB(15, 5, 5, 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: widget.suffixIcon == null
                        ? widget.isPassword
                        ? InkWell(
                        onTap: () => updatePassword(),
                        child: SvgPicture.asset(
                          obscurePassword
                              ? Assets.assetsClosedEye
                              : Assets.assetsOpenEye,
                          colorFilter: ColorFilter.mode(
                            Get.theme.brightness ==
                                Brightness.dark
                                ? Colors.white
                                : AppColor.grey400,
                            BlendMode.srcIn,
                          ),
                        ))
                        : null
                        : widget.suffixIcon,
                  )
                      : null,
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 216, 55, 55))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 216, 55, 55))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE6E6E6))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xffE6E6E6))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Get.theme.brightness == Brightness.light
                          ? const Color(0xffE6E6E6) : AppColor.grey200 ))),
              style: AppTextStyle.h4Regular(context).copyWith(
                fontSize: 15,
                color:
                widget.disabled ? const Color(0xff8A8A8A) :
                Get.theme.brightness == Brightness.light
                    ? AppColor.grey400 : AppColor.white,
              )),
        )
      ],
    );
  }
}
