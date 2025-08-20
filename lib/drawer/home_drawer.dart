import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/provieders/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  VoidCallback onGoToHome;
  HomeDrawer({required this.onGoToHome});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'ar', name: 'Arabic'),
  ];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.of(context).size;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      color: AppTheme.black,
      width: screenSize.width * 0.7,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenSize.height * 0.2,
            color: AppTheme.white,
            alignment: Alignment.center,
            child: Text(
              'News App',
              style: textTheme.titleLarge!.copyWith(
                color: AppTheme.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                widget.onGoToHome();
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/home.svg'),
                  SizedBox(width: 8),
                  Text('Go To Home', style: textTheme.labelLarge!.copyWith(color: 
                    settingsProvider.isLight ? AppTheme.white   : AppTheme.white
                  )),
                ],
              ),
            ),
          ),
          Divider(color: AppTheme.white, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/theme.svg'),
                SizedBox(width: 8),
                Text('Theme', style: textTheme.labelLarge),
                Spacer(),
                Switch(
                  value: settingsProvider.isLight,
                  onChanged: (isLight) {
                    settingsProvider.changeTheme(
                      isLight ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                  activeColor: AppTheme.white,
                ),
              ],
            ),
          ),
          Divider(color: AppTheme.white, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/language.svg'),
                SizedBox(width: 8),
                Text('Language', style: textTheme.labelLarge),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.white, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: DropdownButton(
              value: languages[0].code,
              items: languages
                  .map(
                    (language) => DropdownMenuItem(
                      value: language.code,
                      child: Text(
                        language.name,
                        style: textTheme.labelLarge!.copyWith(
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (languagecode) {},
              borderRadius: BorderRadius.circular(16),
              underline: SizedBox(),
              iconEnabledColor: AppTheme.white,
              isExpanded: true,
              dropdownColor: AppTheme.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class Language {
  String code;
  String name;
  Language({required this.code, required this.name});
}
