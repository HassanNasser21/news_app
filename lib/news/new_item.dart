import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response/news.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewItem extends StatelessWidget {
  News news;
  NewItem({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.white),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              news.urlToImage ??
                  'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
              fit: BoxFit.fill,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.25,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  child: Icon(
                    Icons.broken_image,
                    color: AppTheme.grey,
                    size: 40,
                  ),
                  alignment: Alignment.center,
                  color: AppTheme.white,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Text(news.title!, style: textTheme.titleMedium),
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
