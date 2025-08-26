import 'package:news_app/news/data/data_sources/news_data_sources.dart';
import 'package:news_app/news/data/data_sources/news_spi_data_sources.dart';
import 'package:news_app/news/data/models/news.dart';

class NewsRepository {
  NewsDataSources dataSources = NewsAPIDataSources();

  Future<List<News>> getNews(String sourceId, int pagesize, int page)  {
    return dataSources.getNews(sourceId, pagesize, page);
  }
}
