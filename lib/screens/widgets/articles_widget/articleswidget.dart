import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/app_constants.dart';
import 'package:news_app/screens/widgets/articles_widget/widgets/article_list.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstants.dummySourcesList.length,
      child: Padding(
        padding: REdgeInsetsDirectional.only(start: 16, top: 16),
        child: Column(
          spacing: 16.h,

          children: [
            TabBar(
              isScrollable: true,

              tabs: AppConstants.dummySourcesList
                  .map((source) => Tab(text: source))
                  .toList(),
            ),
            Expanded(
              child: Padding(
                padding: REdgeInsetsDirectional.only(end: 16),
                child: TabBarView(
                  children: AppConstants.dummySourcesList
                      .map((source) => ArticleList())
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
