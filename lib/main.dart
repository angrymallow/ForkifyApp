import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F5F3),
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFFFBDB89), const Color(0xFFF48982)])),
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height * 0.2 - 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFF9F5F3),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                  ),
                  Container(
                    width: size.width,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.black.withOpacity(0.16),
                            )
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search over thousand recipes…',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(17),
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFFBDB89),
                                const Color(0xFFF48982)
                              ]),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.black.withOpacity(0.16),
                            )
                          ]),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    'MOST LOVED RECIPES',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Container(
                    width: size.width * .80,
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 90,
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        colorFilter: new ColorFilter.mode(
                                            Color(0xFFFBDB89).withOpacity(0.3),
                                            BlendMode.lighten),
                                        image: AssetImage(
                                            'assets/images/test-3.jpg'))),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BEST PIZZA DOUGH EVER',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '101 COOKBOOKS',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xFF968B87),
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Row(children: [
                                            SvgPicture.asset('assets/icons/heart.svg', color: Color(0xFFF48982),height: 18,),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text('135', style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12),),
                                            )
                                          ],)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            )
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
