import 'package:flutter/material.dart';
import 'package:insta_ui_only/myColors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final IconData prefixIconData;
  final double height;
  final double width;
  // final IconData suffinIconData;
  // final IconData prefixIconData;

  TextFieldWidget({
    required this.hintText,
    required this.obscureText,
    required this.prefixIconData,
    required this.height,
    required this.width,
    // required this.suffinIconData,
    // required this.prefixIconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextField(
        obscureText: obscureText,
        cursorColor: Colors.grey[400],
        cursorWidth: 2,
        autocorrect: true,
        enabled: true,
        cursorRadius: Radius.circular(50),
        cursorHeight: 20,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey[600]),
          focusColor: Colors.grey,
          filled: true,
          fillColor: Colors.grey.shade100,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey.shade900,
              width: 1,
            ),
          ),
          labelText: hintText,
          prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: kGrey,
          ),
        ),
      ),
    );
  }
}
