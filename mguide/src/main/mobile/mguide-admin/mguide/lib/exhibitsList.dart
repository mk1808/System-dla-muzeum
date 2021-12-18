import 'package:flutter/material.dart';
import 'package:mguide/menu.dart';
import 'package:mguide/myAppBar.dart';

class ExhibitsList extends StatefulWidget {
  const ExhibitsList({ Key? key }) : super(key: key);

  @override
  _ExhibitsListState createState() => _ExhibitsListState();
}

class _ExhibitsListState extends State<ExhibitsList> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        drawer: menu(),
        body: getCenter3());
  }

    getCenter3() {
  
  }
}