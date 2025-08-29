import 'package:news_app/sources/data/models/source.dart';

abstract class SourcesState {}

class InitialSourcesState extends SourcesState {}

class getSourcesLoading extends SourcesState {}

class getSourcesSuccess extends SourcesState {
  List<Source> sources;
  getSourcesSuccess(this.sources);
}

class getSourcesError extends SourcesState {
  String errormessage;
  getSourcesError(this.errormessage);
}
