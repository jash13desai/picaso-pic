import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;

  ButtonWidget({
    this.title,
    this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Global.white : Colors.blue[500],
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Global.mediumBlue,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          splashColor: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? Colors.blue[400] : Global.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
