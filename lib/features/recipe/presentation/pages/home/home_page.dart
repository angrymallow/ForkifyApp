import 'package:ForkifyApp/core/ui/default_appbar.dart';
import 'package:ForkifyApp/core/ui/header_component_container.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'components/search_textbox.dart';

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
    double headerSize = MediaQuery.of(context).size.height * 0.08;
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [colorTertiary, colorPrimary],
          ),
        ),
        child: Column(
          children: <Widget>[
            HeaderComponentContainer(
              headerSize: headerSize,
              component: SearchTextBox(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
