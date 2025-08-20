import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/provieders/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsSheet extends StatelessWidget {
  News news;
  NewsSheet({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: settingsProvider.isLight ? AppTheme.black : AppTheme.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            news.urlToImage ??
                'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                child: Icon(Icons.broken_image, color: AppTheme.grey, size: 40),
                alignment: Alignment.center,
                color: AppTheme.white,
              );
            },
          ),
          SizedBox(height: 8),
          Text(
            news.content ?? '',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleSmall!.copyWith(
              color: settingsProvider.isLight ? AppTheme.white : AppTheme.black,
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _launchUrl();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: settingsProvider.isLight
                    ? AppTheme.white
                    : AppTheme.black,
                //  padding: EdgeInsets.symmetric(vertical: 16),
                fixedSize: Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'View Full Article',
                style: textTheme.titleMedium!.copyWith(
                  color: settingsProvider.isLight
                      ? AppTheme.black
                      : AppTheme.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _launchUrl() async {
  if (!await launchUrl(Uri.parse(news.url??""))) {
    throw Exception('Could not launch ${news.url}');
  }
}
}
