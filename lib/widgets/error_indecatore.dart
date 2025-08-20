import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class ErrorIndecatore extends StatelessWidget {
  const ErrorIndecatore({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something went wrong!',
        style: TextStyle(color: AppTheme.white),
      ),
    );
  }
}
