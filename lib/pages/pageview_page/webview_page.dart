import 'package:flutter/material.dart';
import 'package:flutter_base_project_template/pages/pageview_page/menu.dart';
import 'package:flutter_base_project_template/pages/pageview_page/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart'; // ADD

import 'navigation_controls.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  // Add from here...
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }
  // ...to here.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        // Add from here...
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller), // ADD
        ],
        // ...to here.
      ),
      body: WebViewStack(controller: controller), // MODIFY
    );
  }
}
