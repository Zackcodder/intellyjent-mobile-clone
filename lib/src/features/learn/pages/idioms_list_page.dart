import '../../../core/core.dart';

class IdiomsListPage extends StatelessWidget {
  const IdiomsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final ctl = Get.put(IdiomsListPageController('saved-idioms',''));

    return Scaffold(
        appBar: AppBar(
            toolbarHeight: screenHeight < 640 ? 60 : 90,
            backgroundColor: Get.theme.brightness == Brightness.light
                ? AppColor.white
                : AppColor.darkAppBg,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: screenHeight < 650
                      ? const EdgeInsets.symmetric(vertical: 16)
                      : screenWidth < 800
                          ? const EdgeInsets.symmetric(vertical: 32)
                          : const EdgeInsets.symmetric(vertical: 25),
                  child: SvgPicture.asset(
                    Assets.assetsArrowLeft,
                    color: Get.theme.brightness == Brightness.light
                        ? AppColor.appBlack
                        : AppColor.white,
                  ),
                )),
            actions: [
              Obx(
                ()=> SizedBox(
                    width: 60,
                    child: GestureDetector(
                        onTap: () async => await ctl.deleteSelectedItems(),
                        child: SvgPicture.asset(
                            color: Get.theme.brightness == Brightness.light
                                ? null : ctl.anyItemSelected.value ? null : Colors.white,
                            ctl.anyItemSelected.value ? Assets.trashBlue : Assets.assetsDelete))),
              ),
              AppSizing.w04,
            ],
            title: Text('Idioms',
                style: AppTextStyle.h5(context)
                    .copyWith(fontWeight: FontWeight.bold))),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            padding: MediaQuery.of(context).size.width < 800
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                : const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () {
                    if (ctl.idiomList.isNotEmpty){
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ctl.idiomList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var idiom = ctl.idiomList[index].idiom;
                            var meaning = ctl.idiomList[index].meaning;

                            return GestureDetector(
                              onTap: ()=> Get.to(()=> SavedWordIdiomPage(
                                wordIdiom: idiom,
                                  isIdiom: true, meaning: meaning,
                              )),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppSizing.h18,
                                  Container(
                                    width: screenWidth,
                                    color: Theme.of(context).colorScheme.background,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(idiom, style: AppTextStyle.bodyMedium(context),),
                                            AppSizing.h04,
                                            // Text(date, style: AppTextStyle.bodyVerySmall(context),)
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (index < ctl.tickBoxStates.length) {
                                              ctl.toggleTickBoxState(index);
                                            }
                                          },
                                          child: Obx(
                                                () => SvgPicture.asset(
                                              (index < ctl.tickBoxStates.length && ctl.tickBoxStates[index])
                                                  ? Assets.tickSquare
                                                  : Assets.unTickSquare,
                                              width: 30,
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  AppSizing.h04,
                                  const Divider(height: 2, color: AppColor.grey200,)
                                ],
                              ),
                            );
                          });
                    }
                    else {
                      if (ctl.isLoading.value == true) {
                        return GetX<IdiomsListPageController>(
                          builder: (controller) {
                            if (controller.isLoading.value == true) {
                              return Container(
                                alignment: Alignment.topCenter,
                                width: double.infinity,
                                height: Get.height,
                                child: Center(
                                  child: LoadingAnimationWidget
                                      .threeArchedCircle(
                                      color: AppColor.appColor, size: 50),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        );
                      } else {
                        return Padding(
                          padding: MediaQuery
                              .of(context)
                              .size
                              .width < 800
                              ? const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 40)
                              : const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  Get.theme.brightness == Brightness.light
                                      ? Assets.emptyNewWordsImg : Assets
                                      .emptyNewWordsDarkImg),
                              AppSizing.h28,
                              Text('No idioms saved',
                                style: AppTextStyle.h4Regular(context),),
                              Text(
                                  'To have idioms go to learn page, read articles and save idioms.',
                                  style: AppTextStyle.bodyMedium(context)
                                      .copyWith(
                                      color: Get.theme.brightness ==
                                          Brightness.light
                                          ? AppColor.grey200 : AppColor.grey200
                                  ), textAlign: TextAlign.center),
                            ],
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
