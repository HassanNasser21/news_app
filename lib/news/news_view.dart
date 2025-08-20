import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/models/source_reseponse/source.dart';
import 'package:news_app/models/source_reseponse/source_reseponse.dart';
import 'package:news_app/news/new_item.dart';
import 'package:news_app/news/tap_item.dart';
import 'package:news_app/provieders/settings_provider.dart';
import 'package:news_app/widgets/error_indecatore.dart';
import 'package:news_app/widgets/loading_indecatore.dart';
import 'package:news_app/widgets/news_sheet.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  String categoryId;
  NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  void _showBottomSheet(BuildContext context, News news) {
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
  late Future<SourceReseponse> getSourcesFuture = ApiServices.getSources(
    widget.categoryId,
  );
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return FutureBuilder(
      future: getSourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndecatore();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndecatore();
        } else {
          List<Source> sources = snapshot.data?.sources ?? [];
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
                child: FutureBuilder(
                  future: ApiServices.getNews(sources[currentIndex].id!),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingIndecatore();
                    } else if (snapshot.hasError ||
                        snapshot.data?.status != 'ok') {
                      return ErrorIndecatore();
                    } else {
                      List<News> newsList = snapshot.data?.articles ?? [];
                      return ListView.separated(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, newsList[index]);
                          },
                          child: NewItem(news: newsList[index]),
                        ),
                        separatorBuilder: (_, _) => SizedBox(height: 16),
                        itemCount: 5,
                      );
                    }
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
