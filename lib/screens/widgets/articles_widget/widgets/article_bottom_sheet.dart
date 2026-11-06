import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/app_colors.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/screens/widgets/articles_widget/article_web_view_screen.dart';

class ArticleBottomSheet extends StatelessWidget {
  final Article article;
  const ArticleBottomSheet({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.lightPrimaryColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.lightPrimaryColor),
      ),
      child: Column(
        mainAxisSize: .min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              article.urlToImage ?? '',
              height: 220.h,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            article.content ?? '',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 56.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              backgroundColor: AppColors.lightSecondaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ArticleWebViewScreen(article: article),
                ),
              );
            },
            child: Text(
              'View Full Article',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

void showArticleSheet(BuildContext context, Article article) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => ArticleBottomSheet(article: article),
  );
}
