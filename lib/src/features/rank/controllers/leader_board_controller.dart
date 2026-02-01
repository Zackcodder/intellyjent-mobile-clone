import 'package:intellyjent/src/core/core.dart';

class LeaderBoardController extends GetxController {
  Rx<List<LeaderboardItem>> data = Rx<List<LeaderboardItem>>([]);
  Rx<List<LastWeeksWinners>> dataLastWeek = Rx<List<LastWeeksWinners>>([]);
  Rx<Pagination?> pageController = Rx<Pagination?>(null);
  Rx<Iterable?> pageObject = Rx<Iterable?>(null);

  @override
  void onInit() async {
    print('leaderboard init');
    data(await getLeaderBoardData());
    dataLastWeek(await getLastWeeksWinnersData());
    data.value.sort((a, b) => a.score.compareTo(b.score));
    data(data.value.reversed.toList());
    pageController(Pagination(perPage: 10, objects: data.value));
    pageObject(pageController.value!.currentPageObject());

    // Listen to changes in selectedGem and refresh data when it changes
    final ProfilePageController profileController = Get.find();
    ever(profileController.selectedGem, (_) async {
      print('Game mode changed, refreshing leaderboard data');
      await refreshData();
    });

    super.onInit();
  }

  Future refreshData() async {
    data(await getLeaderBoardData());
    dataLastWeek(await getLastWeeksWinnersData());
    data.value.sort((a, b) => a.score.compareTo(b.score));
    data(data.value.reversed.toList());
    pageController(Pagination(perPage: 10, objects: data.value));
    pageObject(pageController.value!.currentPageObject());
  }

  Future<List<LeaderboardItem>> getLeaderBoardData() async {
    print('getting all leaders');
    final ProfilePageController profileController = Get.find();
    String leaderboardPath;
    print('getting all leaders3');
    print(
        'getting all leaders2 - ${profileController.selectedGem.value.name.toLowerCase()}');

    switch (profileController.selectedGem.value.name.toLowerCase()) {
      case 'ruby':
        leaderboardPath = 'ruby-leaderboard';
        break;
      case 'diamond':
        leaderboardPath = 'diamond-leaderboard';
        break;
      case 'sapphire':
        leaderboardPath = 'sapphire-leaderboard';
        break;
      default:
        leaderboardPath = 'leaderboard';
    }
    print('getting all leaders11 - $leaderboardPath');

    HttpResponse response = await HttpHelper.instance
        .getRequest("bookchamp/games/$leaderboardPath", converter: (json) {
      print('leadrboard:::: $json');
      return (json as List).map((e) => LeaderboardItem.fromJson(e)).toList();
    });
    if (response.status) {
      print((response as SuccessResponse).result);
      return (response).result;
    }
    return [];
  }

  Future<List<LastWeeksWinners>> getLastWeeksWinnersData() async {
    print('getting top 3 leaders');
    final ProfilePageController profileController = Get.find();
    String winnerPath;
    switch (profileController.selectedGem.value.name.toLowerCase()) {
      case 'ruby':
        winnerPath = 'bookchamp/winners/ruby/';
        break;
      case 'diamond':
        winnerPath = 'bookchamp/winners/diamond/';
        break;
      case 'sapphire':
        winnerPath = 'bookchamp/winners/sapphire/';
        break;
      default:
        winnerPath = 'bookchamp/winners/';
    }
    HttpResponse response =
        await HttpHelper.instance.getRequest(winnerPath, converter: (json) {
      print('last weeks winners ::: $json');
      return (json as List).map((e) => LastWeeksWinners.fromJson(e)).toList();
    });
    if (response.status) {
      print((response as SuccessResponse).result);
      return (response).result;
    }
    return [];
  }

  onPageChange(ControllerAction action) {
    if (action == ControllerAction.next) {
      pageController.value!.nextPage();
    } else {
      pageController.value!.prevPage();
    }
    pageObject(pageController.value!.currentPageObject());
  }

  int getPositionByUsername(String username) {
    for (int i = 0; i < data.value.length; i++) {
      if (data.value[i].username == username) {
        return i + 1;
      }
    }
    return -1;
  }
}
