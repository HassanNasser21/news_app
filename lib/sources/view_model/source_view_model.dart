import 'package:flutter/widgets.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repositories/source_repository.dart';

class SourceViewModel with ChangeNotifier {
  SourceRepository repository = SourceRepository();
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
