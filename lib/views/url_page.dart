import 'package:flutter/material.dart';
import 'package:native_webview/native_webview.dart';

class UrlPage extends StatelessWidget {
  const UrlPage({Key? key, required this.url}) : super(key: key);
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Browser')),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
