import 'package:flutter/material.dart';
import 'package:news_artical_app/model/news_article.dart';
import 'package:news_artical_app/views/news_article_widget.dart';

import '../service/services.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My News Friend'),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return getArticleFuture();
  }

  Widget getArticleFuture() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getListView(snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: getNewsArticalDetails(),
    );
  }

  Widget getListView(List<NewsArticle>? data) {
    if (data == null || data.isEmpty) {
      return const Center(
        child: Text('Error in getting data'),
      );
    }

    var articleWidgets = <Widget>[];
    for (var articles in data) {
      var articleWidget = NewsArticleWidget(
        news: articles,
      );
      articleWidgets.add(articleWidget);
    }

    return ListView(children: articleWidgets);
  }
}
