import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hint = "",
    this.keyboardType = TextInputType.text,
    this.controller,
    this.obscureText = false,
  }) : super(key: key);
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xffffffff),
        border: Border.all(width: 0.0, color: const Color.fromARGB(255, 26, 31, 4)),
      ),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          
        ),
      ),
    );
  }
}
