import 'package:flutter/material.dart';
import 'package:news_app/categories/categoriey_item.dart';
import 'package:news_app/models/categorey_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (_, index) =>
                  CategorieyItem(categorey: CategoreyModel.categories[index]),
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: CategoreyModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
