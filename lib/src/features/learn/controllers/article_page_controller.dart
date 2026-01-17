import '../../../core/core.dart';

class ArticlePageController extends GetxController {
  final ArticleListController  articleListController;
  final profileController = Get.put(ProfilePageController());
  final int articleIndex;
  RxBool showFullContent = false.obs;
  RxBool isLiked = false.obs;
  RxBool isRead = false.obs;
  RxBool isArchived = false.obs;
  RxInt chargeForFullRead = 1.obs;
  RxInt viewCount = 0.obs;
  RxInt likeCount = 0.obs;
  Rx<Article> article;

  ArticlePageController(this.articleListController, this.articleIndex, this.article) {
    isLiked.value = article.value.liked;
    isRead.value = article.value.read;
    showFullContent.value = article.value.read;
    isArchived.value = article.value.archived;
    viewCount.value = article.value.views;
    likeCount.value = article.value.likes;
    chargeForFullRead.value = article.value.silverCount;
  }


  Future<void> postArticleUpdate(String id, String endpoint) async {
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

    print(response);
    
    if (response.status) {
      switch (endpoint) {
        case 'like':
          isLiked.value = true;
          likeCount.value += 1;
          articleListController.updateArticleLikedStatus(articleIndex, true);
          profileController.getUserData();
          break;
        case 'unlike':
          isLiked.value = false;
          likeCount.value -= 1;
          articleListController.updateArticleLikedStatus(articleIndex, false);
          profileController.getUserData();
          break;
        case 'archive':
          isArchived.value = true;
          articleListController.updateArticleArchivedStatus(articleIndex, true);
          profileController.getUserData();
          break;
        case 'unarchive':
          isArchived.value = false;
          articleListController.updateArticleArchivedStatus(articleIndex, false);
          profileController.getUserData();
          break;
        case 'read':
          isRead.value = true;
          showFullContent.value = true;
          viewCount.value += 1;
          articleListController.updateArticleReadCount(articleIndex, 1);
          profileController.getUserData();
      }

    } else {
      Fluttertoast.showToast(
        msg: 'Sorry, you are out of Sillver -top up',
        backgroundColor: AppColor.appColor,
        textColor: AppColor.white,
      );
    }
  }
}

abstract class ArticleListController {
  void updateArticleLikedStatus(int index, bool isLiked);
  void updateArticleArchivedStatus(int index, bool isArchived);
  void updateArticleReadCount(int index, int readCount);
}
