
import '../../../core/core.dart';

class ArticleListPageController extends GetxController implements ArticleListController{
  Rx<List<Article>> articles = Rx<List<Article>>([]);
  Rx<List<Article>> searchResults = Rx<List<Article>>([]);
  RxList<ArticlePageController> articleControllers = <ArticlePageController>[].obs;
  RxString currentCategoryImage = Assets.career.obs;
  RxString currentCategory = ''.obs;
  RxBool showSearch = false.obs;
  RxBool isLoading = false.obs;
  Rx<List<String>> categoryList = Rx<List<String>>([
    'Career',
    'Entertainment',
    'Finance',
    'Places',
    'Gist',
    'Global Matters',
    'Grammar',
    'Health',
    'History',
    'Leadership 101',
    'Lifestyle',
    'Personalities',
    'Politics',
    'Science',
    'Socials',
    'Spark',
    'Sports',
    'Specials',
    'Nutrition',
    'Nature',
  ]);


  @override
  void onInit() {
    super.onInit();
    articleControllers.value = List.generate(
      articles.value.length,
          (index) => ArticlePageController(this, index, articles.value[index].obs),
    );
  }

  Future<void> loadCategoryData(String category) async {
    articles.value.clear();
    showSearch.value = false;

    // Replace this with actual data for each category
    switch (category) {
      case 'Places':
        currentCategoryImage.value = Assets.places;
        await fetchCategoryData('Places');
        break;
      case 'Finance':
        currentCategoryImage.value = Assets.finance;
        await fetchCategoryData('Finance');
        break;
      case 'History':
        currentCategoryImage.value = Assets.history;
        await fetchCategoryData('History');
        break;
      case 'Entertainment':
        currentCategoryImage.value = Assets.entertainment;
        await fetchCategoryData('Entertainment');
        break;
      case 'Health':
        currentCategoryImage.value = Assets.health;
        await fetchCategoryData('Health');
        break;
      case 'Lifestyle':
        currentCategoryImage.value = Assets.lifestyle;
        await fetchCategoryData('Lifestyle');
        break;
      case 'Politics':
        currentCategoryImage.value = Assets.politics;
        await fetchCategoryData('Politics');
        break;
      case 'Science':
        currentCategoryImage.value = Assets.science;
        await fetchCategoryData('Science');
        break;
      case 'Socials':
        currentCategoryImage.value = Assets.socials;
        await fetchCategoryData('Socials');
        break;
      case 'Sports':
        currentCategoryImage.value = Assets.sports;
        await fetchCategoryData('Sports');
        break;
      case 'Global Matters':
        currentCategoryImage.value = Assets.globalMatters;
        await fetchCategoryData('Global Matters');
        break;
      case 'Career':
        currentCategoryImage.value = Assets.career;
        await fetchCategoryData('Career');
        break;
      case 'Gist':
        currentCategoryImage.value = Assets.gist;
        await fetchCategoryData('Gist');
        break;
      case 'Personalities':
        currentCategoryImage.value = Assets.personalities;
        await fetchCategoryData('Personalities');
        break;
      case 'Spark':
        currentCategoryImage.value = Assets.spark;
        await fetchCategoryData('Spark');
        break;
      case 'Leadership 101':
        currentCategoryImage.value = Assets.leadership101;
        await fetchCategoryData('Leadership 101');
        break;
      case 'Specials':
        currentCategoryImage.value = Assets.specials;
        await fetchCategoryData('Specials');
        break;
      case 'Grammar':
        currentCategoryImage.value = Assets.grammar;
        await fetchCategoryData('Grammar');
        break;
      case 'Nutrition':
        currentCategoryImage.value = Assets.nutrition;
        await fetchCategoryData('Nutrition');
        break;
      case 'Nature':
        currentCategoryImage.value = Assets.nature;
        await fetchCategoryData('Nature');
        break;
      default:
        break;
    }
    currentCategory.value = category;
    Get.to(() => const ArticleListPage(), transition: Transition.upToDown);
  }

  Future<void> fetchCategoryData(String category) async {
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
      "bookchamp/articles/all?category=$category",
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
      articles.value.assignAll(processedArticles);
      articleControllers.value = List.generate(
        articles.value.length,
            (index) => ArticlePageController(this, index, articles.value[index].obs),
      );
      update();
    } else {
      articles.value.clear();
      print(response);
      update();
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
      pattern = sanitizePattern(pattern); // Sanitize the pattern
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

  String sanitizePattern(String pattern) {
    // Escape special regex characters if needed
    return pattern.replaceAll(RegExp(r'([\^\$\.\|\?\*\+\(\)\[\]\{\}\\])'), r'\\$1');
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
    searchResults.value = articles.value.where((article) =>
    article.body.toLowerCase().contains(query.toLowerCase()) ||
        article.title.toLowerCase().contains(query.toLowerCase())).toList();
  }


  @override
  void updateArticleLikedStatus(int index, bool isLiked) {
    articles.value[index] = articles.value[index].copyWith(liked: isLiked);
    update();
  }

  @override
  void updateArticleArchivedStatus(int index, bool isArchived) {
    articles.value[index] = articles.value[index].copyWith(archived: isArchived);
    update();
  }

  @override
  void updateArticleReadCount(int index, int readCount) {
    articles.value[index] = articles.value[index].copyWith(views: articles.value[index].views + readCount);
    update();
  }


}