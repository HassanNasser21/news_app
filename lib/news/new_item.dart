import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewItem extends StatelessWidget {
  const NewItem({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    DateTime dateTime = DateTime.now().subtract(Duration(minutes: 20));
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
            child: Image.asset(
              'assets/images/new.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.25,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Nobel Prize in physics awarded to two scientists for machine learning discoveries',
            style: textTheme.titleMedium,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('By : Jon Haworth', style: textTheme.labelSmall),
              Text(timeago.format(dateTime), style: textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
