import 'package:ForkifyApp/core/ui/default_appbar.dart';
import 'package:ForkifyApp/core/ui/header_component_container.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/ui/components/navigation.dart';
import 'package:ForkifyApp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              child: Container(
                height: MediaQuery.of(context).size.height - headerSize,
                margin: EdgeInsets.only(top: 15),
                padding:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                decoration: BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                      RecipeDetails(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({
    Key key,
  }) : super(key: key);

//TODO: Add Lazy Loading list load make bottom gradient that indicates that there is still recipe to view :)
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(10),
      color: colorSecondary,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.only(
              right: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/test-3.jpg',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    colorTertiary.withOpacity(0.3),
                    BlendMode.lighten,
                  )),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Best Pizza Dough Ever'.toUpperCase(),
                  style: TextStyle(
                    color: colorBlack,
                  ),
                ),
                Text(
                  '101 COOKBOOKS',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/heart.svg',
                color: colorPrimary,
              ),
              Text('999')
            ],
          ),
        ],
      ),
    );
  }
}
