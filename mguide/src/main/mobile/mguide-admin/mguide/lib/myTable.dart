// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mguide/mapExhibitsStart.dart';

class MyTable extends StatefulWidget {
  const MyTable({Key? key}) : super(key: key);

  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter DataTable Example'),
          ),
          body: wholeTable




            ),
    );
  }
var wholeTable = ListView(
   scrollDirection: Axis.vertical,
   shrinkWrap: true,
   children: [
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll())


,
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll()),
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll()),
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll()),
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll()),
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll()),
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll()),
          Container(
            height: 400,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
            child:getTableWithScroll())



   ]
);




var dziala = ListView(
   scrollDirection: Axis.vertical,
      shrinkWrap: true,
        children: [
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(4),
              color: Colors.red,
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
              child: Text("Mario",style: TextStyle(fontSize: 24,color: Colors.white),)),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 8,right: 8),
            height: 160,
            child: ListView.builder(

                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context,index){

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network("https://purepng.com/public/uploads/large/purepng.com-mariomariofictional-charactervideo-gamefranchisenintendodesigner-1701528634653vywuz.png",width: 100,height: 100,),
                          Container(
                          width: 100,
                            color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Mario $index ")),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),

          Container(
              width: double.infinity,
              padding: EdgeInsets.all(4),
              color: Colors.green,
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
              child: Text("Mickey Mouse",style: TextStyle(fontSize: 24,color: Colors.white),)),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 8,right: 8),
            height: 160,
            child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network("https://freepngimg.com/thumb/cartoon/4-2-cartoon-transparent.png",width: 100,height: 100,),
                          Container(
                              width: 100,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("MickeyMouse $index ",style: TextStyle(fontSize: 12),)),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),

          Container(
              width: double.infinity,
              padding: EdgeInsets.all(4),
              color: Colors.blue,
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
              child: Text("Yoshi",style: TextStyle(fontSize: 24,color: Colors.white),)),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 8,right: 8),
            height: 160,
            child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network("https://freepngimg.com/thumb/yoshi/21749-5-yoshi-file.png",width: 100,height: 100,),
                          Container(
                              width: 100,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Yoshi $index ",style: TextStyle(fontSize: 12),)),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),

          Container(
              width: double.infinity,
              padding: EdgeInsets.all(4),
              color: Colors.green,
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
              child: Text("Mickey Mouse",style: TextStyle(fontSize: 24,color: Colors.white),)),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 8,right: 8),
            height: 400,
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context,index){

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network("https://freepngimg.com/thumb/cartoon/4-2-cartoon-transparent.png",width: 300,height: 300,),
                          Container(
                              width: double.infinity,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("MickeyMouse $index ",style: TextStyle(fontSize: 12),)),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),

          Container(
              width: double.infinity,
              padding: EdgeInsets.all(4),
              color: Colors.blue,
              margin: EdgeInsets.only(left: 8,top: 8,right: 8),
              child: Text("Yoshi",style: TextStyle(fontSize: 24,color: Colors.white),)),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 8,right: 8),
            height: 160,
            child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context,index){

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network("https://freepngimg.com/thumb/yoshi/21749-5-yoshi-file.png",width: 100,height: 100,),
                          Container(
                              width: 100,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Yoshi $index ",style: TextStyle(fontSize: 12),)),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      );

}

getTableWithScroll(){
  return ListView(
   scrollDirection: Axis.horizontal,
     // shrinkWrap: true,
      
         //   height: 400,
        children: [    
            
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 8,right: 8),
            //height: 160,
            child:getTable())
            ]);
}
getTable() {
  return 
  
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
      ]),
      DataRow(cells: [
        DataCell(Text('5')),
        DataCell(Text('John')),
        DataCell(Text('Student')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('10')),
        DataCell(Text('Harry')),
        DataCell(Text('Leader')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),

      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
      DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),DataRow(cells: [
        DataCell(Text('15')),
        DataCell(Text('Peter')),
        DataCell(Text('Scientist')),
        DataCell(Text('Actor')),
      ]),
    ],
  );
}

/*
Expanded(
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                      DataTable(
                        columns: [
                          DataColumn(
                              label: Text('ID',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Name',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Profession',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Profession1',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('1')),
                            DataCell(Text('Stephen')),
                            DataCell(Text('Actor')),
                            DataCell(Text('Actor')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('5')),
                            DataCell(Text('John')),
                            DataCell(Text('Student')),
                            DataCell(Text('Actor')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('10')),
                            DataCell(Text('Harry')),
                            DataCell(Text('Leader')),
                            DataCell(Text('Actor')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('15')),
                            DataCell(Text('Peter')),
                            DataCell(Text('Scientist')),
                            DataCell(Text('Actor')),
                          ]),
                        ],
                      ),
                    ]))
 */