import 'package:intellyjent/src/core/core.dart';

class CustomRadioButton extends StatefulWidget {
  final CustomButtonDecoration decoration;
  final Function(String)? onChange;
  final String value;
  final String groupValue;
  const CustomRadioButton(
      {super.key,
      this.decoration = const CustomButtonDecoration(),
      required this.groupValue,
      required this.value,
      this.onChange});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late CustomButtonDecoration copiedDecoration;

  @override
  void initState() {
    copiedDecoration = const CustomButtonDecoration().copyWith(
        widget.decoration.activeColor,
        widget.decoration.unSelectedColor,
        widget.decoration.radius,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onChange != null) {
          widget.onChange!(widget.value);
        }
      },
      child: Padding(padding: const EdgeInsets.all(4),child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(copiedDecoration.radius+3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 1.5,
                    color: widget.groupValue == widget.value
                        ? copiedDecoration.activeColor
                        : copiedDecoration.unSelectedColor)),
          ),
          if (widget.groupValue == widget.value)
             CircleAvatar(
                  radius: copiedDecoration.radius, backgroundColor: copiedDecoration.activeColor),
            
        ],
      ),
    )
    );
  }
}

class CustomButtonDecoration {
  final Color activeColor;
  final Color unSelectedColor;
  final double radius;

  const CustomButtonDecoration(
      {this.activeColor = AppColor.appColor,
      this.radius = 7,
      this.unSelectedColor = const Color(0xffE6E6E6)});

  CustomButtonDecoration copyWith(Color? activeColor, Color? unSelectedColor,double? radius) =>
      CustomButtonDecoration(
          activeColor: activeColor ?? this.activeColor,
          radius: radius ?? this.radius,
          unSelectedColor: unSelectedColor ?? this.unSelectedColor);
}
