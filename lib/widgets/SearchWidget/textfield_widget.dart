import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_ui_only/globals/myFonts.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final IconData prefixIconData;
  final double height;
  final double width;
  final bool isEmailAddress;
  final Function onChanged;
  final Function validator;
  final Function onFieldSubmitted;
  final TextEditingController controller;
  // final IconData suffinIconData;
  // final IconData prefixIconData;

  TextFieldWidget({
    this.hintText,
    this.obscureText,
    this.prefixIconData,
    this.height,
    this.width,
    this.isEmailAddress,
    this.onChanged,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        keyboardType: isEmailAddress ? TextInputType.emailAddress : null,
        obscureText: obscureText,
        cursorColor: Colors.grey[700],
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey[600]),
          // focusColor: Colors.pink,
          filled: true,
          fillColor: Colors.grey.shade100,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          // focusedBorder: OutlineInputBorder(
          //   gapPadding: 3,
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide: BorderSide(
          //     color: Colors.transparent,
          //     width: 1,
          //   ),
          // ),
          hintText: hintText,
          hintStyle: MyFonts.light.setColor(Colors.grey).size(15),
          prefixIcon: Icon(
            prefixIconData,
            size: 20,
            color: Colors.grey[700],
          ),
        ),
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
