import 'package:flutter/widgets.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/repositories/news_repository.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  NewsRepository repository = NewsRepository(ServiceLocator.newsDataSource);
  List<News> newsList = [];
  String? errormessage;
  bool isloading = false;
  Future<void> getNews(String sourceId, int pagesize, int page) async {
    isloading = true;
    try {
      newsList = await repository.getNews(sourceId, pagesize, page);
    } catch (error) {
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
