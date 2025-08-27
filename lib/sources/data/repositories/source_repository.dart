import 'package:news_app/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';

class SourceRepository {
  SourcesDataSource dataSource ;

  SourceRepository(this.dataSource);

  Future<List<Source>> getSources(String categoryId) {
    return dataSource.getSources(categoryId);
  }
}
