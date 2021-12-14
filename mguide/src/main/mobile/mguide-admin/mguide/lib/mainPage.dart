import 'package:flutter/material.dart';
import 'package:mguide/menu.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _biggerFont = const TextStyle(fontSize: 100.0);
  getContainer(){
     return Container(
      color: Colors.green,
      child: Material(
        child: ListTile(
          title: Text('glowna', style: _biggerFont),
          tileColor: Colors.red,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Strona główna'),
      ),
      drawer:menu(),
      body: getContainer(),
    );
   
  }
}
