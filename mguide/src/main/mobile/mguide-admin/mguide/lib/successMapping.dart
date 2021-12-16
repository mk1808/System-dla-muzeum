import 'package:flutter/material.dart';
import 'package:mguide/mainPage.dart';
import 'package:mguide/menu.dart';
import 'package:mguide/startExhibitsMapping.dart';

class SuccessMapping extends StatefulWidget {
  const SuccessMapping({ Key? key }) : super(key: key);

  @override
  _SuccessMappingState createState() => _SuccessMappingState();
}

class _SuccessMappingState extends State<SuccessMapping> {
   final _biggerFont = const TextStyle(fontSize: 100.0);
  final _biggerFont2 =
      const TextStyle(fontSize: 27.0, fontWeight: FontWeight.w600);
  double iconSize = 40;
  final midFont = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sukces'),
        ),
        drawer: menu(),
        body: getCenter3());
  }

     getCenter3() {
    return Center(
        child: Column(
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 20.0),
          height: 160.0,
          // color: Colors.yellow,
          child: Text('Lokalizacja obiektu została poprawnie zapisana!',
              textAlign: TextAlign.center, style: _biggerFont2),
        ),
       /* Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          height: 300.0,
          // color: Colors.yellow,
          child: Text(
              'Za pomocą tego narzędzia można powiązać eksponaty z punktami w pomieszczeniach muzeum. W tym celu należy wejść w tryb wiązania, następnie przejść w miejsce, gdzie znajduje się eksponat. Będąc na miejscu należy nacisnąć przycisk "Powiąż miejsce z eksponatem", a następnie wybrać z listy dostępnych pozycji odpowiedni eksponat.',
              textAlign: TextAlign.center,
              style: midFont),
        ),*/
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SizedBox(width: 300, height: 50, child: getButton())),
               Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SizedBox(width: 200, height: 50, child: getButton2())),
    
      ],
    ));
  }

    getButton() {
    return ElevatedButton.icon(
        label: Text('Kontynuuj mapowanie'),
        icon: Icon(
          Icons.east,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          print('Pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StartExhibitsMapping()));
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ));
  }

      getButton2() {
    return ElevatedButton.icon(
        label: Text('Zakończ'),
        icon: Icon(
          Icons.east,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          print('Pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainPage()));
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
        ));
  }
}