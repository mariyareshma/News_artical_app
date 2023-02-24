import 'package:flutter/material.dart';
import 'package:news_artical_app/model/news_article.dart';
import 'package:share_plus/share_plus.dart';

class NewsArticleWidget extends StatelessWidget {
  const NewsArticleWidget({Key? key, this.news}) : super(key: key);
  final NewsArticle? news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  news!.title!,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  news!.image != null
                      ? Image.network(
                          news!.image!,
                          width: 100,
                          height: 200,
                        )
                      : Image.network(
                          'https://media.gettyimages.com/id/1289018115/photo/female-anchor-presenting-breaking-news-about-severe-weather-causing-power-outage.jpg?s=612x612&w=gi&k=20&c=uSD-HSZhWuEb4Y5b7Xdr2uFByap0NjZ9CTOJJyQZytk=',
                          width: 100,
                          height: 100,
                        ),
                  Expanded(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(news!.source!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            news!.description!,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                news!.articleDate(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Share.share(news!.url!);
                                },
                                icon: const Icon(Icons.share))
                          ],
                        )
                      ]))
                ],
              ),
            ])),
      ),
    );
  }
}
