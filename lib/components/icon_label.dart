import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:flutter_svg/svg.dart';



class IconLabel extends StatelessWidget {
  const IconLabel({
    Key key,
    @required this.icon,
    @required this.label,
    this.width: 130,
    this.iconSize: 25,
  }) : super(key: key);

  final String icon;
  final String label;
  final double width;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: Row(
        children: [
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(
              right: 10,
              left: 2,
            ),
            child: SvgPicture.asset(
              icon,
              color: colorPrimary,
              height: iconSize,
            ),
          ),
          Flexible(
            child: Text(
              label,
              style: TextStyle(color: colorBlack),
            ),
          ),
        ],
      ),
    );
  }
}
