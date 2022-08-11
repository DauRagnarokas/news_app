import 'package:dio/dio.dart';

import '../../../models/article_model.dart';
import '../../../network/network_helper.dart';

class NewsApiAiRepository {
  static const String _baseUrl = "http://eventregistry.org/api/v1/article/getArticles";
  final String apiKey = "6e058413-e6cd-4c80-a78c-d40559781990";

  final Dio _dio = Dio();

  var getTopHeadlinesUrl = '$_baseUrl/top-headlines';
  var everythingUrl = "$_baseUrl/everything";

  static String defaultQuery = 'people';

  Future<List<ArticleModel>> getRecentArticles() async {
    var params = {
      "action": "getArticles",
      "keyword": "Barack Obama",
      "articlesPage": 1,
      "articlesCount": 10,
      "articlesSortBy": "date",
      "articlesSortByAsc": false,
      "articlesArticleBodyLen": -1,
      "resultType": "articles",
      // "includeArticleImage": true,
      // "includeArticleEventUri": true,
      // "includeArticleAuthors": true,
      // "includeArticleSocialScore": true,
      // "includeArticleLocation": true,
      "dataType": [
        "news",
        "pr"
      ],
      "apiKey": apiKey,
      "forceMaxDataTimeWindow": 31
    };
    final Response response =
        await _dio.get(_baseUrl, queryParameters: params);
    return NetworkHelper.filterResponse(
        callBack: (json) => (json["articles"]['results'] as List)
            .map((i) => ArticleModel.fromJson(i))
            .toList(),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An Error has happened. $errorType - $msg'));
  }

  Future<List<ArticleModel>> searchArticles({required String query}) async {
    var params = {
      "action": "getArticles",
      "keyword": query,
      "articlesPage": 1,
      "articlesCount": 100,
      "articlesSortBy": "date",
      "articlesSortByAsc": false,
      "articlesArticleBodyLen": -1,
      "resultType": "articles",
      "dataType": [
        "news",
        "pr"
      ],
      "apiKey": apiKey,
      "forceMaxDataTimeWindow": 31
    };
    final Response response =
        await _dio.get(_baseUrl, queryParameters: params);
    return NetworkHelper.filterResponse(
        callBack: (json) => (json["articles"]['results'] as List)
            .map((i) => ArticleModel.fromJson(i))
            .toList(),
        response: response,
        onFailureCallBackWithMessage: (errorType, msg) =>
            throw Exception('An Error has happened. $errorType - $msg'));
  }
}
