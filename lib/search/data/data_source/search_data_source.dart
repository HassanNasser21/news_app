import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:news_app/api/api_constants.dart';
import 'package:news_app/news/data/models/news_response.dart';

class SearchDataSource {
  Future<NewsResponse> getSearchNews(
    String value,
    int pagesize,
    int page,
  ) async {
    Uri uri = Uri.https(ApiConstants.baseurl, ApiConstants.searchEndpoint, {
      'apiKey': ApiConstants.apikey,
      'q': value,
      'pageSize': pagesize.toString(),
      'page': page.toString(),
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}