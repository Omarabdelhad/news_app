import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/remote/network/api_manager.dart';
import 'package:news_app/core/resources/app_constants.dart';
import 'package:news_app/models/sources/source.dart';
import 'package:news_app/screens/widgets/articles_widget/widgets/article_list.dart';

class ArticlesWidget extends StatefulWidget {
  final String categoryId;
  const ArticlesWidget({super.key, required this.categoryId,
  });

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Text('No Internet Connection'),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Try again'),
              ),
            ],
          );
        }
        var response = snapshot.data;
        if (response?.status == 'error') {
          return Column(
             mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Text(response?.message ?? ''),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text('Try again'),
              ),
            ],
          );
        }
        List<Source> sources = response?.sources ?? [];
        return DefaultTabController(
          length: sources.length,
          child: Padding(
            padding: REdgeInsetsDirectional.only(start: 16, top: 16),
            child: Column(
              spacing: 16.h,

              children: [
                TabBar(
                  isScrollable: true,

                  tabs: sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: REdgeInsetsDirectional.only(end: 16),
                    child: TabBarView(
                      children: sources
                          .map((source) => ArticleList(sourceId: source.id??'',))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      future: ApiManager.getSources(widget.categoryId),
    );
  }
}
