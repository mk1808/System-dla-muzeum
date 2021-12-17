import 'package:flutter/material.dart';
import 'package:mguidevisitor/duringVisiting.dart';
import 'package:mguidevisitor/menu.dart';
class Exhibit extends StatefulWidget {
  const Exhibit({ Key? key }) : super(key: key);

  @override
  _ExhibitState createState() => _ExhibitState();
}

class _ExhibitState extends State<Exhibit> {
     final _biggerFont = const TextStyle(fontSize: 100.0);
  final _biggerFont2 =
      const TextStyle(fontSize: 27.0, fontWeight: FontWeight.w600);
  double iconSize = 40;
  final midFont = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300);
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
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('170 Reviews'), Text('170 Reviews'), getButton()]),
      
    );
  }
whole(){
  return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [getCenter3()]
  );
}

  getCenter3() {
    return Container(
        child: Column(
      children: [
          Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          height: 80.0,
          child: Text(
              'Eksponat numer 3 ',
              textAlign: TextAlign.left,
              style: midFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 10.0),
          height: 120.0,
          child: Text('Obraz "Bitwa pod Grunwaldem"',
              textAlign: TextAlign.center, style: _biggerFont2),
        ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              height: 300.0,
              // color: Colors.yellow,
              child: Image(image: AssetImage('./assets/index.jpg'))),
        
      Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          height:600.0,
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lobortis lorem sed mi pellentesque, sed ultricies sem iaculis. Sed non ullamcorper neque, in semper risus. Quisque ac euismod sem, in varius nisl. Maecenas interdum, turpis ac pulvinar consequat, ex arcu ornare orci, vel tristique justo purus semper orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse potenti. In sagittis venenatis sem. Etiam euismod porta turpis ac vehicula.Aliquam at consequat leo, in feugiat eros. Pellentesque ultricies sit amet velit sed tempus. Vestibulum molestie mollis elit, a laoreet neque euismod quis. Fusce facilisis mattis ex sodales euismod. Curabitur tincidunt ut justo vel tincidunt. Phasellus a eros dictum elit placerat scelerisque. Integer volutpat, velit sed interdum dignissim, nulla magna pulvina',
              textAlign: TextAlign.justify,
              style: midFont),
        ),
          Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          height:550.0,
          child: Text(
              'Lorem sed mi pellentesque, sed ultricies sem iaculis. Sed non ullamcorper neque, in semper risus. Quisque ac euismod sem, in varius nisl. Maecenas interdum, turpis ac pulvinar consequat, ex arcu ornare orci, vel tristique justo purus semper orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Suspendisse potenti. In sagittis venenatis sem. Etiam euismod porta turpis ac vehicula.Aliquam at consequat leo, in feugiat eros. Pellentesque ultricies sit amet velit sed tempus. Vestibulum molestie mollis elit, a laoreet neque euismod quis. Fusce facilisis mattis ex sodales euismod. Curabitur tincidunt ut justo vel tincidunt. Phasellus a eros dictum elit placerat scelerisque. Integer volutpat, velit sed interdum dignissim, nulla magna pulvina',
              textAlign: TextAlign.justify,
              style: midFont),
        ),
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: SizedBox(width: 300, height: 50, child: getButton())),

      ],
    ));
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
        label: Text('Zamknij'),
        icon: Icon(
          Icons.east,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          print('Pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Exhibit()));
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ));
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
              context, MaterialPageRoute(builder: (context) => DuringVisiting()));
        },
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)));
  }

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
        appBar: AppBar(
          title: const Text('Opis eksponatu'),
        ),
        drawer: Menu(),
        body: whole());
  }
}

