import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:news_app/provieders/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewItem extends StatelessWidget {
  News news;
  NewItem({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: settingsProvider.isLight ? AppTheme.black : AppTheme.white,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              news.urlToImage ??
                 'https://images.wondershare.com/repairit/aticle/2021/07/resolve-images-not-showing-problem-1.jpg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.25,
            ),
          ),
          SizedBox(height: 10),
          Text(
            news.title!,
            style: textTheme.titleMedium!.copyWith(
              color: settingsProvider.isLight ? AppTheme.black : AppTheme.white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('By : ${news.source!.name}', style: textTheme.labelSmall),
              Text(
                timeago.format(DateTime.parse(news.publishedAt!)),
                style: textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
