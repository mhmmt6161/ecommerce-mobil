import 'package:flutter/material.dart';
import 'package:fryo/src/shared/styles.dart';
import './src/screens/SignInPage.dart';
import './src/screens/SignUpPage.dart';
import './src/screens/tab_creation.dart';
import './src/screens/ProductPage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fryo',
      theme: ThemeData(
        primaryColor: materialOrange.shade700,
      ),
      home: TabCreation(pageTitle: 'Welcome'),
      routes: <String, WidgetBuilder> {
        '/signup': (BuildContext context) =>  SignUpPage(),
        '/signin': (BuildContext context) =>  SignInPage(),
        '/dashboard': (BuildContext context) => TabCreation(),
        '/productPage': (BuildContext context) => ProductPage(),
      },
    );

  }
}
