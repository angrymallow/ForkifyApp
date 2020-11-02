import 'package:ForkifyApp/features/recipe/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:ForkifyApp/utilities/constants.dart';
import 'ioc.dart' as ioc;

void main() async {
  await ioc.init();
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
      debugShowCheckedModeBanner: true,
      home: MyHomePage(),
    );
  }
}
