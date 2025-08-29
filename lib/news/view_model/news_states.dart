import 'package:news_app/news/data/models/news.dart';

abstract class NewsState {}

class InitialNewsState extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsState {
  List<News> newslist;
  GetNewsSuccess(this.newslist);
}
class GetNewsError extends NewsState{
  String errormessage;
  GetNewsError(this.errormessage);
}