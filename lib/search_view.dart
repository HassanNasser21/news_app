import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/news/new_item.dart';
import 'package:news_app/news/news_view.dart';
import 'package:news_app/widgets/error_indecatore.dart';
import 'package:news_app/widgets/loading_indecatore.dart';
import 'package:news_app/widgets/news_sheet.dart';
import 'package:news_app/widgets/search_field.dart';

class SearchView extends StatefulWidget {
  VoidCallback resetSearch;
  SearchView({super.key, required this.resetSearch});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController controller = TextEditingController();
  String searchValue = '';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        SearchField(
          controller: controller,
          reset: widget.resetSearch,
          onChanged: (value) {
            setState(() {
              searchValue = value;
            });

          },
        ),
        SizedBox(height: 16),
        Expanded(
          child: FutureBuilder(
            future: ApiServices.getSearchNews(searchValue),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingIndecatore();
              } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
                print(snapshot.data?.status);
                return ErrorIndecatore();
              } else {
                List<News> newsSearchList = snapshot.data?.articles ?? [];
                return ListView.separated(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      _showBottomSheet(context, newsSearchList[index]);
                    },
                    child: NewItem(news: newsSearchList[index]),
                  ),
                  separatorBuilder: (_, _) => SizedBox(height: 16),
                  itemCount: newsSearchList.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
