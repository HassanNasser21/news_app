import 'package:flutter/material.dart';
import 'package:news_app/search/view_model/search_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:news_app/news/view/widgets/new_item.dart';
import 'package:news_app/news/view/widgets/news_view.dart';
import 'package:news_app/shared/widgets/error_indecatore.dart';
import 'package:news_app/shared/widgets/loading_indecatore.dart';
import 'package:news_app/shared/widgets/news_sheet.dart';
import 'package:news_app/search/view/widgets/search_field.dart';
import 'package:provider/provider.dart';

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

  SearchViewModel searchViewModel = SearchViewModel();

  int currentpage = 1;
  int pageSize = 20;
  ScrollController scrollController = ScrollController();

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
                searchViewModel.getSearchNews(searchValue, pageSize, currentpage);

          },
        ),

        SizedBox(height: 16),
        Expanded(
          child: ChangeNotifierProvider(
            create: (_) => searchViewModel,
            child: Consumer<SearchViewModel>(
              builder: (_, viewmodel, _) {
                if (viewmodel.isloading) {
                  return LoadingIndecatore();
                } else if (viewmodel.errormessage != null) {
                  return ErrorIndecatore(viewmodel.errormessage!);
                } else {
                  List<News> newsSearchList = viewmodel.searchNewsList;

                  //  currentpage++;
                  return ListView.separated(
                    controller: scrollController,
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
        ),
      ],
    );
  }
}
