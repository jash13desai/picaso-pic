import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/textfield_widget.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            isEmailAddress: false,
            hintText: 'Search',
            obscureText: false,
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.9,
            prefixIconData: Icons.search,
          ),
        ],
      ),
    );
  }
}
