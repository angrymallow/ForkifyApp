import 'package:flutter/material.dart';
import 'package:ForkifyApp/utilities/constants.dart';

class RecipeGeneralInfo extends StatelessWidget {
  const RecipeGeneralInfo({
    Key key,
    @required this.title,
    @required this.imageURL,
  }) : super(key: key);

  final String title;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .3,
      // padding: EdgeInsets.only(top:10, bottom: 10),
      color: Colors.white,
      child: Stack(
        children: [
          Hero(
            tag: this.title.toUpperCase(),
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                    Color(0xFFFBDB89).withOpacity(0.5),
                    BlendMode.lighten,
                  ),
                  image: ResizeImage(
                      NetworkImage(
                        this.imageURL,
                      ),
                      width: 280,
                      height: 200),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(
                    top: 10, bottom: 10, right: 20, left: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [colorTertiary, colorPrimary],
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: colorPrimary.withOpacity(0.16),
                    ),
                  ],
                ),
                child: Text(
                  this.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}