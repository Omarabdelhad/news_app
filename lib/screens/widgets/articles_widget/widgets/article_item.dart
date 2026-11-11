import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/app_colors.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/screens/widgets/articles_widget/widgets/article_bottom_sheet.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showArticleSheet(context, article),
      child: Container(
        padding: REdgeInsets.all(8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.lightPrimaryColor),
        ),
        child: Column(
          spacing: 10.h,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl:  article.urlToImage ?? '',
                placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,size: 30.sp,),
                 
                height: 220.h,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              article.title ?? '',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 16.sp),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By : ${article.author ?? ''}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  timeago.format(DateTime.parse(article.publishedAt ?? '')),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
