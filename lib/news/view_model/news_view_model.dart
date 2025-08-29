import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/data/repositories/news_repository.dart';
import 'package:news_app/news/view_model/news_states.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  late NewsRepository repository;
  NewsViewModel() : super(InitialNewsState()) {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }

  Future<void> getNews(String sourceId, int pagesize, int page) async {
    emit(GetNewsLoading());
    try {
      List<News> newsList = await repository.getNews(sourceId, pagesize, page);
      emit(GetNewsSuccess(newsList));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}
