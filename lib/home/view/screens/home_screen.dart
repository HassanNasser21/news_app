import 'package:flutter/material.dart';
import 'package:news_app/categories/view/widgets/categories_view.dart';
import 'package:news_app/home/view/widgets/home_drawer.dart';
import 'package:news_app/categories/data/models/categorey_model.dart';
import 'package:news_app/news/view/widgets/news_view.dart';
import 'package:news_app/search/view/widgets/search_view.dart';
import 'package:news_app/search/view/widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoreyModel? selectedCategorey;
  bool isSearching = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching ? null : AppBar(
        title: Text(
          selectedCategorey == null ? "Home" : selectedCategorey!.name,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body:isSearching?  SearchView(resetSearch: resetSearch,)
          : selectedCategorey == null
          ? CategoriesView(oncategoreySelected: oncategoreySelected)
          : NewsView(categoryId: selectedCategorey!.id),
      drawer: HomeDrawer(onGoToHome: resetSelecteCategorey),
    );
  }

  void oncategoreySelected(CategoreyModel categorey) {
    setState(() {
      selectedCategorey = categorey;
    });
  }

  void resetSelecteCategorey() {
    if (selectedCategorey == null) return;
    selectedCategorey = null;
    setState(() {});
  }
  void resetSearch(){
    setState(() {
      isSearching = false;
    });
  }
}
