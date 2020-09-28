import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
