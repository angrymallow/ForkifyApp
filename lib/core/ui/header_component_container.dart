import 'package:ForkifyApp/utilities/constants.dart';
import 'package:flutter/material.dart';

class HeaderComponentContainer extends StatelessWidget {
  const HeaderComponentContainer({
    Key key,
    @required this.headerSize,
    @required this.component,
  }) : super(key: key);

  final double headerSize;
  final Widget component;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerSize,
      child: Stack(
        children: [
          Container(
            height: headerSize - 25,
            decoration: BoxDecoration(
              color: colorSecondary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: component,
          )
        ],
      ),
    );
  }
}
