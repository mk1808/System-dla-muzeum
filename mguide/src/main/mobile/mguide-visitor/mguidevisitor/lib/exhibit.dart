import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mguidevisitor/duringVisiting.dart';
import 'package:mguidevisitor/menu.dart';
import 'package:mguidevisitor/myAppBar.dart';
import 'package:mguidevisitor/models/models.dart' as Models;
import 'package:mguidevisitor/services/changeHtmlStyleService.dart';
import 'package:mguidevisitor/services/restService.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Exhibit extends StatefulWidget {
  final Models.Exhibit? exhibit;
  const Exhibit({ Key? key, this.exhibit }) : super(key: key);

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
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'dQw4w9WgXcQ',
    flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
    ),
);

      String getLink(){
        if(widget.exhibit!= null){
          var link = widget.exhibit?.link;
          if(link != null)
            return link.replaceAll("https://www.youtube.com/watch?v=", "");
        }
        return "dQw4w9WgXcQ";
      }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
    initialVideoId: getLink(),
    flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
    ),
);
  }

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
          child: Text('Eksponat numer ${widget.exhibit?.number}',
              textAlign: TextAlign.left, style: midFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12.0, 40.0, 12.0, 10.0),
          height: 120.0,
          child: Text('${widget.exhibit?.name}',
              textAlign: TextAlign.center, style: _biggerFont2),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            height: 300.0,
            // color: Colors.yellow,
            child: Image.network(getPhotoSrc(widget.exhibit))
            ),
        Container(
          padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 10.0),
          //height: 100.0,
          child: Html(data: ChangeHtmlStyleService().changeHtml(widget.exhibit?.description), style: {
            "p": Style(
              fontFamily: 'Roboto',
            ),
          },
          
          ),
        ),
        widget.exhibit?.link != null ? YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          // videoProgressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _controller.addListener(() {});
          },
        ): Text(""),
       
        /*
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
              'Jan Matejko by?? wybitnym polskim malarzem. Zajmowa?? si?? on g????wnie malarstwem historycznym i batalistycznym. By?? on r??wnie?? wielkim patriot??, st??d oczywistym by??o, ??e bitwa tak wa??na jak bitwa pod Grunwaldem nie mog??a pozosta?? pomini??ta przez tego wybitnego malarza.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 100.0,
          child: Text(
              'Bitwa pod Grunwaldem by??a jedn?? z najwi??kszych bitew ??redniowiecznej Europy. Stoczono j?? na polach niedaleko wsi Grunwald, 15 lipca 1410 roku. W bitwie star??y si?? si??y polsko-litewskie z zakonem krzy??ackim. Bitwa zako??czy??a si?? zwyci??stwem wojsk polsko-litewskich.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 200.0,
          child: Text(
              'Jan Matejko obraz malowa?? w latach 1872???1878. Poniewa?? dzia??o si?? to przesz??o 450 lat po rzeczywistych wydarzeniach, w celu oddania historycznej warto??ci opiera?? si?? on na r????nych ??r??d??ach w celu pozyskania widzey. G????wnie bazowa?? na kronikach Jana D??ugosza.',
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
              'Obraz symbolicznie przedstawia bitw??, kt??ra wci???? si?? toczy, jednak szala zwyci??stwa wyra??nie przechyla si?? w stron?? polsko-litewsk??.',
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
              'W centrum obrazu widnieje posta?? ksi??cia litewskiego Witolda. Jest on ubrany w czerwony ??upan i mitr??. Nie posiada pancerza, posiada jedynie miecz i tarcz??, kt??re unosi w ge??cie zwyci??stwa. ',
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
              'Na lewo od ksi??cia Witolda mo??na zobaczy?? Ulricha von Jungingena - mistrza zakonu krzy??ackiego. Wyra??nie mo??na zauwa??y?? przera??enie na jego twarzy. Przera??enie to wynika z bliskiej obecno??ci dw??ch wojownik??w, kt??rzy chc?? mistrza pozbawi?? ??ycia. ',
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
              'W tej cz????ci g????wn?? rol?? odgrywa p??dz??ce wsparcie dla mistrza zakonu, w postaci ksi??cia szczeci??skiego Kazimierza V. Nie mo??e on jednak przyj???? z pomoc?? mistrzowi, poniewa?? jest atakowany przez polskich rycerzy.',
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
              'W prawej cz????ci obrazu wida?? trwaj??c?? walk?? pomi??dzy najznakomitszymi rycerzami polskimi oraz najwa??niejszymi rycerzami krzy??ackimi. R??wnie?? w tej cz????ci wyra??nie zosta??o zaznaczone g??rowanie polskiej si??y nad si??ami krzy??ackimi.',
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
              'Obraz po namalowaniu zosta?? sprzedany za 45 tysi??cy zotych re??skich czyli prawie 200 tysi??cy wsp????czesnych z??otych.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'W latach 2010-2012 odby??a si?? renowacja obrazu. Kosztowa??a ponad milion z??otych, zu??yto ponad 2,5 tysi??ca skalpeli i 150 litr??w rozpuszczalnik??w. Efektem by??o pozbycie si?? starych pozosta??o??ci po poprzednich renowacjach oraz innych niedoskona??o??ci, kt??re w sumie odchudzi??y obraz o 200 kg.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          //height: 550.0,
          child: Text(
              'Na obrazie mistrz Urlich Von Jungingen jest atakowany przez dw??ch rycerzy polskich. Jeden z nich trzyma w????cznie ??wi??tego Maurycego, kt??ra mia??a symbolizowa?? fa??szywo???? zakonu krzy??ackiego. Drugi z atakuj??cych ma na g??owie kaptur katowski, a do pasa ma przytroczony ja??mu??niczk?? na monet?? od skaza??ca, co symbolizowa?? mo??e wymierzenie sprawiedliwo??ci.',
              textAlign: TextAlign.justify,
              style: defaultFont),
        ),
*/

        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: SizedBox(width: 300, height: 50, child: getButton())),

      ],
    ));
  }

    getPhotoSrc(Models.Exhibit? exhibit){
    if(exhibit!.photo!=null){
      return RestService.hostPhoto + exhibit.photo;
    }return "";
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
        label: Text('Wr????'),
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

