import 'package:flutter/material.dart';
import 'package:mguide/menu.dart';

class MapExhibitsStart extends StatefulWidget {
  const MapExhibitsStart({ Key? key }) : super(key: key);

  @override
  _MapExhibitsStartState createState() => _MapExhibitsStartState();
}

class _MapExhibitsStartState extends State<MapExhibitsStart> {
  final _biggerFont = const TextStyle(fontSize: 100.0);
  getContainer(){
     return Container(
      color: Colors.green,
      child: Material(
        child: ListTile(
          title: Text('Mapowanie eksponatów', style: _biggerFont),
          tileColor: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Mapowanie eksponatów'),
      ),
      drawer:menu(),
      body: getContainer()
    );
  }
}