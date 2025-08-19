import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/news/new_item.dart';
import 'package:news_app/news/tap_item.dart';

class NewsView extends StatefulWidget {
  String categoryId;
   NewsView({required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  List<SourceModel> sources = List.generate(
    10,
    (index) => SourceModel(id: '$index', name: 'source $index'),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            isScrollable: true,
            indicatorColor: AppTheme.white,
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
          child: ListView.separated(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            itemBuilder: (_, index) => NewItem(),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
