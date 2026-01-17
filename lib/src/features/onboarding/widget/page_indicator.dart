import '../../../core/core.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Obx(
      () {
        // print();
        return Wrap(
          spacing: 3,
          runAlignment: WrapAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              width: controller.pageIndex.value.floor() == index
                  ? (20 + (20 * ((index + 1) - (controller.pageIndex.value))))
                :controller.pageIndex.value.round() == index?40:  20,
              height: 7,
              decoration: ShapeDecoration(
                  shape: const StadiumBorder(),
                  color: controller.pageIndex.value.round() == index
                      ? AppColor.appColor
                      : AppColor.lightBlue),
            );
          }),
        );
      },
    );
  }
}
