import 'package:flutter/material.dart';

// the customizable button -- maybe not used anywhere much 

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
          color: hasBorder ? Colors.white : Colors.blue[500],
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Colors.blue.shade700,
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
                  color: hasBorder ? Colors.blue[400] : Colors.white,
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
