// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mguide/mainPage.dart';
import 'package:mguide/mapExhibitsStart.dart';
import 'package:mguide/randomWords.dart';
//typedef CustomCallBack = RandomWords Function();
class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  navigateTo(context, widget) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (context) {
          return widget;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Aplikacja Mguide',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.message),
              title: Text('Strona główna'),
              onTap: () => navigateTo(context, new MainPage())),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Mapowanie eksponatów'),
              onTap: () => navigateTo(context, new MapExhibitsStart())),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => navigateTo(context, new RandomWords())),
        ],
      ),
    );
  }
}
