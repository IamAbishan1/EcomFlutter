import 'package:ecom/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  const CategoryItem({
      this.category = " ",
      Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(



      child: Row(
        children: [
          Container(
              width:200,
              height: 150,
              child: Image.asset('assets/image/logo.png',fit: BoxFit.cover,)
          ),
          SizedBox(width: Dimensions.width10,),
          Text(category,
          style: TextStyle(
            fontSize: Dimensions.font20,
            fontWeight: FontWeight.bold
          ),)
        ],
    ),

    );
  }
}
