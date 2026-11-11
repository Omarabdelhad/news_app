import 'package:flutter/material.dart';
import 'package:news_app/core/remote/network/api_manager.dart';
import 'package:news_app/models/sources/source.dart';

class ArticlesViewModel extends ChangeNotifier {
  String? errorMassege;
  List<Source>? sourcesList;
  bool isLoading = false;
  getSources(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      var sourceResponse = await ApiManager.getSources(categoryId);
      isLoading=false;
      if (sourceResponse.status == 'error') {
        errorMassege = sourceResponse.message;
      } else {
        sourcesList = sourceResponse.sources;
      }
      notifyListeners();
    } catch (e) {
      isLoading=false;
      errorMassege = 'No Internet Connection';
            notifyListeners();

    }
  }
}
