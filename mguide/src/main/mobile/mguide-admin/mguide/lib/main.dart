
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:mguide/drawer.dart';
import 'package:mguide/randomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        home: drawer());
  }
}

