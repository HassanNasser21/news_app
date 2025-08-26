import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:news_app/api/api_constants.dart';
import 'package:news_app/news/data/data_sources/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/models/news_response.dart';

class NewsAPIDataSources implements NewsDataSources {
  @override
  Future<List<News>> getNews(String sourceId, int pagesize, int page) async {
    Uri uri = Uri.https(ApiConstants.baseurl, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apikey,
      'sources': sourceId,
      'pageSize': pagesize.toString(),
      'page': page.toString(),
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('faild to get news!');
    }
  }
}
