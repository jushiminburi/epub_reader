import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:epub_reader/epub_reader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _epubReaderPlugin = EpubReader();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () async => _epubReaderPlugin.open(
                  "/Users/batqzji/Documents/Alice's_Adventures_in_Wonderland.epub",
                  "/Users/batqzji/Documents"),
              child: const Text('Test')),
        ),
      ),
    );
  }
}
