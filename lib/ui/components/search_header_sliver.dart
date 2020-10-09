import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliverSearchHeader implements SliverPersistentHeaderDelegate {
  SliverSearchHeader({
    this.minExtent,
    @required this.maxExtent,
  });

  final double minExtent;
  final double maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 1.0,
                      child: Container(
              height: setHeaderHeight(shrinkOffset) - 30,
              decoration: BoxDecoration(
                  color: Color(0xFFF9F5F3),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ),
          Positioned(
            child: Opacity(
              opacity: setOpacity(shrinkOffset),
                          child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 50,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 50),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.30),
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

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  double setOpacity(double shrinkOffset) {
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  double setHeaderHeight(double shrinkOffset) {
    return max(minExtent,  maxExtent - shrinkOffset);
  }
}
