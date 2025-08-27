import 'package:news_app/news/data/data_sources/news_api_data_sources.dart';
import 'package:news_app/news/data/data_sources/news_data_sources.dart';
import 'package:news_app/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';

class ServiceLocator {
  static SourcesDataSource sourcesdataSource = SourcesApiDataSource();
  static NewsDataSources newsDataSource = NewsAPIDataSources();
}
