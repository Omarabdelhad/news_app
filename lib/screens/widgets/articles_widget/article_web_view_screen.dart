import 'package:flutter/material.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebViewScreen extends StatefulWidget {
  final Article article;
  const ArticleWebViewScreen({super.key, required this.article});

  @override
  State<ArticleWebViewScreen> createState() => _ArticleWebViewScreenState();
}

class _ArticleWebViewScreenState extends State<ArticleWebViewScreen> {
  late final WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(
      Uri.parse(
        widget.article.url ?? 'Not Found', //ده رابط المقال
      ),
    );
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.article.source?.name ?? '')),
      body: Column(
        children: [Expanded(child: WebViewWidget(controller: controller))],
      ),
    );
  }
}
