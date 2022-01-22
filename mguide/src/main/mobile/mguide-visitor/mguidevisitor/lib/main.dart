import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mguidevisitor/mainPage.dart';
import 'package:mguidevisitor/services/exhibitsService.dart';
import 'package:mguidevisitor/services/notificationsService.dart';
import 'package:mguidevisitor/services/pointService.dart';
import 'package:mguidevisitor/services/positionService.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ExhibitsService()),
            ChangeNotifierProvider(create: (context) => PointService()),
            ChangeNotifierProvider(create: (context) => PositionService()),
          ],
          child: MaterialApp(
      title: 'mGuide Admin',
        theme: ThemeData(
          primaryColor: Colors.cyan[600],
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
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
        home: const MainPage(),
    ));
  }
}

