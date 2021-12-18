import 'package:flutter/material.dart';
import 'package:mguidevisitor/mainPage.dart';
import 'package:mguidevisitor/menu.dart';
import 'package:mguidevisitor/myAppBar.dart';

class MuseumInfo extends StatefulWidget {
  const MuseumInfo({Key? key}) : super(key: key);

  @override
  _MuseumInfoState createState() => _MuseumInfoState();
}

class _MuseumInfoState extends State<MuseumInfo> {
  final _biggerFont = const TextStyle(fontSize: 100.0);
  final _biggerFont2 =
      const TextStyle(fontSize: 27.0, fontWeight: FontWeight.w600);
  double iconSize = 40;
  final midFont = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300);
  final midFont2 = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300);
  final midFont3 = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400);
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

  getCenter3() {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Center(
              child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 10.0),
                height: 130.0,
                child: Text('Informacje o muzeum',
                    textAlign: TextAlign.center, style: _biggerFont2),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                  height: 200.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                          child: Text('Godziny otwarcia:',
                              textAlign: TextAlign.left, style: midFont3)),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 8.0),
                          child: Text('- poniedziałek nieczynne,',
                              textAlign: TextAlign.left, style: midFont)),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                          child: Text('- wtorek - piątek: 9:00 - 17:00',
                              textAlign: TextAlign.left, style: midFont)),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
                          child: Text('- sobota i niedziela: 10:00 - 20:00',
                              textAlign: TextAlign.left, style: midFont))
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                  height: 250.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                          child: Text('Kontakt:',
                              textAlign: TextAlign.left, style: midFont3)),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 8.0),
                          child: Text('Muzeum Narodowe',
                              textAlign: TextAlign.left, style: midFont)),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                          child: Text('ul. Muzealna 4/2, 12-456 Łódź',
                              textAlign: TextAlign.left, style: midFont)),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                          child: Text('tel: 132 456 879',
                              textAlign: TextAlign.left, style: midFont)),
                      Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
                          child: Text('email: kontakt@muzeum.pl',
                              textAlign: TextAlign.left, style: midFont)),
                    ],
                  )),

              /*  Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              height: 300.0,
              // color: Colors.yellow,
              child: Image(image: AssetImage('assets/index.jpg'))),*/
              Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: SizedBox(width: 200, height: 50, child: getButton2())),
              /*  Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: getTab()),
          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: getInput())*/
            ],
          ))
        ]);
  }

  getInput() {
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

  getButton2() {
    return ElevatedButton.icon(
        label: Text('Wróć'),
        icon: Icon(
          Icons.east,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          print('Pressed');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        },
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)));
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
    return Scaffold(
        appBar: MyAppBar(),
        drawer: Menu(),
        body: getCenter3());
  }
}
