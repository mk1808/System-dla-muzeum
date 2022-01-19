import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mguide/mainPage.dart';
import 'package:mguide/menu.dart';
import 'package:mguide/models/models.dart';
import 'package:mguide/myAppBar.dart';
import 'package:mguide/services/exhibitsService.dart';
import 'package:mguide/successMapping.dart';
import 'package:provider/provider.dart';

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
                      height: 600.0,
                      child: getTableWithScroll()),
                          Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SizedBox(width: 300, height: 50, child: getButton2())),
                ],
              )),
        ]);
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
              child: getTable2())
        ]);
  }

  getInput() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Wyszukaj po nazwie',
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
            label: Text('Numer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Nazwa eksponatu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        /*DataColumn(
            label: Text('Profession',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Profession1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),*/
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('1')),
          DataCell(Text('Obraz "Bitwa pod Grunwaldem" - Jan Matejko')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('2')),
          DataCell(Text('Obraz "Babie lato" – Józef Chełmoński')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('3')),
          DataCell(Text('Obraz "Bociany" – Józef Chełmoński')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('4')),
          DataCell(Text('Obraz "Dirce chrześcijańska" – Henryk Siemiradzki')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('5')),
          DataCell(Text('Obraz "Dziwny ogród" – Józef Mehoffer')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('6')),
          DataCell(Text('Obraz "Stańczyk" - Jan Matejko')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('7')),
          DataCell(Text('Obraz "Błędne koło" - Jacek Malczewski')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('8')),
          DataCell(Text('Obraz "AD84" - Zdzisław Beksiński')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('9')),
          DataCell(Text('Obraz "Dziewczynka z chryzantemami" - Olga Boznańska')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),
        DataRow(cells: [
          DataCell(Text('10')),
          DataCell(Text('Obraz "Dwie Głowy" - Witkacy')),
        ],
        onSelectChanged: (newValue) {
               return getDialog();  
            },
        ),

      ],
    );
  }
getTable2() {
    return Consumer<ExhibitsService>(
        builder: (context, exhibitsService, child) {
      return DataTable(
          showCheckboxColumn: false,
          columns: [
            DataColumn(
                label: Text('Numer',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Nazwa eksponatu',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            /*DataColumn(
            label: Text('Profession',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        DataColumn(
            label: Text('Profession1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),*/
          ],
          rows: List<DataRow>.generate(
            exhibitsService.items.length,
            (int index) => getDataRow(exhibitsService.items[index])
          ));
    });
  }
  
  getDataRow(Exhibit exhibit){
    return DataRow(
              cells: [
                DataCell(Text("2"+exhibit.id.toString())),
                DataCell(Text(exhibit.name)),
              ],
              onSelectChanged: (newValue) {
                return getDialog();
              },
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
