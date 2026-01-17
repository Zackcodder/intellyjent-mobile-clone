import 'dart:io';
import 'src/core/core.dart';
import 'src/utils/http_overide.dart';
import 'package:intellyjent/src/features/quiz/pages/quiz_points_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("ff3957c5-ad43-4620-8071-64417a541248");
  OneSignal.Notifications.requestPermission(true);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    await GetStorage.init();
    SecureCache.init();
    await UserData.init();
    CloudinaryObject.fromCloudName(cloudName: 'bookchamp');
    HttpOverrides.global = MyHttpOverrides();
    // Get.put(ConnectionService());
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DarkModeController darkModeController = Get.put(DarkModeController());
    darkModeController.updateSystemUiOverlayStyle();

    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(_calculateTextScaleFactor(context)),
        ),
        child: GetMaterialApp(
          title: 'Intellyjent',
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          useInheritedMediaQuery: true,
          theme: darkModeController.themeData,
          initialBinding: OnBoardingControllerBindings(),
          home: UserData.token != null ? const Root() : const SplashPage(),
        ),
      ),
    );
  }

  double _calculateTextScaleFactor(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth < 800 ? 1.0 : 1.9;

    return scaleFactor;
  }
}

class OnBoardingControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardingController());
  }

  void migrateScores() {
    ScoreStorage.migrateOldScores();
  }
}


 //points
                                          // Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   children: [
                                          //     Text(
                                          //       'Points',
                                          //       style: AppTextStyle
                                          //               .bodySmallHeavy(context)
                                          //           .copyWith(
                                          //               fontWeight:
                                          //                   FontWeight.normal,
                                          //               color: AppColor.white),
                                          //     ),
                                          //     Text(
                                          //       controller.selectedGem.value
                                          //                   .name ==
                                          //               'Emerald'
                                          //           ? bestGameScore
                                          //               .toStringAsFixed(0)
                                          //           : controller.selectedGem
                                          //                       .value.name ==
                                          //                   'Diamond'
                                          //               ? 'DA'
                                          //               : controller
                                          //                           .selectedGem
                                          //                           .value
                                          //                           .name ==
                                          //                       'Ruby'
                                          //                   ? "RB"
                                          //                   : "SP",
                                          //       style: AppTextStyle
                                          //               .bodySmallHeavy(context)
                                          //           .copyWith(
                                          //               fontWeight:
                                          //                   FontWeight.w700,
                                          //               color: AppColor.white,
                                          //               fontSize: 18),
                                          //     ),
                                          //   ],
                                          // ),
                                          // ColumnDivider(
                                          //     screenHeight: screenHeight,
                                          //     color: AppColor.white),
                                          // // sillver
                                          // Column(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.center,
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     Text('Sillver',
                                          //         style: AppTextStyle
                                          //                 .bodySmallHeavy(
                                          //                     context)
                                          //             .copyWith(
                                          //                 fontWeight:
                                          //                     FontWeight.normal,
                                          //                 color:
                                          //                     AppColor.white)),
                                          //     Text(
                                          //       controller
                                          //               .userData.value?.points
                                          //               .toString() ??
                                          //           '--',
                                          //       style: AppTextStyle
                                          //               .bodySmallHeavy(context)
                                          //           .copyWith(
                                          //               fontWeight:
                                          //                   FontWeight.w700,
                                          //               color: AppColor.white,
                                          //               fontSize: 18),
                                          //     ),
                                          //   ],
                                          // ),

  // Future<bool> updateScore() async {
  //   await HttpHelper.instance.patchRequest(
  //     "bookchamp/games/${quiz.id}/end-game",
  //     body: {"score": score.value},
  //   ).then((value) async {
  //     if (value.status) {
  //       dynamic newScore = (value as SuccessResponse).result["score"];

  //       // Check if the new score is greater than the current UserData.score
  //       if (newScore != null) {
  //         Fluttertoast.showToast(
  //           msg: 'Score saved!',
  //           backgroundColor: AppColor.appColor,
  //           textColor: AppColor.white,
  //         );
  //         return true;
  //       }
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: 'Error Saving score!',
  //         backgroundColor: AppColor.red,
  //         textColor: AppColor.white,
  //       );
  //       ErrorResponse errors = (value as ErrorResponse);

  //       print(errors.errors.isEmpty
  //           ? errors.message
  //           : errors.errors.first.errorMessage.first);
  //       return false;
  //     }
  //   });
  //   return true;
  // }
