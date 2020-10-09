import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ForkifyApp/utilities/constants.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double maxHeight = headerHeight;
    double maxWidth = MediaQuery.of(context).size.width;

    return Container(
      height: maxHeight,
      child: Stack(
        children: <Widget>[
          Container(
            height: maxHeight- 30,
            decoration: BoxDecoration(
                color: Color(0xFFF9F5F3),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          Container(
            width: maxWidth,
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
              padding: EdgeInsets.symmetric(horizontal: 30),
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
    );
  }
}
