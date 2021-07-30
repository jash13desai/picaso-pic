import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'grey_ring_widget.dart';
import 'package:insta_ui_only/functions/upload_image.dart' as imageUpload;

class ChatBox extends StatelessWidget {
  final AssetImage chatImage;
  final String chatName;
  final String chatDetail;
  final String time;
  final bool ringEnabled;

  ChatBox({
    this.chatImage,
    this.chatName,
    this.chatDetail,
    this.time,
    this.ringEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.04,
        MediaQuery.of(context).size.height * 0.015,
        MediaQuery.of(context).size.width * 0.02,
        MediaQuery.of(context).size.height * 0.015,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.071,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  child: ringEnabled
                      ? GreyRing(
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: chatImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: chatImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      0,
                      0,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            chatName,
                            style: TextStyle(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chatDetail,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 11.5,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '•',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11.5,
                                  ),
                                ),
                                Text(
                                  time,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11.5,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () => imageUpload.pickImage(ImageSource.camera),
              icon: Icon(
                FontAwesomeIcons.camera,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
