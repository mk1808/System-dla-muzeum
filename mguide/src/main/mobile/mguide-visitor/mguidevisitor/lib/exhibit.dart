import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mguidevisitor/duringVisiting.dart';
import 'package:mguidevisitor/menu.dart';
import 'package:mguidevisitor/myAppBar.dart';
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

  final headerFont = const TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300);
  final header2Font = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w300);
  final defaultFont = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300);


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
          child: Text('Eksponat numer 1',
              textAlign: TextAlign.left, style: midFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 10.0),
          height: 120.0,
          child: Text('Obraz "Bitwa pod Grunwaldem" - Jan Matejko',
              textAlign: TextAlign.center, style: _biggerFont2),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            height: 300.0,
            // color: Colors.yellow,
            child: Image(image: AssetImage('./assets/index.jpg'))),
        
        
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 100.0,
          child: Text(
              'Powstanie obrazu',
              textAlign: TextAlign.justify,
              style: headerFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 150.0,
          child: Text(
              'Jan Matejko był wybitnym polskim malarzem. Zajmował się on głównie malarstwem historycznym i batalistycznym. Był on również wielkim patriotą, stąd oczywistym było, że bitwa tak ważna jak bitwa pod Grunwaldem nie mogła pozostać pominięta przez tego wybitnego malarza.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 100.0,
          child: Text(
              'Bitwa pod Grunwaldem była jedną z największych bitew średniowiecznej Europy. Stoczono ją na polach niedaleko wsi Grunwald, 15 lipca 1410 roku. W bitwie starły się siły polsko-litewskie z zakonem krzyżackim. Bitwa zakończyła się zwycięstwem wojsk polsko-litewskich.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 200.0,
          child: Text(
              'Jan Matejko obraz malował w latach 1872–1878. Ponieważ działo się to przeszło 450 lat po rzeczywistych wydarzeniach, w celu oddania historycznej wartości opierał się on na różnych źródłach w celu pozyskania widzey. Głównie bazował na kronikach Jana Długosza.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        

        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          //height: 100.0,
          child: Text(
              'Opis obrazu',
              textAlign: TextAlign.justify,
              style: headerFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 150.0,
          child: Text(
              'Obraz symbolicznie przedstawia bitwę, która wciąż się toczy, jednak szala zwycięstwa wyraźnie przechyla się w stronę polsko-litewską.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          //height: 100.0,
          child: Text(
              'Centrum',
              textAlign: TextAlign.justify,
              style: header2Font),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 100.0,
          child: Text(
              'W centrum obrazu widnieje postać księcia litewskiego Witolda. Jest on ubrany w czerwony żupan i mitrę. Nie posiada pancerza, posiada jedynie miecz i tarczę, które unosi w geście zwycięstwa. ',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            height: 300.0,
            // color: Colors.yellow,
            child: Image(image: AssetImage('./assets/centrum.jpg'))),


        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'Na lewo od księcia Witolda można zobaczyć Ulricha von Jungingena - mistrza zakonu krzyżackiego. Wyraźnie można zauważyć przerażenie na jego twarzy. Przerażenie to wynika z bliskiej obecności dwóch wojowników, którzy chcą mistrza pozbawić życia. ',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            height: 300.0,
            // color: Colors.yellow,
            child: Image(image: AssetImage('./assets/lewa.jpg'))),

        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          //height: 550.0,
          child: Text(
              'Lewa strona obrazu',
              textAlign: TextAlign.justify,
              style: header2Font),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'W tej części główną rolę odgrywa pędzące wsparcie dla mistrza zakonu, w postaci księcia szczecińskiego Kazimierza V. Nie może on jednak przyjść z pomocą mistrzowi, ponieważ jest atakowany przez polskich rycerzy.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          //height: 550.0,
          child: Text(
              'Prawa strona obrazu',
              textAlign: TextAlign.justify,
              style: header2Font),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'W prawej części obrazu widać trwającą walkę pomiędzy najznakomitszymi rycerzami polskimi oraz najważniejszymi rycerzami krzyżackimi. Również w tej części wyraźnie zostało zaznaczone górowanie polskiej siły nad siłami krzyżackimi.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            height: 300.0,
            // color: Colors.yellow,
            child: Image(image: AssetImage('./assets/prawa.jpg'))),




        

        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
          //height: 100.0,
          child: Text(
              'Ciekawostki',
              textAlign: TextAlign.justify,
              style: headerFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'Obraz po namalowaniu został sprzedany za 45 tysięcy zotych reńskich czyli prawie 200 tysięcy współczesnych złotych.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'W latach 2010-2012 odbyła się renowacja obrazu. Kosztowała ponad milion złotych, zużyto ponad 2,5 tysiąca skalpeli i 150 litrów rozpuszczalników. Efektem było pozbycie się starych pozostałości po poprzednich renowacjach oraz innych niedoskonałości, które w sumie odchudziły obraz o 200 kg.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'Na obrazie mistrz Urlich Von Jungingen jest atakowany przez dwóch rycerzy polskich. Jeden z nich trzyma włócznie Świętego Maurycego, która miała symbolizować fałszywość zakonu krzyżackiego. Drugi z atakujących ma na głowie kaptur katowski, a do pasa ma przytroczony jałmużniczkę na monetę od skazańca, co symbolizować może wymierzenie sprawiedliwości.',
              textAlign: TextAlign.justify,
              style: defaultFont),
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
        label: Text('Kontynuuj zwiedzanie'),
        icon: Icon(
           FontAwesomeIcons.walking,
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
        body: whole());
  }
}

