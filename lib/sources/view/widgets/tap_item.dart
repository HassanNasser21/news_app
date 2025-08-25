import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/models/source_reseponse/source.dart';
import 'package:news_app/shared/provieders/settings_provider.dart';
import 'package:provider/provider.dart';

class TapItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TapItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Text(
      source.name ?? '',
      style: settingsProvider.isLight
          ? (isSelected
                ? textTheme.titleMedium!.copyWith(color: AppTheme.black)
                : textTheme.titleSmall!.copyWith(color: AppTheme.black))
          : isSelected
          ? textTheme.titleMedium!.copyWith(color: AppTheme.white)
          : textTheme.titleSmall!.copyWith(color: AppTheme.white),
    );
  }
}
