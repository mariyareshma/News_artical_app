import 'package:flutter/material.dart';
import 'package:news_artical_app/model/news_article.dart';

class NewsArticleWidget extends StatelessWidget {
  const NewsArticleWidget({Key? key, this.news}) : super(key: key);
  final NewsArticle? news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(news!.title!),
        Row(
          children: [
            Image.network(news!.image!),
            Column(
              children: [
                Text(news!.description!),
                Text(news!.publishedAt!.toString())
              ],
            )
          ],
        )
      ]),
    );
  }
}
