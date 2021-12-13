import 'package:flutter/material.dart';
import 'package:mguide/randomWords.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
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
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return RandomWords();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
