import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'package:news_app/models/source_reseponse/source_reseponse.dart';

class ApiServices {
  static Future<SourceReseponse> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConstants.baseurl, ApiConstants.sourceEndpoint, {
      'apiKey': ApiConstants.apikey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourceReseponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri uri = Uri.https(ApiConstants.baseurl, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apikey,
      'sources': sourceId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> getSearchNews(String value) async {
    Uri uri = Uri.https(ApiConstants.baseurl, ApiConstants.searchEndpoint, {
      'apiKey': ApiConstants.apikey,
      'q': value,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }



}
