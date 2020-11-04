
import 'package:ForkifyApp/core/ui/icon_button_primary.dart';
import 'package:flutter/material.dart';

class SearchTextBox extends StatelessWidget {
  const SearchTextBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search over thousand recipes...",
                hintStyle: TextStyle(color: Colors.grey[300]),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          IconButtonPrimary(
            onTap: () {
              print('test');
            },
          ),
        ],
      ),
    );
  }
}

