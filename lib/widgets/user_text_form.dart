import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCred extends StatelessWidget {

  final String hint, label;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const UserCred({
    Key? key,
    this.hint= "",
    this.label = "",
    this.keyboardType = TextInputType.text,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          TextFormField(
            obscureText: obscureText,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              // icon: Icon(Icons.icon),
              labelText: label,
              hintText: hint,

            ),
          ),
          // const Divider(
          //   // height: 10,
          //   // thickness: 5,
          //   indent: 20,
          //   endIndent: 0,
          //   color: Colors.black,
          // ),
        ],
      ),

    );
  }
}
