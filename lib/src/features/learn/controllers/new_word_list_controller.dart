
import 'package:intellyjent/src/core/core.dart';
import 'package:intl/intl.dart';

class NewWordListController extends GetxController {
  RxString newWord = ''.obs;
  RxBool anyItemSelected = false.obs;
  RxList<Map<String, dynamic>> meanings = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> newWordsList = <Map<String, dynamic>>[].obs;
  RxBool isPlaying = false.obs;
  RxList<bool> tickBoxStates = <bool>[].obs;
  RxBool isIdiomSaved = false.obs;
  RxBool isLoading = false.obs;

  RxList<Word> wordsList = <Word>[].obs;

  final String endpoint;
  final String word;

  NewWordListController(this.endpoint, this.word) {

    tickBoxStates.clear();
    anyItemSelected.value = false;
    tickBoxStates.addAll(List<bool>.filled(wordsList.length, false));
  }

  @override
  void onInit() {
    // Call fetchSaveWordIdiomStatus when the controller is initialized
    fetchWordsStatus();
    super.onInit();
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

    // Remove items from dummyWordsList in reverse order to avoid index shifting
    for (int index in indicesToRemove..sort((a, b) => b.compareTo(a))) {
      try {
        await deleteSavedWord(wordsList[index].id);
        wordsList.removeAt(index);
        isSuccess = true; // Mark success if deletion was successful
      } catch (e) {
        // Handle individual deletion errors if needed
        print("Error deleting idiom with ID: ${wordsList[index].id}");
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
    print("Remaining dummyWordsList: $wordsList");
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

  Future<void> deleteSavedWord(String id) async {
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
      "bookchamp/saved-words/$id/remove",
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

  Future<void> fetchWordsStatus() async {
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
        "bookchamp/saved-words",
        '',
      );
      isLoading.value = false;
      if (response['status'] == 'success') {
        List<dynamic> resultList = response['data']['results'];

        if (resultList.isNotEmpty) {
          // Clear the current list
          wordsList.clear();

          // Add new idioms to the list
          wordsList.addAll(resultList.map((item) => Word.fromJson(item)).toList());

          // Update tickBoxStates based on the updated idiomList
          tickBoxStates.clear();
          tickBoxStates.addAll(List<bool>.filled(wordsList.length, false));
        }

        bool isIdiomFound = resultList
            .any((element) => element['word'].toLowerCase() == word.toLowerCase());
        isIdiomSaved.value = isIdiomFound;

      } else {
        Fluttertoast.showToast(
          msg: response['message'],
          backgroundColor: AppColor.appColor,
          textColor: AppColor.white,
        );
        isLoading.value = false;
        throw Exception(response['message']);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Unknown error occurred',
        backgroundColor: AppColor.appColor,
        textColor: AppColor.white,
      );
      isLoading.value = false;
      throw Exception('error occurred $e');
    }
  }

}
