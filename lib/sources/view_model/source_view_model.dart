import 'package:flutter/widgets.dart';
import 'package:news_app/models/source_reseponse/source.dart';
import 'package:news_app/models/source_reseponse/source_reseponse.dart';
import 'package:news_app/sources/data/data_source/sources_data_source.dart';

class SourceViewModel with ChangeNotifier {
  SourcesDataSource dataSource = SourcesDataSource();
  List<Source> sources = [];
  String? errormessage;
  bool isloading = false;
  Future<void> getSources(String categoryId) async {
    try {
      isloading = true;
      SourceReseponse reseponse = await dataSource.getSources(categoryId);
      if (reseponse.status == 'ok' && reseponse.sources != null) {
        sources = reseponse.sources!;
      } else {
        errormessage = 'faild to load sources';
      }
    } catch (error) {
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
