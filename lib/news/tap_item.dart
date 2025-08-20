import 'package:flutter/material.dart';
import 'package:news_app/models/source_reseponse/source.dart';

class TapItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TapItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      source.name ?? '',
      style: isSelected ? textTheme.titleMedium : textTheme.titleSmall,
    );
  }
}
