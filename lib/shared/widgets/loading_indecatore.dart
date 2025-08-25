import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';

class LoadingIndecatore extends StatelessWidget {
  const LoadingIndecatore({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppTheme.white));
  }
}
