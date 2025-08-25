import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';

class ErrorIndecatore extends StatelessWidget {
  String errormessage ;
   ErrorIndecatore(  [this.errormessage='something went wrong']);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$errormessage',
        style: TextStyle(color: AppTheme.white),
      ),
    );
  }
}
