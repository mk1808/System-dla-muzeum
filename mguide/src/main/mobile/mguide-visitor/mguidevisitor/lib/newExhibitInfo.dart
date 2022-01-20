import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mguidevisitor/duringVisiting.dart';
import 'package:mguidevisitor/exhibit.dart';
import 'package:mguidevisitor/menu.dart';
import 'package:mguidevisitor/models/models.dart' as Models;
import 'package:mguidevisitor/museumInfo.dart';
import 'package:mguidevisitor/myAppBar.dart';
import 'package:mguidevisitor/services/pointService.dart';
import 'package:mguidevisitor/services/restService.dart';
import 'package:provider/provider.dart';
class NewExhibitInfo extends StatefulWidget {
  final int objectId;
  const NewExhibitInfo({ Key? key, this.objectId=0 }) :  super(key: key);
     

  @override
  _NewExhibitInfoState createState() => _NewExhibitInfoState();
}

class _NewExhibitInfoState extends State<NewExhibitInfo> {
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
          children: [Text('170 Reviews'), Text('170 Reviews'), getButton2()]),
      
    );
  }

  getCenter3(Models.Exhibit? exhibit) {
    return Container(
        child: Column(
      children: [
          Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          height: 80.0,
          child: Text(
              'Eksponat numer ${exhibit?.number}',
              textAlign: TextAlign.left,
              style: midFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 20.0),
          height: 160.0,
          child: Text('${exhibit?.name}',
              textAlign: TextAlign.center, style: _biggerFont2),
        ),Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              height: 300.0,
              // color: Colors.yellow,
              child:Image.network(getPhotoSrc(exhibit))
              ),
      
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: SizedBox(width: 300, height: 50, child: getButton(exhibit))),
            Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: SizedBox(width: 300, height: 50, child: getButton2())),
      ],
    ));
  }

  getPhotoSrc(Models.Exhibit? exhibit){
    if(exhibit!.photo!=null){
      return RestService.hostPhoto + exhibit.photo;
    }return "";
  }



  getButton(Models.Exhibit? exhibit) {
    return ElevatedButton.icon(
        label: Text('Zobacz opis'),
        icon: Icon(
          FontAwesomeIcons.clipboardList,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          print('Pressed');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Exhibit(exhibit:exhibit)));
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ));
  }

  getButton2() {
    return ElevatedButton.icon(
        label: Text('Wróć'),
        icon: Icon(
          FontAwesomeIcons.longArrowAltLeft,
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
        appBar: MyAppBar(),
        drawer: Menu(),
        body: Consumer<PointService>(builder: (context, pointService, child) {
          print('myid'+widget.objectId.toString());
          return getCenter3(pointService.getPointById(widget.objectId)?.exhibit);
        }));
  }
}

