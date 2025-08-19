import 'package:flutter/material.dart';
import 'package:news_app/categories/categories_view.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/models/categorey_model.dart';
import 'package:news_app/news/news_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoreyModel? selectedCategorey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategorey == null ? "Home" : selectedCategorey!.name,
        ),
      ),
      body: selectedCategorey == null
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
}
