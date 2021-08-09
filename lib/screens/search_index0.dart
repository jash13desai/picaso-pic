import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/searchbar_widget.dart';

class SearchIndex0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: SearchBar(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...[
                    "IGTV",
                    "Sports",
                    "Style",
                    "Shop",
                    "Auto",
                    "Clothes",
                    "Nature",
                    "Food"
                  ].map(
                    (text) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            backgroundColor:
                                MediaQuery.of(context).platformBrightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.black,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.grey[700].withOpacity(1),
                                width: 1.3,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            text,
                            style: TextStyle(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
