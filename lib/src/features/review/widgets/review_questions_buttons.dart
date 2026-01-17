import '../../../core/core.dart';

class ReviewButtonWidget extends StatefulWidget {
  final String? buttonText;
  final double fontSize;
  final int index;
  final FontWeight? fontWeight;
  final IconData? markIcon;
  final Color? textColor;
  final Color? buttonColor;
  final Color? borderColor;
  final QuestionReviewController controller;
  const ReviewButtonWidget({
    super.key,
    required this.buttonText,
    required this.fontSize,
    this.textColor,
    this.buttonColor,
    this.fontWeight,
    this.markIcon,
    required this.controller, required this.index, this.borderColor,
  });

  @override
  State<ReviewButtonWidget> createState() => _ReviewButtonWidgetState();
}

class _ReviewButtonWidgetState extends State<ReviewButtonWidget> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          width: double.infinity,
          height: screenWidth < 800 ? 55 : 100,
          child: ElevatedButton(
              onPressed:() {},
              style: ButtonStyle(
                textStyle: MaterialStateTextStyle.resolveWith(
                      (states) => GoogleFonts.inter(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {

                    return widget.buttonColor ?? Colors.transparent;
                  },
                ),
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) => RoundedRectangleBorder(
                    side: BorderSide(
                      color: widget.borderColor ?? AppColor.grey200,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.buttonText ?? '',
                      style: GoogleFonts.inter(
                        color:  Theme.of(context).brightness == Brightness.light
                            ? widget.buttonColor == AppColor.appColor
                              || widget.buttonColor ==  AppColor.red
                              || widget.buttonColor ==  AppColor.green ? AppColor.white : AppColor.appBlack
                            : widget.buttonColor == AppColor.appColor
                            || widget.buttonColor ==  AppColor.red
                            || widget.buttonColor ==  AppColor.green ? AppColor.white : AppColor.white,
                        fontWeight: widget.fontWeight ?? FontWeight.w400,
                        fontSize: widget.fontSize,
                      ), maxLines: 2, softWrap: true,
                    ),
                  ),
                  _buildIcon(),
                ],
              ),
            )
        ));
  }
  Widget _buildIcon() {
    if (widget.buttonColor == AppColor.green || widget.buttonColor == AppColor.appColor) {
      // Show checkmark for correct answer
      return Container(
        width: 20,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check,
          size: 17,
          color: AppColor.green,
        ),
      );
    }
    else if (widget.buttonColor == AppColor.red) {
      return Container(
        width: 20,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          size: 17,
          color: AppColor.red,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
