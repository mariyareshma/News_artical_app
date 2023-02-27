import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:path_provider/path_provider.dart';

import '../model/news_article.dart';

var dio = Dio();

const String newsDetails = 'NewsDetails.json';

String getFileNameAndDate() {
  var newsDate = DateTime.now();
  {
    return '${newsDate.day}-${newsDate.month}-${newsDate.year}-$newsDetails';
  }
}

//get the full file path of todays headlines path on
Future<String> getFullFilePath() async {
  //conctruct file object based on the above base path
  var appDir = (await getApplicationDocumentsDirectory()).path;
  return '$appDir/${getFileNameAndDate()}';
}

Future<List<NewsArticle>> readAllFile() async {
  //get the full file path of todays headlines
  var fullFilePath = await getFullFilePath();

  //construct the file object
  var headLinesFileObj = File(fullFilePath);

  //check if file exits
  if (headLinesFileObj.existsSync()) {
    //read file as string
    var fileContents = headLinesFileObj.readAsStringSync();

    //convert String to json
    var jsonObj = jsonDecode(fileContents);

    //convert json object to newsArticles
    var newsObj = NewsArticles.fromJson(jsonObj);
    return newsObj.data;
  }
  // call Api to News article
  var response = await dio.get(
      'http://api.mediastack.com/v1/news?access_key=d1b4b8118b06b2530858b42668464993&countries=in&limits=100');

  if (response.statusCode == 200) {
    var jsonObj = response.data;

    var jsonString = jsonEncode(jsonObj);

    headLinesFileObj.writeAsString(jsonString);

    //convert json object to newsArticles
    var newsObj = NewsArticles.fromJson(jsonObj);
    return newsObj.data;
  }
// return empty list
  return <NewsArticle>[];
}
