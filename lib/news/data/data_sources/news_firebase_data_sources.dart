import 'package:news_app/news/data/data_sources/news_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsFirebaseDataSources implements NewsDataSources{
  @override
  Future<List<News>> getNews(String sourceId, int pagesize, int page) async{
    // TODO: implement getNews
    return [];
  }

}