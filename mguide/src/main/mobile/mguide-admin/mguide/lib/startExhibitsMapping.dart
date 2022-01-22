import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mguide/chooseExhibitForMapping.dart';
import 'package:mguide/mainPage.dart';
import 'package:mguide/menu.dart';
import 'package:mguide/models/models.dart';
import 'package:mguide/myAppBar.dart';
import 'package:mguide/services/exhibitsService.dart';
import 'package:mguide/services/positionService.dart';
import 'package:provider/provider.dart';

class StartExhibitsMapping extends StatefulWidget {
  const StartExhibitsMapping({Key? key}) : super(key: key);

  @override
  _StartExhibitsMappingState createState() => _StartExhibitsMappingState();
}

class _StartExhibitsMappingState extends State<StartExhibitsMapping> {
  final _biggerFont = const TextStyle(fontSize: 100.0);
  final _biggerFont2 =
      const TextStyle(fontSize: 27.0, fontWeight: FontWeight.w600);
  double iconSize = 40;
  final midFont = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300);
    final midFont2 = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300);
  getContainer() {
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

  getCenter() {
    return const Center(
      child: Material(
        child: ListTile(
          title: Text('glowna'),
          tileColor: Colors.red,
        ),
      ),
    );
  }

  getCenter2() {
    return Center(
      //child: Material(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('170 Reviews'), Text('170 Reviews'), getButton()]),
      //),
    );
  }

  getCenter3() {
    return ListView(scrollDirection: Axis.vertical, shrinkWrap: true, children: [
      Center(
          child: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 20.0),
            height: 160.0,
            // color: Colors.yellow,
            child: Text(
                'Tryb mapowania',
                textAlign: TextAlign.center,
                style: _biggerFont2),
          ),
              Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                  height: 300.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [Container
                    (padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),child:
                      Text('1. Podejdź do wybranego eksponatu.',
                          textAlign: TextAlign.left, style: midFont)),
                      Container
                    (padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),child:
                      Text('2. Wybierz przycisk "Powiąż miejsce z eksponatem".',
                          textAlign: TextAlign.left, style: midFont)),
                      Container
                    (padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),child:
                      Text('3. Wybierz eksponat z listy.',
                          textAlign: TextAlign.left, style: midFont)),
                      Container
                    (padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),child:
                      Text('4. Zapisz wiązanie',
                          textAlign: TextAlign.left, style: midFont))
                    ],
                  )),
            
            
            
        /*  Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              height: 300.0,
              // color: Colors.yellow,
              child: Image(image: AssetImage('assets/index.jpg'))),*/
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SizedBox(width: 300, height: 50, child: getButton())),
               Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SizedBox(width: 300, height: 50, child: getButton2())),
        /*  Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: getTab()),
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: getInput())*/
              getPosition(),
        ],
      ))
    ]);
  }

  getPosition() {
    return Consumer<PositionService>(
        builder: (context, positionService, child) {
      return Text(positionService.lastKnownPosition);
    });
  }

getInput(){
return TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          );
}
  getRow() {
    return Row(children: [
      const Text('170 Reviews'),
      const Text('170 Reviews'),
      getButton()
    ]);
  }

  getButton() {
    return ElevatedButton.icon(
        label: Text('Powiąż miejsce z eksponatem'),
        icon: Icon(
          FontAwesomeIcons.link,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
              print('inWidget');
                var exhibitsService = Provider.of<ExhibitsService>(context, listen: false);
                exhibitsService.getAll("");

          print('Pressed');
          Point? position = Provider.of<PositionService>(context, listen: false).position;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChooseExhibitForMapping(point:position)));
        },
        /*style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan)
        )*/
        );
 
  }

    getButton2() {
    return ElevatedButton.icon(
        label: Text('Zakończ'),
        icon: Icon(
          FontAwesomeIcons.longArrowAltLeft,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          Provider.of<PositionService>(context, listen: false).stopTracking();
          print('Pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MainPage()));
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
        ));
  }

  /*  ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      
        ),
        onPressed: () {},
        child: Text('TextButton'),
        
        );*/
  getTab2() {
    return ListView(children: <Widget>[
      Center(
          heightFactor: 20.0,
          child: Text(
            'People-Chart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
      DataTable(
        columns: [
          DataColumn(
              label: Text('ID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text('Profession',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Stephen')),
            DataCell(Text('Actor')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('John')),
            DataCell(Text('Student')),
          ]),
          DataRow(cells: [
            DataCell(Text('10')),
            DataCell(Text('Harry')),
            DataCell(Text('Leader')),
          ]),
          DataRow(cells: [
            DataCell(Text('15')),
            DataCell(Text('Peter')),
            DataCell(Text('Scientist')),
          ]),
        ],
      ),
    ]);
  }

  getTab() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(children: [
            Column(children: [
              Icon(
                Icons.account_box,
                size: iconSize,
              ),
              Text('My Account')
            ]),
            Column(children: [
              Icon(
                Icons.settings,
                size: iconSize,
              ),
              Text('Settings')
            ]),
            Column(children: [
              Icon(
                Icons.lightbulb_outline,
                size: iconSize,
              ),
              Text('Ideas')
            ]),
          ]),
          TableRow(children: [
            Icon(
              Icons.cake,
              size: iconSize,
            ),
            Icon(
              Icons.voice_chat,
              size: iconSize,
            ),
            Icon(
              Icons.add_location,
              size: iconSize,
            ),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      Provider.of<PositionService>(context, listen: false).startTracking();
    return Scaffold(
        appBar: MyAppBar(),
        drawer: menu(),
        body: getCenter3());
  }
}

/*Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 24.0,
        ), 

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
}*/