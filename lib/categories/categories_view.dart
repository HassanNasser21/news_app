import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categoriey_item.dart';
import 'package:news_app/models/categorey_model.dart';
import 'package:news_app/provieders/settings_provider.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  void Function(CategoreyModel) oncategoreySelected;
  CategoriesView({required this.oncategoreySelected});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: settingsProvider.isLight ? AppTheme.black : AppTheme.white,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  oncategoreySelected(CategoreyModel.categories[index]);
                },
                child: CategorieyItem(
                  categorey: settingsProvider.isLight
                      ? CategoreyModel.categories_black[index]
                      : CategoreyModel.categories[index],
                ),
              ),
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: CategoreyModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
