
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:mguide/drawer.dart';
import 'package:mguide/exhibitsList.dart';
import 'package:mguide/mainPage.dart';
import 'package:mguide/randomWords.dart';
import 'package:mguide/services/exhibitsService.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ExhibitsService()),
          ],
          child:MaterialApp(
        title: 'mGuide Admin',
        theme: ThemeData(
          primaryColor: Colors.cyan[600],
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              //onPrimary: Colors.yellow,
              primary: Colors.cyan[600], //przyciski zwykłe
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                primary: Colors.cyan[600] //przyciski np na dialogu
            )
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        home:  const MainPage(),
        )
        
        
        
        );
  }
}
