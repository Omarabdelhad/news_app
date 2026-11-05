import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/remote/network/api_manager.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/screens/widgets/articles_widget/widgets/article_item.dart';

class ArticleList extends StatefulWidget {
  final String sourceId;
  const ArticleList({super.key, required this.sourceId});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(widget.sourceId),
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
        List<Article> articles = response?.articles ?? [];
        if (articles.isEmpty) {
          return Text('No Articles Found',style:Theme.of(context).textTheme.headlineMedium ,);
        }
        return ListView.separated(
          itemBuilder: (context, index) =>
              ArticleItem(article: articles[index]),
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: articles.length,
        );
      },
    );
  }
}
