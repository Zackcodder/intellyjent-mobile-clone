// ignore_for_file: deprecated_member_use

import '../core/core.dart';

class QuizButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String? buttonText;
  final double fontSize;
  final int index;
  final FontWeight? fontWeight;
  final IconData? markIcon;
  final Color? markColor;
  final Color? textColor;
  final MaterialStateProperty<Color?>? backgroundColor;
  final Color? buttonColor;
  final bool correctOption;
  final QuizQuestionsController controller;
  const QuizButtonWidget({
    super.key,
    this.onPressed,
    required this.buttonText,
    required this.fontSize,
    this.textColor,
    this.buttonColor,
    this.backgroundColor,
    this.fontWeight,
    this.markIcon,
    this.markColor,
    required this.controller,
    required this.index,
    required this.correctOption,
  });

  @override
  State<QuizButtonWidget> createState() => _QuizButtonWidgetState();
}

class _QuizButtonWidgetState extends State<QuizButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late RxBool tapped;
  late bool isCorrectAnswer;

  @override
  void initState() {
    super.initState();
    tapped = widget.controller.buttonStates[widget.index];
    isCorrectAnswer = widget.controller.isOptionCorrect(widget.index);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: (1.0 + (0.1 * _controller.value)).clamp(0.98, 1.05),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width < 850 ? 55 : 90,
                child: Obx(() {
                  tapped = widget.controller.buttonStates[widget.index];
                  isCorrectAnswer =
                      widget.controller.isOptionCorrect(widget.index);

                  return ElevatedButton(
                    onPressed: widget.controller.enableButtons.value &&
                            !widget.controller.buttonStates[widget.index].value
                        ? () async {
                            _controller.forward();
                            tapped.value = true;
                            widget.controller.enableButtons.value = false;
                            await Future.delayed(const Duration(seconds: 1));
                            tapped.value = false;
                            _controller.reverse();
                            widget.onPressed?.call();
                          }
                        : null,
                    style: ButtonStyle(
                      textStyle: MaterialStateTextStyle.resolveWith(
                        (states) => GoogleFonts.inter(
                          fontSize: widget.fontSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (states) {
                          if (widget.backgroundColor != null) {
                            return widget.backgroundColor!.resolve(states);
                          } else {
                            if (tapped.value) {
                              if (isCorrectAnswer) {
                                return AppColor.green;
                              } else {
                                return AppColor.red;
                              }
                            } else {
                              if (widget.correctOption &&
                                  widget.controller.enableButtons.value ==
                                      false) {
                                return AppColor.green;
                              } else {
                                return Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColor.white
                                    : Colors.transparent;
                              }
                            }
                          }
                        },
                      ),
                      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                        (states) => RoundedRectangleBorder(
                          side: BorderSide(
                            color: (widget.backgroundColor != null
                                ? widget.backgroundColor!.resolve(states) ??
                                    Colors.transparent
                                : tapped.value
                                    ? Colors.transparent
                                    : widget.correctOption &&
                                            widget.controller.enableButtons
                                                    .value ==
                                                false
                                        ? Colors.transparent
                                        : AppColor.grey200),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            widget.buttonText ?? '',
                            style: GoogleFonts.inter(
                              color: widget.correctOption &&
                                      widget.controller.enableButtons.value ==
                                          false
                                  ? AppColor.white
                                  : Theme.of(context).brightness ==
                                          Brightness.light
                                      ? widget.textColor ??
                                          (tapped.value
                                              ? AppColor.white
                                              : AppColor.appBlack)
                                      : widget.textColor ??
                                          (tapped.value
                                              ? AppColor.white
                                              : AppColor.white),
                              fontWeight: widget.fontWeight ?? FontWeight.w400,
                              fontSize: widget.fontSize,
                            ),
                            maxLines: 2,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            );
          }),
    );
  }
}
