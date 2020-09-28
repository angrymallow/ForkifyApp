import 'package:flutter/material.dart';

import '../model/recipe_model.dart';
import './body.dart';
import '../components//navigation.dart';


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

    // this.topRecipes.add(new Recipe(
    //     "Best Pizza Dough Ever",
    //     "101 Cookbooks",
    //     "http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg",
    //     true,
    //     135));

    // this.topRecipes.add(new Recipe(
    //     "Deep Dish Fruit Pizza",
    //     "The Pioneer Woman",
    //     "http://forkify-api.herokuapp.com/images/fruitpizza9a19.jpg",
    //     false,
    //     120));

    // this.topRecipes.add(new Recipe(
    //     "Pizza Dip",
    //     "Closet Cooking",
    //     "http://forkify-api.herokuapp.com/images/Pizza2BDip2B12B500c4c0a26c.jpg",
    //     false,
    //     110));

    // this.topRecipes.add(new Recipe(
    //     "Pizza Quesadillas (aka Pizzadillas)",
    //     "Closet Cooking",
    //     "http://forkify-api.herokuapp.com/images/Pizza2BQuesadillas2B2528aka2BPizzadillas25292B5002B834037bf306b.jpg",
    //     false,
    //     97));

    return Scaffold(
      body: PageBody(topRecipes: topRecipes),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}

