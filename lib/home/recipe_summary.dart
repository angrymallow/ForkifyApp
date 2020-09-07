import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeSummary extends StatelessWidget {
  const RecipeSummary({
    @required this.title, 
    @required this.publisher,
    @required this.imageURL,
    @required this.likes, 
    Key key,
  }) : super(key: key);

  final String title, publisher, imageURL;
  final int likes;

  @override
  Widget build(BuildContext context) {
    
    return Container(
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
                        Color(0xFFFBDB89).withOpacity(0.4),
                        BlendMode.lighten),
                    image: NetworkImage(
                        '${this.imageURL}'))),
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
                    "${this.title.toUpperCase()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w300),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${this.publisher.toUpperCase()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF968B87),
                              fontSize: 12),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/heart.svg',
                            color: Color(0xFFF48982),
                            height: 18,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 5),
                            child: Text(
                              '${this.likes}',
                              style: TextStyle(
                                  fontWeight:
                                      FontWeight.w300,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
