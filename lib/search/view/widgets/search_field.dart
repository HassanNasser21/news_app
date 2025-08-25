import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/shared/provieders/settings_provider.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  VoidCallback reset;
  SearchField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(color:settingsProvider.isLight ? AppTheme.black : AppTheme.white),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color:settingsProvider.isLight ? AppTheme.black : AppTheme.white),

          prefixIcon: Icon(Icons.search, color:settingsProvider.isLight ? AppTheme.black : AppTheme.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color:settingsProvider.isLight ? AppTheme.black : AppTheme.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color:settingsProvider.isLight ? AppTheme.black : AppTheme.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(color:settingsProvider.isLight ? AppTheme.black : AppTheme.white),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color:settingsProvider.isLight ? AppTheme.black : AppTheme.white),
            onPressed: () {
             // controller.clear();
              //onChanged('');
              reset();
            },
          ),
        ),
      ),
    );
  }
}
