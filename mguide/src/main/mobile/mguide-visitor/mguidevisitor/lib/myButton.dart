import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:mguidevisitor/duringVisiting.dart';

class MyButton extends StatefulWidget {
   MyButton({ Key? key }) : super(key: key);
    Color color=Colors.blueGrey;
  String name='';
  Icon icon=newObject();

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  @override
  Widget build(BuildContext context) {
    return getButton(context);
  }


    getButton(onPressedAction) {
    return ElevatedButton.icon(
        label: Text(widget.name),
        icon: Icon(
          Icons.east,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          print('Pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DuringVisiting()));
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ));
  }
}