import 'package:flutter/material.dart';
import 'package:mguidevisitor/mainPage.dart';
import 'package:mguidevisitor/museumInfo.dart';

class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
              color: Colors.cyan[600],///tło nagłówka drawera
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
              title: Text('Informacje o muzeum'),
              onTap: () => navigateTo(context, new MuseumInfo())),
         /* ListTile(
              leading: Icon(Icons.star_rounded ),
              title: Text('Mapowanie eksponatów'),
              onTap: () => navigateTo(context, new StartExhibitsMapping())),
          ListTile(
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