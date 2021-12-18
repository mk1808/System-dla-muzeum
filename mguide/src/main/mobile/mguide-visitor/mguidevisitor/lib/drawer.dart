
import 'package:flutter/material.dart';
import 'package:mguidevisitor/menu.dart';
import 'package:mguidevisitor/myAppBar.dart';

class Drawer extends StatefulWidget {
  const Drawer({ Key? key }) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: MyAppBar(),
      drawer: Menu()
    );
  }
}
