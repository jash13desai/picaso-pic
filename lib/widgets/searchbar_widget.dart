import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/textfield_widget.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double widthB = MediaQuery.of(context).size.width * 0.085;
    final double widthA = MediaQuery.of(context).size.width * 0.9;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            hintText: 'Search',
            obscureText: false,
            height: MediaQuery.of(context).size.height * 0.05,
            width: widthA,
            prefixIconData: Icons.search,
          ),
        ],
      ),
    );
  }
}
