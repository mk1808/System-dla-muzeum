import 'package:flutter/material.dart';
import 'package:mguide/menu.dart';
class ChooseExhibitForMapping extends StatefulWidget {
  const ChooseExhibitForMapping({ Key? key }) : super(key: key);

  @override
  _ChooseExhibitForMappingState createState() => _ChooseExhibitForMappingState();
}

class _ChooseExhibitForMappingState extends State<ChooseExhibitForMapping> {
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