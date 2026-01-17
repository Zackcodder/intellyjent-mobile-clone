import '../../../core/core.dart';

class CustomPageNumbering extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const CustomPageNumbering({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          icon: Icon(Icons.chevron_left,
          color: Theme.of(context).brightness == Brightness.light ? AppColor.appBlack : AppColor.white,),
        ),
        Row(
          children: List.generate(totalPages, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                onTap: () => onPageChanged(index + 1),
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: currentPage == index + 1 ? Colors.blue
                        : Theme.of(context).brightness == Brightness.light ? AppColor.appBlack : AppColor.white,
                  ),
                ),
              ),
            );
          }),
        ),
        IconButton(
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
          icon: Icon(Icons.chevron_right, color: Theme.of(context).brightness == Brightness.light ? AppColor.appBlack : AppColor.white,),
        ),
      ],
    );
  }
}
