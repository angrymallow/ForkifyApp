
import 'package:ForkifyApp/constants.dart';
import 'package:flutter/material.dart';
import './home/home_page.dart';
import './constants.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: colorPrimary, fontFamily: 'Oxygen')),
        
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

