
import '../../../core/core.dart';

class LikeReadArchiveWidget extends StatelessWidget {
  final ArticlePageController ctl;
  final bool? showEye;

  const LikeReadArchiveWidget({
    super.key, required this.ctl, this.showEye = true,
  });

  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=> Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => ctl.isLiked.value == true
                  ? ctl.postArticleUpdate(ctl.article.value.id, 'unlike') : ctl.postArticleUpdate(ctl.article.value.id, 'like'),
              child: Row(
                children: [
                  SvgPicture.asset(
                    color: Get.theme.brightness == Brightness.light ? null
                        : ctl.isLiked.value? null : AppColor.white,
                    ctl.isLiked.value ?  Assets.heartIcon : Assets.heartEmpty, width: showEye == true ? 15 : 25,
                  ),
                  if ( showEye == true) AppSizing.w04,
                  if ( showEye == false) AppSizing.w08,
                  Text(ctl.likeCount.value.toString(), style: showEye == true
                      ? AppTextStyle.bodyVerySmall(context) : AppTextStyle.bodyMedium(context),)
                ],
              )),
          if (showEye == true ) Row(
            children: [
              SvgPicture.asset(
                Assets.eye, width: 18,
                color: ctl.isRead.value == true ? AppColor.appColor
                    : Get.theme.brightness == Brightness.light ? null: AppColor.white,
              ),AppSizing.w04,
              Text(ctl.viewCount.value.toString(), style: AppTextStyle.bodyVerySmall(context),)

            ],
          ),
          GestureDetector(
              onTap: () => ctl.isArchived.value == true ?
              ctl.postArticleUpdate(ctl.article.value.id, 'unarchive') : ctl.postArticleUpdate(ctl.article.value.id, 'archive'),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ctl.isArchived.value ? Assets.archiveArticleSelectedIcon : Assets.archiveIcon ,
                    color: Get.theme.brightness == Brightness.light ? null: ctl.isArchived.value ? null : AppColor.white,
                    width: showEye == true ? 15 : 25,
                  ),
                  if ( showEye == false) AppSizing.w08,
                 if ( showEye == false) Text('Archive', style: AppTextStyle.bodyMedium(context),)
                ],
              )),
          if (showEye == false) Container()
        ],
      ),
    );
  }
}
