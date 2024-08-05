import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

// const String URI = 'http://10.241.96.15:3000';
const String URI = 'http://localhost:3333';

void  main () async {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const WebViewApp(),
    ),
  );
  await Permission.audio.request();
  print(await Permission.audio.status);
  print(await Permission.camera.status);
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // if (Platform.isMacOS){
    //   launch(URI); // For web, launch the URL in a new tab
    // }

    controller = WebViewController()
      ..loadRequest(
        Uri.parse(URI),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: Platform.isMacOS
          ? const SizedBox()
          : WebViewWidget(
              controller: controller,
            ),
    );
  }
}
