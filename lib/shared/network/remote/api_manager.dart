import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '49f30859c7aa4f65aa946d6b2ed7bd48';
  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(
      baseUrl,
      'v2/top-headlines/sources',
      {
        'apiKey': apiKey,
        'category': categoryId,
      },
    );
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNews(String sourceId, int pageNumber) async {
    const String limit = '10';
    var url = Uri.https(
      baseUrl,
      '/v2/everything',
      {
        'apiKey': apiKey,
        'sources': sourceId,
        'pageSize': limit,
        'page': pageNumber.toString(),
      },
    );
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      NewsResponse newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> search(String searchName) async {
    var url = Uri.https(
      baseUrl,
      '/v2/everything',
      {
        'apiKey': apiKey,
        'q': searchName,
      },
    );
    try {
      var response = await http.get(url);
      var stringBody = response.body;
      var json = jsonDecode(stringBody);
      NewsResponse newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
      rethrow;
    }
  }
}
