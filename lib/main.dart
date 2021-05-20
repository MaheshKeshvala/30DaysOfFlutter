import 'package:demo_ch_1/pages/home_page.dart';
import 'package:demo_ch_1/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.purple),
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
