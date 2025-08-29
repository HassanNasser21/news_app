import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/service_locator.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repositories/source_repository.dart';
import 'package:news_app/sources/view_model/sources_states.dart';

class SourceViewModel extends Cubit<SourcesState> {
  late SourceRepository repository;
  SourceViewModel() : super(InitialSourcesState()) {
    repository = SourceRepository(ServiceLocator.sourcesdataSource);
  }

  Future<void> getSources(String categoryId) async {
    emit(getSourcesLoading());
    try {
      List<Source> sources = await repository.getSources(categoryId);
      emit(getSourcesSuccess(sources));
    } catch (error) {
      emit(getSourcesError(error.toString()));
    }
  }
}
