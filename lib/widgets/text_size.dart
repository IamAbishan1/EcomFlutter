import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  //TextOverflow overFlow;

  SmallText({Key? key,
    this.color = const Color(0xFF89dad8),
    required this.text,
    this.size = 20,
    this.height = 1.2,
    //this.overFlow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        //overflow: overFlow,
        style: TextStyle(
            color: color,
            fontFamily: 'Roboto',
            //fontSize: size == 0?Dimensions.height10:size,

            fontWeight: FontWeight.w400,
            height: height
        )

    );

  }
}

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        maxLines: 1,
        overflow: overFlow,
        style: TextStyle(
            color: color,
            fontSize: size == 0?Dimensions.font20:size,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400
        )

    );

  }
}