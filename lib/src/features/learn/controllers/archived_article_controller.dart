
import '../../../core/core.dart';

class ArchivedArticlePageController extends GetxController implements ArticleListController{
  RxList<ArticlePageController> articleControllers = <ArticlePageController>[].obs;
  Rx<List<Article>> archivedArticles = Rx<List<Article>>([]);
  Rx<List<Article>> searchResults = Rx<List<Article>>([]);
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();

    fetchArchivedArticles();

  }
  @override
  void updateArticleLikedStatus(int index, bool isLiked) {
    archivedArticles.value[index] = archivedArticles.value[index].copyWith(liked: isLiked);
    update();
  }

  @override
  void updateArticleArchivedStatus(int index, bool isArchived) {
    archivedArticles.value[index] = archivedArticles.value[index].copyWith(archived: isArchived);
    update();
  }

  @override
  void updateArticleReadCount(int index, int readCount) {
    archivedArticles.value[index] = archivedArticles.value[index].copyWith(views: archivedArticles.value[index].views + readCount);
    update();
  }

  Future<void> fetchArchivedArticles() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    isLoading.value = true;
    if (!isConnected) {
      Fluttertoast.showToast(
          msg: 'No Internet Connection',
          backgroundColor: AppColor.red,
          textColor: AppColor.white);
      isLoading.value = false;
      throw Exception('No Internet Connection');
    }
    // String encodedCategory = Uri.encodeComponent(category);
    // print(encodedCategory);
    update();
    HttpResponse response = await HttpHelper.instance.getRequest(
      "bookchamp/articles/all_archived",
      converter: (json) {
        return (json as List).map((e) => Article.fromJson(e)).toList();
      },
    );

    isLoading.value = false;
    if (response.status) {
      print((response as SuccessResponse).result);
      List<Article> fetchedArticles =  (response).result;
      // Process the body of each article to replace formatting markers
      List<Article> processedArticles = fetchedArticles.map((article) {
        return article.copyWith(
          body: processFormattedText(article),
        );
      }).toList();
      archivedArticles.value.assignAll(processedArticles);
      articleControllers.value = List.generate(
        archivedArticles.value.length,
            (index) => ArticlePageController(this, index, archivedArticles.value[index].obs),
      );
      update();
    } else {
      archivedArticles.value.clear();
      print(response);
      update();
    }
  }

  Future<void> unArchiveArticle(String id,) async {
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
      "bookchamp/articles/$id/unarchive",
    );

    print(response);

    if (response.status) {

      Fluttertoast.showToast(
          msg: 'Success',
          backgroundColor: AppColor.green,  // Example success color
          textColor: AppColor.white,);

    } else {
      Fluttertoast.showToast(
        msg: response.message,
        backgroundColor: AppColor.appColor,
        textColor: AppColor.white,
      );
    }
  }

  String processFormattedText(Article article) {
    String text = article.body;

    // Replace markdown-style headers with HTML headers
    text = text.replaceAllMapped(RegExp(r'## (.+?)\r\n\r\n'), (match) => '<h2>${match[1]}</h2><p>');

    // Replace double newlines with closing and opening <p> tags
    text = text.replaceAll('\r\n\r\n', '</p><p>');

    // Replace single newline with <br> tag
    text = text.replaceAll('\r\n', '<br>');

    // Helper function to replace text case-insensitively
    String replaceAllCaseInsensitive(String originalText, String pattern, String replacement) {
      return originalText.replaceAllMapped(
        RegExp(pattern, caseSensitive: false),
            (match) => replacement.replaceFirst(RegExp(pattern, caseSensitive: false), match[0]!),
      );
    }

    // Highlight idioms
    if (article.idioms1.isNotEmpty) {
      String idiom1 = article.idioms1.split(':')[0];
      text = replaceAllCaseInsensitive(text, idiom1, '<a href="#idiom1">$idiom1</a>');
    }
    if (article.idioms2.isNotEmpty) {
      String idiom2 = article.idioms2.split(':')[0];
      text = replaceAllCaseInsensitive(text, idiom2, '<a href="#idiom2">$idiom2</a>');
    }
    if (article.idioms3.isNotEmpty) {
      String idiom3 = article.idioms3.split(':')[0];
      text = replaceAllCaseInsensitive(text, idiom3, '<a href="#idiom3">$idiom3</a>');
    }

    // Highlight new words
    if (article.newWord1 != null && article.newWord1!.isNotEmpty) {
      String newWord1 = article.newWord1!.split(':')[0];
      text = replaceAllCaseInsensitive(text, newWord1, '<a href="#newWord1">$newWord1</a>');
    }
    if (article.newWord2 != null && article.newWord2!.isNotEmpty) {
      String newWord2 = article.newWord2!.split(':')[0];
      text = replaceAllCaseInsensitive(text, newWord2, '<a href="#newWord2">$newWord2</a>');
    }
    if (article.newWord3 != null && article.newWord3!.isNotEmpty) {
      String newWord3 = article.newWord3!.split(':')[0];
      text = replaceAllCaseInsensitive(text, newWord3, '<a href="#newWord3">$newWord3</a>');
    }

    return text;
  }

  //search
  void searchArticles(String query) {
    print(searchResults);
    if (query.isEmpty) {
      // Clear search results if the query is empty
      searchResults.value.clear();
      return;
    }

    // Perform search logic here
    searchResults.value = archivedArticles.value.where((article) =>
        article.body.toLowerCase().contains(query.toLowerCase())).toList();
  }

}