import 'package:flutter/material.dart';
import 'package:mguide/menu.dart';

class ExhibitsList extends StatefulWidget {
  const ExhibitsList({ Key? key }) : super(key: key);

  @override
  _ExhibitsListState createState() => _ExhibitsListState();
}

class _ExhibitsListState extends State<ExhibitsList> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rozpocznij mapowanie'),
        ),
        drawer: menu(),
        body: getCenter3());
  }

    getCenter3() {
  
  }
}