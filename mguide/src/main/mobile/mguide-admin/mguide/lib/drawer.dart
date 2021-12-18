import 'package:flutter/material.dart';
import 'package:mguide/menu.dart';
import 'package:mguide/myAppBar.dart';
import 'package:mguide/randomWords.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: menu()
    );
  }
}
