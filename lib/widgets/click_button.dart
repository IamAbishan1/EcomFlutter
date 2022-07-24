import 'package:ecom/utils/colors.dart';
import 'package:ecom/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickButton extends StatelessWidget {
  // final String color;
   final String text;
   final Function onPressed;

  const ClickButton({
      // this.color = "",
    required this.onPressed,
      this.text = " ",
  Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed();
      },
      child: Center(
        child: Container(
          width: 250,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: AppColors.blueColor,
            border: Border.all(width: 0.0, color: const Color.fromARGB(255, 26, 31, 4)),

          ),
          child: Padding(
            padding:  EdgeInsets.all(Dimensions.height10),
            child: Text(
                text,
                style: TextStyle(
                  fontSize: Dimensions.font26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
            ),
          ),

        ),
      ),
    );
  }
}
