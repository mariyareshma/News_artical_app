import 'package:flutter/material.dart';
import 'package:news_artical_app/views/news_home.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App Demo Api',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const NewsHome(),
    );
  }
}
