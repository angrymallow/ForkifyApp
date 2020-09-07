import 'package:ForkifyApp/home/search_header_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './model/recipe_model.dart';
import './components/top_recipes.dart';

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
              .apply(bodyColor: Color(0xFFF48982), fontFamily: 'Oxygen')),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
    Size size = MediaQuery.of(context).size;

    this.topRecipes = new List<Recipe>();

    this.topRecipes.add(new Recipe(
        "Best Pizza Dough Ever",
        "101 Cookbooks",
        "http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg",
        true,
        135));

    this.topRecipes.add(new Recipe(
        "Deep Dish Fruit Pizza",
        "The Pioneer Woman",
        "http://forkify-api.herokuapp.com/images/fruitpizza9a19.jpg",
        false,
        120));

    this.topRecipes.add(new Recipe(
        "Pizza Dip",
        "Closet Cooking",
        "http://forkify-api.herokuapp.com/images/Pizza2BDip2B12B500c4c0a26c.jpg",
        false,
        110));

    this.topRecipes.add(new Recipe(
        "Pizza Quesadillas (aka Pizzadillas)",
        "Closet Cooking",
        "http://forkify-api.herokuapp.com/images/Pizza2BQuesadillas2B2528aka2BPizzadillas25292B5002B834037bf306b.jpg",
        false,
        97));
    this.topRecipes.add(new Recipe(
        "Best Pizza Dough Ever",
        "101 Cookbooks",
        "http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg",
        true,
        135));

    this.topRecipes.add(new Recipe(
        "Deep Dish Fruit Pizza",
        "The Pioneer Woman",
        "http://forkify-api.herokuapp.com/images/fruitpizza9a19.jpg",
        false,
        120));

    this.topRecipes.add(new Recipe(
        "Pizza Dip",
        "Closet Cooking",
        "http://forkify-api.herokuapp.com/images/Pizza2BDip2B12B500c4c0a26c.jpg",
        false,
        110));

    this.topRecipes.add(new Recipe(
        "Pizza Quesadillas (aka Pizzadillas)",
        "Closet Cooking",
        "http://forkify-api.herokuapp.com/images/Pizza2BQuesadillas2B2528aka2BPizzadillas25292B5002B834037bf306b.jpg",
        false,
        97));

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFF9F5F3),
      //   elevation: 0,
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFFFBDB89), const Color(0xFFF48982)])),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverSearchHeader(
                minExtent: 100.0,
                maxExtent: 300.0,
              ),
            ),
            SliverToBoxAdapter(child: TopRecipes(topRecipes: this.topRecipes)),
          ],
        ),
      ),

  
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/heart.svg'),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/favicon.png', height: 40),
              title: Text('')),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/cart.svg'), title: Text(''))
        ],
      ),
    );
  }
}
