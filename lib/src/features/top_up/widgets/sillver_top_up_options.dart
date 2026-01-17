import '../../../core/core.dart';

class SillverTopUpOptions extends StatelessWidget {
  const SillverTopUpOptions({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopUpPageController());
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        controller.setSelectedOption(title);
      },
      child: Obx(
        ()=> Container(
          height: screenWidth < 800 ? 43 : 70,
          width: screenWidth < 800 ? 106 : 150,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: controller.isOptionSelected(title)
                  ? AppColor.appColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Text(title,
              style: AppTextStyle.bodyMedium(context)
                  .copyWith(
                  color: controller.isOptionSelected(title) ? AppColor.white
                      : Get.theme.brightness == Brightness.light ? AppColor.grey400 : AppColor.white,
                  fontWeight: FontWeight.bold
              )),
        ),
      ),
    );
  }
}