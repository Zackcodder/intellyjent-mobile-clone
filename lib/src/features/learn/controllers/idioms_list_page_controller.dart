import 'package:flutter_tts/flutter_tts.dart';

import 'package:intellyjent/src/core/core.dart';
import 'package:intl/intl.dart';

class IdiomsListPageController extends GetxController {
  RxString idiom = ''.obs;
  RxString phonetic = ''.obs;
  RxString audioUrl = ''.obs;
  RxBool anyItemSelected = false.obs;
  RxBool isLoading = false.obs;
  RxList<Map<String, dynamic>> meanings = <Map<String, dynamic>>[].obs;
  RxList<Idiom> idiomList = <Idiom>[].obs;
  RxBool isPlaying = false.obs;
  RxList<bool> tickBoxStates = <bool>[].obs;
  RxBool isIdiomSaved = false.obs;

  final String endpoint;
  final String word;

  IdiomsListPageController(this.endpoint, this.word) {

    tickBoxStates.clear();
    anyItemSelected.value = false;
    tickBoxStates.addAll(List<bool>.filled(idiomList.length, false));
  }

  @override
  void onInit() {
    // Call fetchSaveWordIdiomStatus when the controller is initialized
    fetchIdiomStatus();
    super.onInit();
  }

  FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String word) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(word);
  }


  void toggleTickBoxState(int index) {
    tickBoxStates[index] = !tickBoxStates[index];
    anyItemSelected.value = tickBoxStates.contains(true);
  }

  Future<void> deleteSelectedItems() async {
    List<int> indicesToRemove = [];
    bool isSuccess = false;

    // Find indices of items to remove and remove them from dummyWordsList
    for (int i = tickBoxStates.length - 1; i >= 0; i--) {
      if (tickBoxStates[i]) {
        indicesToRemove.add(i);
      }
    }

    // Remove items from WordsList in reverse order to avoid index shifting
    for (int index in indicesToRemove..sort((a, b) => b.compareTo(a))) {
      try {
        await deleteSavedIdiom(idiomList[index].id);
        idiomList.removeAt(index);
        isSuccess = true; // Mark success if deletion was successful
      } catch (e) {
        // Handle individual deletion errors if needed
        print("Error deleting idiom with ID: ${idiomList[index].id}");
      }
    }

    // Update tickBoxStates indices after deletion
    for (int index in indicesToRemove) {
      tickBoxStates.removeAt(index);
    }

    // Update anyItemSelected value
    anyItemSelected.value = false;

    if (isSuccess) {
      Fluttertoast.showToast(
        msg: 'Success',
        backgroundColor: AppColor.green,  // Example success color
        textColor: AppColor.white,
      );
    }

    print("Deleted indices: $indicesToRemove");
    print("Remaining dummyWordsList: $idiomList");
    print("Remaining tickBoxStates: $tickBoxStates");
  }

  String formatDate(DateTime dateTime) {
    DateTime now = DateTime.now();
    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return DateFormat.Hm().format(dateTime); // Show only time if it's today
    } else {
      return DateFormat('yyyy-MM-dd').format(dateTime); // Show full date and time
    }
  }


  Future<void> postSaveIdiom(String id, String endpoint) async {
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
    );

    if (response.status) {
      isIdiomSaved.value = true;

    } else {
      Fluttertoast.showToast(
          msg: 'An error occurred',
          backgroundColor: AppColor.appColor,
          textColor: AppColor.white);
      throw Exception('No Internet Connection');
    }
  }

  Future<void> deleteSavedIdiom(String id) async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    if (!isConnected) {
      Fluttertoast.showToast(
        msg: 'No Internet Connection',
        backgroundColor: AppColor.red,
        textColor: AppColor.white,
      );
      throw Exception('No Internet Connection');
    }

    // Assuming you're using the same HttpHelper instance
    HttpResponse response = await HttpHelper.instance.postRequestStatusResponse(
      "bookchamp/saved-idioms/$id/remove",
    );

    if (response.status) {
      // Handle successful deletion
    } else {
      Fluttertoast.showToast(
        msg: 'An error occurred while deleting the word',
        backgroundColor: AppColor.appColor,
        textColor: AppColor.white,
      );
      throw Exception('Error deleting the word');
    }
  }


  Future<void> fetchIdiomStatus() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    isLoading.value = true;
    if (!isConnected) {
      Fluttertoast.showToast(
        msg: 'No Internet Connection',
        backgroundColor: AppColor.red,
        textColor: AppColor.white,
      );
      isLoading.value = false;
      throw Exception('No Internet Connection');
    }

    try {
      Map<String, dynamic> response = await HttpHelper.instance.getDynamicRequest(
        "bookchamp/$endpoint",
        '',
      );

      isLoading.value = false;
      if (response['status'] == 'success') {
        List<dynamic> resultList = response['data']['results'];

        if (resultList.isNotEmpty) {
          // Clear the current list
          idiomList.clear();

          // Add new idioms to the list
          idiomList.addAll(resultList.map((item) => Idiom.fromJson(item)).toList());

          // Update tickBoxStates based on the updated idiomList
          tickBoxStates.clear();
          tickBoxStates.addAll(List<bool>.filled(idiomList.length, false));
        }

        bool isIdiomFound = resultList
            .any((element) => element['idiom'].toLowerCase() == word.toLowerCase());
        isIdiomSaved.value = isIdiomFound;

      } else {
        Fluttertoast.showToast(
          msg: response['message'],
          backgroundColor: AppColor.appColor,
          textColor: AppColor.white,
        );
        throw Exception(response['message']);
      }
    } catch (e) {
      isLoading.value = false;
      Fluttertoast.showToast(
        msg: 'Unknown error occurred',
        backgroundColor: AppColor.appColor,
        textColor: AppColor.white,
      );
      throw Exception('Unknown error occurred');
    }
  }

}
