import 'package:dio/dio.dart';

import '../model/news_article.dart';

var dio = Dio();

Future<List<NewsArticle>> getPersonDetails() async {
  var response = await dio.get(
      'http://api.mediastack.com/v1/news?access_key=d1b4b8118b06b2530858b42668464993&countries=in&limits=100');

  if (response.statusCode == 200) {
    var newsJsons = response.data;
    var newArticleObj = NewsArticles.fromJson(newsJsons);
    return newArticleObj.data;
  }

  return <NewsArticle>[];
}
