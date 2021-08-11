import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_ui_only/screens/AddPostScreen/add_post.dart';

BuildContext context;
void init(BuildContext cntx) {
  context = cntx;
}

void navigate() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddPost(ImageSource.camera)),
  );
}

// Future pickImage(ImageSource uploadMethod) async {
//   final pickedFile = await picker.pickImage(source: uploadMethod);
//   _imageFile = File(pickedFile.path);
//   final firebaseStorageRef =
//       FirebaseStorage.instance.ref().child('images/${_auth.currentUser.uid}/');
//   final uploadTask = firebaseStorageRef.putFile(_imageFile);
//   uploadTask.then((taskSnapshot) {
//     taskSnapshot.ref.getDownloadURL().then((value) async {
//       try {
//         Navigator.of(context).pushNamed(AddPosts.route, arguments: value);
//       } catch (error) {
//         print(error);
//       }
//     });
//   });
// }
