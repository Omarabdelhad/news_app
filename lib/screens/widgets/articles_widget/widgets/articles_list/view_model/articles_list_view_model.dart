import 'package:flutter/material.dart';
import 'package:news_app/core/remote/network/api_manager.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/models/articles/articleResponse.dart';

class ArticlesListViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Article>? articlesList;
  String? errorMassege;
  getArticles(String sourceId) async {
    try {
      isLoading = true;
      notifyListeners();
      ArticlesResponse response = await ApiManager.getArticles(sourceId);
      isLoading = false;
      if (response.status == 'error') {
        errorMassege = response.message;
      } else {
        articlesList = response.articles;
      }
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMassege = 'No Internet Connection';
      notifyListeners();
    }
  }
}
