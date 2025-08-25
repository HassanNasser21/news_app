import 'package:flutter/widgets.dart';
import 'package:news_app/news/data/data_sources/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/models/news_response.dart';

class NewsViewModel with ChangeNotifier {
  NewsDataSources newsDataSources = NewsDataSources();
  List<News> newsList = [];
  String? errormessage;
  bool isloading = false;
  Future<void> getNews(String sourceId, int pagesize, int page) async {
    isloading = true;
    try {
      NewsResponse response = await newsDataSources.getNews(
        sourceId,
        pagesize,
        page,
      );

      if (response.status == 'ok' && response.articles != null) {
        newsList = response.articles!;
      } else {
        errormessage = 'faild to get news!';
      }
    } catch (error) {
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
