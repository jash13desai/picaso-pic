import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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