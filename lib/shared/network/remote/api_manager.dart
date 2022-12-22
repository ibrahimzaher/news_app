import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_response/NewsResponse.dart';
import 'package:news_app/models/sources_response/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  //https://newsapi.org/v2/top-headlines/sources?apiKey=1a627e9c50be47bfa1c5c86f9a80f9af&category=sports
  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(
      baseUrl,
      'v2/top-headlines/sources',
      {
        'apiKey': '742a52ef883449b2ae1a324cb8681b1a',
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

  //https://newsapi.org/v2/everything?sources=abc-news&apiKey=2396ee10fa6c4da988e49e5b30527c58&page=1&pageSize=10
  static Future<NewsResponse> getNews(String sourceId, int pageNumber) async {
    const String limit = '10';
    var url = Uri.https(
      baseUrl,
      '/v2/everything',
      {
        'apiKey': '742a52ef883449b2ae1a324cb8681b1a',
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
    const String limit = '10';
    var url = Uri.https(
      baseUrl,
      '/v2/everything',
      {
        'apiKey': '742a52ef883449b2ae1a324cb8681b1a',
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
