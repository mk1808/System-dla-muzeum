import 'package:flutter/material.dart';
import 'package:mguide/mainPage.dart';
import 'package:mguide/menu.dart';
import 'package:mguide/myAppBar.dart';
import 'package:mguide/successMapping.dart';

class ChooseExhibitForMapping extends StatefulWidget {
  const ChooseExhibitForMapping({Key? key}) : super(key: key);

  @override
  _ChooseExhibitForMappingState createState() =>
      _ChooseExhibitForMappingState();
}

class _ChooseExhibitForMappingState extends State<ChooseExhibitForMapping> {
  final _biggerFont2 =
      const TextStyle(fontSize: 27.0, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        drawer: menu(),
        body: // MaterialApp(home:
            wholeTable() //)
        );
  }

  wholeTable() {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
              // height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 10.0),
                    height: 160.0,
                    child: Text('Wybierz obiekt z listy',
                        textAlign: TextAlign.center, style: _biggerFont2),
                  ),
                  Container(
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 20.0),
                      //height: 1500.0,
                      child: getInput()),
                       Container(
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 20.0),
                      height: 1020.0,
                      child: getTableWithScroll()),
                          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SizedBox(width: 200, height: 50, child: getButton2())),
                ],
              )),
        ]);
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

  getTableWithScroll() {
    return ListView(scrollDirection: Axis.horizontal,
        // shrinkWrap: true,

        //   height: 400,
        children: [
          Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 8, right: 8),
              //height: 500,
              child: getTable())
        ]);
  }

  getInput() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Wpisz nazwę',
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
onTapOk(){
   Navigator.push(context,
              MaterialPageRoute(builder: (context) => SuccessMapping()));
}
  getTable() {
    return DataTable(
      showCheckboxColumn: false,
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
        DataColumn(
            label: Text('Profession1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Stephen')),
          DataCell(Text('Actor')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('5')),
          DataCell(Text('John')),
          DataCell(Text('Student')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('10')),
          DataCell(Text('Harry')),
          DataCell(Text('Leader')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('15')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('16')),
          DataCell(Text('Peter')),
          DataCell(Text('Scientist')),
          DataCell(Text('Actor')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
      ],
    );
  }

  getDialog(){
    return  showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Mapowanie'),
          content: const Text('Czy powiązać obecne miejsce z obiektem?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Wróć'),
            ),
            TextButton(
              onPressed: () => {onTapOk()},
              child: const Text('OK'),
            ),
          ],
        ),
      );
  }
}
