import 'package:ForkifyApp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import './components/recipe_general_info.dart';
import '../components/icon_label.dart';

class RecipeDeatilsPage extends StatelessWidget {
  final String title;
  final String imageURL;
  final bool isLiked;

  RecipeDeatilsPage(
      {Key key,
      @required this.title,
      @required this.imageURL,
      @required this.isLiked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorSecondary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: colorSecondary,
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: colorPrimary,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Image.asset(
              'assets/images/logo.png',
              height: 35,
            ),
            expandedHeight: 60,
            pinned: true,
            elevation: 0,
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  this.isLiked
                      ? 'assets/icons/heart.svg'
                      : 'assets/icons/heart-outlined.svg',
                  color: colorPrimary,
                  height: 40,
                ),
                color: colorPrimary,
                disabledColor: colorPrimary,
                onPressed: () {
                  print('Heart is pressed');
                },
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  RecipeGeneralInfo(title: title, imageURL: imageURL),
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconLabel(
                          icon: 'assets/icons/clock.svg',
                          label: '90 minutes',
                        ),
                        IconLabel(
                          icon: 'assets/icons/man.svg',
                          label: '4 servings',
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  customBorder: new CircleBorder(),
                                  splashColor: colorPrimary.withOpacity(0.2),
                                  child: Container(
                                    padding: EdgeInsets.all(0.0),
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'assets/icons/circle-with-plus.svg',
                                      color: colorPrimary,
                                      height: 35,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  customBorder: new CircleBorder(),
                                  splashColor: colorPrimary.withOpacity(0.2),
                                  child: Container(
                                    padding: EdgeInsets.all(0.0),
                                    margin: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      'assets/icons/circle-with-minus.svg',
                                      color: colorPrimary,
                                      height: 35,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          colorTertiary,
                          colorPrimary,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: colorPrimary.withOpacity(0.16),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        splashColor: colorPrimary.withOpacity(0.2),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/cart.svg",
                                color: Colors.white,
                              ),
                              Text(
                                'ADD TO SHOPPING LIST',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 20.0,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.end,
                      children: [
                        IconLabel(
                          icon: 'assets/icons/check.svg',
                          label:
                              '6 skinless, boneless chicken breast halves cut into cubes',
                          width: 150,
                          iconSize: 15,
                        ),
                        IconLabel(
                          icon: 'assets/icons/check.svg',
                          label: '6 tbsp butter, divided',
                          width: 150,
                          iconSize: 15,
                        ),
                        IconLabel(
                          icon: 'assets/icons/check.svg',
                          label: '4 Cloves garlic, minced, divided',
                          width: 150,
                          iconSize: 15,
                        ),
                        IconLabel(
                          icon: 'assets/icons/check.svg',
                          label: '1 tablespoon Italian seasoning',
                          width: 150,
                          iconSize: 15,
                        ),
                        IconLabel(
                          icon: 'assets/icons/check.svg',
                          label: '1 pound fettuccini pasta ',
                          width: 150,
                          iconSize: 15,
                        ),
                        IconLabel(
                          icon: 'assets/icons/check.svg',
                          label: '1 tablespoon Italian seasoning',
                          width: 150,
                          iconSize: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: MyBottomNavigation(),
    );
  }
}

