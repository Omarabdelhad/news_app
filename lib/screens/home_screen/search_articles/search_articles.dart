import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/remote/network/api_manager.dart';
import 'package:news_app/core/resources/app_colors.dart';
import 'package:news_app/models/articles/articleResponse.dart';
import 'package:news_app/screens/widgets/articles_widget/widgets/article_item.dart';

class SearchArticles extends StatefulWidget {
  const SearchArticles({super.key});

  @override
  State<SearchArticles> createState() => _SearchArticlesState();
}

class _SearchArticlesState extends State<SearchArticles> {
  TextEditingController controller = TextEditingController();
  Future<ArticlesResponse>? future;
  @override
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 16.w,
        toolbarHeight: 70.h,
        title: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (String text) {
            final query = text.trim();
            setState(() {
              future = query.isEmpty ? null : ApiManager.searchArticles(query);
            });
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: AppColors.lightPrimaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.lightPrimaryColor,
                width: 1,
              ),
            ),
            hintText: 'Search',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            filled: true,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                controller.clear();
              },
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('No Internet Connection'));
          }
          final res = snapshot.data;
          if (res?.status == 'error') {
            return Center(child: Text(res?.message ?? ''));
          }
          final articles = res?.articles ?? [];
          if (articles.isEmpty) {
            return const Center(child: Text('No results'));
          }
          return ListView.separated(
            padding: REdgeInsets.all(16),
            itemCount: articles.length,
            separatorBuilder: (_, _) => SizedBox(height: 16.h),
            itemBuilder: (_, i) => ArticleItem(article: articles[i]),
          );
        },
      ),
    );
  }
}
