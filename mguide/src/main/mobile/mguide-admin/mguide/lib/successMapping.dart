import 'package:flutter/material.dart';
import 'package:mguide/menu.dart';

class SuccessMapping extends StatefulWidget {
  const SuccessMapping({ Key? key }) : super(key: key);

  @override
  _SuccessMappingState createState() => _SuccessMappingState();
}

class _SuccessMappingState extends State<SuccessMapping> {
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