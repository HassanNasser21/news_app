import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/models/source_reseponse/source.dart';
import 'package:news_app/news/view/widgets/new_item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/sources/view/widgets/tap_item.dart';
import 'package:news_app/shared/provieders/settings_provider.dart';
import 'package:news_app/sources/view_model/source_view_model.dart';
import 'package:news_app/shared/widgets/error_indecatore.dart';
import 'package:news_app/shared/widgets/loading_indecatore.dart';
import 'package:news_app/shared/widgets/news_sheet.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  String categoryId;
  NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  static void _showBottomSheet(BuildContext context, News news) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: NewsSheet(news: news),
      ),
    );
  }

  int currentIndex = 0;

  SourceViewModel sourceViewModel = SourceViewModel();
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    sourceViewModel.getSources(widget.categoryId);
    super.initState();
  }

  int currentPage = 1;
  int pageSize = 20;
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => sourceViewModel,
      child: Consumer<SourceViewModel>(
        builder: (_, viewmodel, _) {
          if (viewmodel.isloading) {
            return LoadingIndecatore();
          } else if (viewmodel.errormessage != null) {
            return ErrorIndecatore(viewmodel.errormessage!);
          } else {
            List<Source> sources = viewmodel.sources;
            newsViewModel.getNews(viewmodel.sources[currentIndex].id!,pageSize,currentPage);
            return Column(
              children: [
                DefaultTabController(
                  length: sources.length,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: settingsProvider.isLight
                        ? AppTheme.black
                        : AppTheme.white,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    labelPadding: EdgeInsetsDirectional.only(start: 16),
                    tabs: sources
                        .map(
                          (source) => TapItem(
                            source: source,
                            isSelected: currentIndex == sources.indexOf(source),
                          ),
                        )
                        .toList(),
                    onTap: (index) {
                      if (currentIndex == index) return;
                      currentIndex = index;
                      setState(() {});
                    },
                  ),
                ),

                Expanded(
                  child: ChangeNotifierProvider(
                    create: (_) => newsViewModel,
                    child: Consumer<NewsViewModel>(
                      builder: (_, viewmodel, __) {
                        if (viewmodel.isloading) {
                          return LoadingIndecatore();
                        } else if (viewmodel.errormessage != null) {
                          return ErrorIndecatore(viewmodel.errormessage!);
                        } else {
                          List<News> newsList = viewmodel.newsList;
                          // currentPage++;
                          return ListView.separated(
                            controller: scrollController,
                            padding: EdgeInsets.only(
                              top: 16,
                              left: 16,
                              right: 16,
                            ),
                            itemBuilder: (_, index) => GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, newsList[index]);
                              },
                              child: NewItem(news: newsList[index]),
                            ),
                            separatorBuilder: (_, _) => SizedBox(height: 16),
                            itemCount: newsList.length,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
