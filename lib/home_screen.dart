import 'package:flutter/material.dart';
import 'package:news_app/categories/categories_view.dart';
import 'package:news_app/news/news_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: NewsView(),
    );
  }
}
