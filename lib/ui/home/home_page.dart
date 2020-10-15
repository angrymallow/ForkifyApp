import 'package:flutter/material.dart';
import 'package:ForkifyApp/model/recipe.dart';
import 'package:ForkifyApp/ui/home/body.dart';
import 'package:ForkifyApp/ui/components/navigation.dart';


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
      body: PageBody(topRecipes: topRecipes),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}

