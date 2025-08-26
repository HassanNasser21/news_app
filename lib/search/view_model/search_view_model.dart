import 'package:flutter/widgets.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/search/data/data_source/search_data_source.dart';

class SearchViewModel with ChangeNotifier {
  SearchDataSource searchDataSource = SearchDataSource();
  List<News> searchNewsList = [];
  String? errormessage;
  bool isloading = false;

  Future<void> getSearchNews(String value, int pagesize, int page) async {
    isloading = true;
   notifyListeners();
    try {
      NewsResponse response = await searchDataSource.getSearchNews(
        value,
        pagesize,
        page,
      );

      if (response.status == 'ok' &&
          response.articles != null &&
          response.articles!.isNotEmpty) {
        if (page == 1) {
          searchNewsList = response.articles!;
        } else {
          searchNewsList.addAll(response.articles!);
        }
        errormessage = null;
      } else {
        searchNewsList = [];
        errormessage = 'faild to get news!';
      }
    } catch (error) {
      searchNewsList = [];
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }

  void resetSearch() {
    searchNewsList = [];
    notifyListeners();
  }
}
