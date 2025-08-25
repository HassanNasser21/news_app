import 'package:flutter/material.dart';
import 'package:news_app/models/categorey_model.dart';

class CategorieyItem extends StatelessWidget {
  CategoreyModel categorey;
  CategorieyItem({required this.categorey});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.asset(
        'assets/images/${categorey.imageName}.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
      ),
    );
  }
}
