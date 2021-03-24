import 'package:flutter/material.dart';
import 'package:veinticuatrohoras/src/pages/home_page.dart';
import 'package:veinticuatrohoras/src/pages/single_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '24 Horas',
      home: HomePage(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SinglePage.routeName: (BuildContext context) => SinglePage(),
      },
    );
  }
}