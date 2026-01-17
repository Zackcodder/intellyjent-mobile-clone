class Pagination {
  late int initialPage;
  late int currentPage;
  late bool hasPrev;
  late bool hasNext;
  late int totalPage;
  late int perPage;
  final Iterable objects;

  Pagination({required this.perPage, required this.objects}) {
    int totalItem = objects.length;
    if (totalItem == 0) {
      initialPage = 0;
      currentPage = 0;
      hasPrev = false;
      hasNext = false;
      totalPage = 0;
      return;
    }
    if (perPage > totalItem) {
      perPage = totalItem;
    }
    initialPage = 1;
    currentPage = 1;
    hasPrev = false;
    hasNext = (totalItem / perPage > 1);
    totalPage = totalItem / perPage < 0
        ? 1
        : totalItem % perPage > 0
            ? (totalItem / perPage).floor() + 1
            : (totalItem / perPage).floor();
  }

  Iterable currentPageObject() {
    int endIndex = currentPage * perPage;
    int startIndex = ((currentPage - 1)) * perPage;
    return objects
        .skip(startIndex < 0 ? 0 : startIndex)
        .take(endIndex - startIndex);
  }

  void nextPage() {
    hasPrev = true;
    if (hasNext) {
      currentPage += 1;
    }
    if (currentPage == totalPage) {
      hasNext = false;
    }
  }

  void prevPage() {
    hasNext = true;
    if (currentPage > initialPage) {
      currentPage--;
    } else {
      currentPage = initialPage;
      hasPrev = false;
    }
  }
}

enum ControllerAction { prev, next }
