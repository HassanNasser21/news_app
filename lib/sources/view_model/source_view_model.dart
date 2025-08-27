import 'package:flutter/widgets.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repositories/source_repository.dart';

class SourceViewModel with ChangeNotifier {
  SourceRepository repository = SourceRepository(ServiceLocator.sourcesdataSource);
  List<Source> sources = [];
  String? errormessage;
  bool isloading = false;
  Future<void> getSources(String categoryId) async {
    try {
      isloading = true;
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errormessage = error.toString();
    }
    isloading = false;
    notifyListeners();
  }
}
