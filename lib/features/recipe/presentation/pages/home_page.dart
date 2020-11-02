import 'package:ForkifyApp/core/ui/default_appbar.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/utilities/constants.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Recipe> topRecipes;

  @override
  Widget build(BuildContext context) {

    this.topRecipes = new List<Recipe>();
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Text('Test Body'),
      // bottomNavigationBar: MyBottomNavigation(),
    );
  }
}

