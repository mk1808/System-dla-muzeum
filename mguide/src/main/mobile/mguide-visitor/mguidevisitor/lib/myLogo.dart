import 'package:flutter/material.dart';

class MyLogo extends StatefulWidget {
  const MyLogo({Key? key}) : super(key: key);

  @override
  _MyLogoState createState() => _MyLogoState();
}

class _MyLogoState extends State<MyLogo> {
  @override
  Widget build(BuildContext context) {
    return Image(
        image: AssetImage('./assets/logop1.png'), height: 100, width: 80);
  }
}
