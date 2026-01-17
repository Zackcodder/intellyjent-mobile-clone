import '../../../core/core.dart';

class PremiumListPageController extends GetxController
    implements ArticleListController {
  Rx<List<Article>> articles = Rx<List<Article>>([]);
  Rx<List<Article>> searchResults = Rx<List<Article>>([]);
  RxList<ArticlePageController> articleControllers =
      <ArticlePageController>[].obs;
  RxString currentCategoryImage = Assets.nutrition.obs;
  RxString currentCategory = ''.obs;
  RxBool showSearch = false.obs;
  RxBool isLoading = false.obs;
  Rx<List<String>> categoryList = Rx<List<String>>([
    'Career+',
    'Chronic Disease Management',
    'Entertainment+',
    'Finance+',
    'Gist+',
    'Global Matters+',
    'Grammar+',
    'General Health',
    'Health+',
    'History+',
    'Leadership 101+',
    'Lifestyle+',
    'Luxury',
    'Men’s Health',
    'Mental Health',
    'Nature+',
    'Nutrition+',
    'Parenting',
    'Personalities+',
    'Places+',
    'Politics+',
    'Preventive Health Care',
    'Relationship',
    'Science+',
    'Sleep Health',
    'Socials+',
    'Spark+',
    'Specials+',
    'Sports+',
    'Women’s Health',
  ]);


  @override
  void onInit() {
    super.onInit();
    articleControllers.value = List.generate(
      articles.value.length,
      (index) => ArticlePageController(this, index, articles.value[index].obs),
    );
  }

  // Methods to update article status
  @override
  void updateArticleLikedStatus(int index, bool isLiked) {
    articles.value[index] = articles.value[index].copyWith(liked: isLiked);
    update();
  }

  @override
  void updateArticleArchivedStatus(int index, bool isArchived) {
    articles.value[index] =
        articles.value[index].copyWith(archived: isArchived);
    update();
  }

  @override
  void updateArticleReadCount(int index, int readCount) {
    articles.value[index] = articles.value[index]
        .copyWith(views: articles.value[index].views + readCount);
    update();
  }

  Future<void> loadCategoryData(String category) async {
    articles.value.clear();
    showSearch.value = false;

    // Replace this with actual data for each category
    switch (category) {
      case 'Career':
        currentCategoryImage.value = Assets.career;
        await fetchCategoryData('Career%2B');
        break;
      case 'Chronic Disease Management':
        currentCategoryImage.value = Assets.chronicDiseaseMgt;
        await fetchCategoryData('Chronic Disease Management');
        break;
      case 'Entertainment+':
        currentCategoryImage.value = Assets.entertainment;
        await fetchCategoryData('Entertainment+');
        break;
      case 'Finance+':
        currentCategoryImage.value = Assets.finance;
        await fetchCategoryData('Finance%2B');
        break;
      case 'Gist+':
        currentCategoryImage.value = Assets.gist;
        await fetchCategoryData('Gist%2B');
        break;
      case 'Global Matters+':
        currentCategoryImage.value = Assets.globalMatters;
        await fetchCategoryData('Global Matters%2B');
        break;
      case 'Grammar+':
        currentCategoryImage.value = Assets.grammar;
        await fetchCategoryData('Grammar%2B');
        break;
      case 'General Health':
        currentCategoryImage.value = Assets.generalHealth;
        await fetchCategoryData('General Health');
        break;
      case 'Health+':
        currentCategoryImage.value = Assets.health;
        await fetchCategoryData('Health%2B');
        break;
      case 'History+':
        currentCategoryImage.value = Assets.history;
        await fetchCategoryData('History%2B');
        break;
      case 'Leadership 101+':
        currentCategoryImage.value = Assets.leadership101;
        await fetchCategoryData('Leadership 101%2B');
        break;
      case 'Lifestyle+':
        currentCategoryImage.value = Assets.lifestyle;
        await fetchCategoryData('Lifestyle%2B');
        break;
      case 'Luxury':
        currentCategoryImage.value = Assets.luxury;
        await fetchCategoryData('Luxury');
        break;
      case 'Men’s Health':
        currentCategoryImage.value = Assets.mensHealth;
        await fetchCategoryData('Men’s Health');
        break;
      case 'Mental Health':
        currentCategoryImage.value = Assets.mentalHealth;
        await fetchCategoryData('Mental Health');
        break;
      case 'Nature+':
        currentCategoryImage.value = Assets.nature;
        await fetchCategoryData('Nature%2B');
        break;
      case 'Nutrition+':
        currentCategoryImage.value = Assets.nutrition;
        await fetchCategoryData('Nutrition%2B');
        break;
      case 'Parenting':
        currentCategoryImage.value = Assets.parenting;
        await fetchCategoryData('Parenting');
        break;
      case 'Personalities+':
        currentCategoryImage.value = Assets.personalities;
        await fetchCategoryData('Personalities%2B');
        break;
      case 'Places+':
        currentCategoryImage.value = Assets.places;
        await fetchCategoryData('Places%2B');
        break;
      case 'Politics+':
        currentCategoryImage.value = Assets.politics;
        await fetchCategoryData('Politics%2B');
        break;
      case 'Preventive Health Care':
        currentCategoryImage.value = Assets.preventiveHealthCare;
        await fetchCategoryData('Preventive Health Care');
        break;
      case 'Relationship':
        currentCategoryImage.value = Assets.relationship;
        await fetchCategoryData('Relationship');
        break;
      case 'Science+':
        currentCategoryImage.value = Assets.science;
        await fetchCategoryData('Science%2B');
        break;
      case 'Sleep Health':
        currentCategoryImage.value = Assets.sleepHealth;
        await fetchCategoryData('Sleep Health');
        break;
      case 'Socials+':
        currentCategoryImage.value = Assets.socials;
        await fetchCategoryData('Socials%2B');
        break;
      case 'Spark+':
        currentCategoryImage.value = Assets.spark;
        await fetchCategoryData('Spark%2B');
        break;
      case 'Specials+':
        currentCategoryImage.value = Assets.specials;
        await fetchCategoryData('Specials%2B');
        break;
      case 'Sports+':
        currentCategoryImage.value = Assets.sports;
        await fetchCategoryData('Sports%2B');
        break;
      case 'Women’s Health':
        currentCategoryImage.value = Assets.womensHealth;
        await fetchCategoryData('Women’s Health');
        break;
      default:
        break;
    }
    // articleControllers.value = List.generate(
    //   articles.value.length,
    //       (index) => ArticlePageController(this, index, articles.value[index].obs),
    // );
    currentCategory.value = category;
    Get.to(() => const PremiumArticleListPage(), transition: Transition.upToDown);
  }

  String processFormattedText(Article article) {
    String text = article.body;

    // Replace markdown-style headers with HTML headers
    text = text.replaceAllMapped(
        RegExp(r'## (.+?)\r\n\r\n'), (match) => '<h2>${match[1]}</h2><p>');

    // Replace double newlines with closing and opening <p> tags
    text = text.replaceAll('\r\n\r\n', '</p><p>');

    // Replace single newline with <br> tag
    text = text.replaceAll('\r\n', '<br>');

    // Helper function to replace text case-insensitively
    String replaceAllCaseInsensitive(
        String originalText, String pattern, String replacement) {
      return originalText.replaceAllMapped(
        RegExp(pattern, caseSensitive: false),
        (match) => replacement.replaceFirst(
            RegExp(pattern, caseSensitive: false), match[0]!),
      );
    }

    // Highlight idioms
    if (article.idioms1.isNotEmpty) {
      String idiom1 = article.idioms1.split(':')[0];
      text = replaceAllCaseInsensitive(
          text, idiom1, '<a href="#idiom1">$idiom1</a>');
    }
    if (article.idioms2.isNotEmpty) {
      String idiom2 = article.idioms2.split(':')[0];
      text = replaceAllCaseInsensitive(
          text, idiom2, '<a href="#idiom2">$idiom2</a>');
    }
    if (article.idioms3.isNotEmpty) {
      String idiom3 = article.idioms3.split(':')[0];
      text = replaceAllCaseInsensitive(
          text, idiom3, '<a href="#idiom3">$idiom3</a>');
    }

    // Highlight new words
    if (article.newWord1 != null && article.newWord1!.isNotEmpty) {
      String newWord1 = article.newWord1!.split(':')[0];
      text = replaceAllCaseInsensitive(
          text, newWord1, '<a href="#newWord1">$newWord1</a>');
    }
    if (article.newWord2 != null && article.newWord2!.isNotEmpty) {
      String newWord2 = article.newWord2!.split(':')[0];
      text = replaceAllCaseInsensitive(
          text, newWord2, '<a href="#newWord2">$newWord2</a>');
    }
    if (article.newWord3 != null && article.newWord3!.isNotEmpty) {
      String newWord3 = article.newWord3!.split(':')[0];
      text = replaceAllCaseInsensitive(
          text, newWord3, '<a href="#newWord3">$newWord3</a>');
    }

    return text;
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
    String encodedCategory = Uri.encodeComponent(category);
    print(encodedCategory);
    update();
    HttpResponse response = await HttpHelper.instance.getRequest(
      "bookchamp/articles/all?category=$category",
      converter: (json) {
        return (json as List).map((e) => Article.fromJson(e)).toList();
      },
    );
    isLoading.value = false;
    if (response.status) {
      List<Article> fetchedArticles =  (response as SuccessResponse).result;
      // Process the body of each article to replace formatting markers

      print(fetchedArticles.length);
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
}
