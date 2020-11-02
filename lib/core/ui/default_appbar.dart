import 'package:ForkifyApp/utilities/constants.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DefaultAppBar({ 
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorSecondary,
      shadowColor: Colors.transparent,
      title: Image.asset(
                'assets/images/logo.png',
                height: 40,
                alignment: Alignment.bottomCenter,
              ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

