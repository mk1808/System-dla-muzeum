// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mguide/chooseExhibitForMapping.dart';
import 'package:mguide/mainPage.dart';
import 'package:mguide/startExhibitsMapping.dart';
import 'package:mguide/randomWords.dart';
import 'package:mguide/myTable.dart';
import 'package:mguide/successMapping.dart';
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
              leading: Icon(Icons.star_rounded ),
              title: Text('Strona główna'),
              onTap: () => navigateTo(context, new MainPage())),
          ListTile(
              leading: Icon(Icons.star_rounded ),
              title: Text('Mapowanie eksponatów'),
              onTap: () => navigateTo(context, new StartExhibitsMapping())),
          /*ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => navigateTo(context, new RandomWords())),
            ListTile(
            leading: Icon(Icons.settings),
            title: Text('TEST'),
            onTap: () => navigateTo(context, new MyTable())),
            ListTile(
            leading: Icon(Icons.settings),
            title: Text('ChooseExhibitForMapping'),
            onTap: () => navigateTo(context, new ChooseExhibitForMapping())),
ListTile(
            leading: Icon(Icons.settings),
            title: Text('SuccessMapping'),
            onTap: () => navigateTo(context, new SuccessMapping())),
           */ 
        ],
      ),
    );
  }
}
