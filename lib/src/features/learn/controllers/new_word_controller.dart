import 'package:flutter_tts/flutter_tts.dart';

import 'package:intellyjent/src/core/core.dart';

class NewWordController extends GetxController {
  RxString savedWordIdiom = ''.obs;
  RxString savedMeaning = ''.obs;
  RxBool isIdiomSaved = false.obs;

  final String endpoint;
  final String word;

  NewWordController(this.endpoint, this.word);

  FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(word);
  }


  Future<void> postSaveWordIdiom(String id, String endpoint, String bodyText) async {
    print(id);
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (!isConnected) {
      Fluttertoast.showToast(
          msg: 'No Internet Connection',
          backgroundColor: AppColor.red,
          textColor: AppColor.white);
      throw Exception('No Internet Connection');
    }
    HttpResponse response = await HttpHelper.instance.postRequestStatusResponse(
      "bookchamp/articles/$id/$endpoint",
      body: {
        bodyText : savedWordIdiom.value,
        'meaning': savedMeaning.value
      }
    );

    if (response.status) {
      isIdiomSaved.value = true;
      Fluttertoast.showToast(
          msg: 'Saved!',
          backgroundColor: AppColor.green,
          textColor: AppColor.white);

    } else {
      Get.back();
      Fluttertoast.showToast(
          msg: response.message,
          backgroundColor: AppColor.appColor,
          textColor: AppColor.white);
      throw Exception(response.message);
    }
  }

}
