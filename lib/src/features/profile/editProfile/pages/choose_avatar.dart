import 'dart:io';

import 'package:intellyjent/src/core/core.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        toolbarHeight: 90,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                Assets.assetsArrowLeft, color: Get.theme.brightness == Brightness.light
                  ? AppColor.grey200
                  : AppColor.white,
              ),
            )),
        title: Text(
          "Choose Avatar",
          style: AppTextStyle.h3Regular(context),
        ),
      ),
      body: GetBuilder<EditProfileController>(builder: (controller) {
        return Padding(
          padding: MediaQuery.of(context).size.width <800
              ? const EdgeInsets.symmetric(horizontal: 20)
              : const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Expanded(
                  child: Obx(
                () => GridView.builder(
                  itemCount: controller.avatars.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) => index ==
                          controller.avatars.length
                      ? Theme(
                          data: ThemeData().copyWith(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hintColor: Colors.transparent),
                          child: InkWell(
                              onTap: () => controller.selectImageFromFile(),
                              child: Padding(
                                padding: const EdgeInsets.all(9),
                                child: CircleAvatar(
                                  backgroundColor: const Color(0xffF9FAFF),
                                  child: SvgPicture.string(
                                      """<svg width="33" height="33" viewBox="0 0 33 33" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M29.81 23.32L25.5063 13.2687C24.0488 9.85874 21.3675 9.72124 19.5663 12.9662L16.9675 17.655C15.6475 20.0337 13.1863 20.24 11.4813 18.1087L11.1788 17.7237C9.40502 15.4962 6.90252 15.7712 5.62377 18.315L3.25877 23.0587C1.59502 26.3587 4.00127 30.25 7.68627 30.25L25.2313 30.25C28.8063 30.25 31.2125 26.6062 29.81 23.32Z" stroke="#B0B0B0" stroke-width="2.0625" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9.58374 11C11.8619 11 13.7087 9.15317 13.7087 6.875C13.7087 4.59682 11.8619 2.75 9.58374 2.75C7.30557 2.75 5.45874 4.59683 5.45874 6.875C5.45874 9.15317 7.30557 11 9.58374 11Z" stroke="#B0B0B0" stroke-width="2.0625" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
"""),
                                ),
                              )))
                      : Obx(() => InkWell(
                            onTap: () => controller
                                .selectAvatar(controller.avatars[index]),
                            child: Container(
                              margin: const EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: controller.avatars[index] ==
                                        controller.selectedAvatar.value
                                    ? Border.all(
                                        width: 2, color: AppColor.appColor)
                                    : null,
                                image: controller.avatars[index]
                                        .startsWith("assets")
                                    ? null
                                    : DecorationImage(
                                        image: FileImage(
                                            File(controller.avatars[index])),
                                        fit: BoxFit.cover),
                              ),
                              child: controller.avatars[index]
                                  .startsWith("assets")
                                  ? SvgPicture.asset(controller.avatars[index], fit: BoxFit.cover,) : null
                            ),
                          )),
                ),
              )),
              ButtonWidget(
                  buttonText: 'Save',
                  fontSize: 17,
                  textColor: AppColor.white,
                  borderSideColor: Colors.transparent,
                  shouldShowLoader: true,
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColor.appColor),
                  onPressed: () async {
                    await controller.uploadImage(context);
                  }),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 30,
              )
            ],
          ),
        );
      }),
    );
  }
}
