import 'package:dio/dio.dart';
import 'package:news_app/core/resources/app_constants.dart';
import 'package:news_app/models/articles/articleResponse.dart';
import 'package:news_app/models/sources/source_response.dart';

class ApiManager {
  static final Dio dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org'));
  static Future<SourceResponse> getSources(String categoryId) async {
    var response = await dio.get(
      '/v2/top-headlines/sources',
      queryParameters: {'apikey': sources.apiKey, 'category': categoryId},
    );
    var sourceResponse = SourceResponse.fromJson(response.data);
    return sourceResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
    var response = await dio.get(
      '/v2/everything',
      queryParameters: {'apikey': sources.apiKey, 'sources': sourceId},
    );
    var articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse;
  }
}
