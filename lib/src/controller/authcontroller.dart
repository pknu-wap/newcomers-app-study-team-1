import 'package:flutter_clone_instagram/src/models/instagram_user.dart';
import 'package:flutter_clone_instagram/src/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  Rx<IUser> user = IUser().obs;

  Future<IUser?> loginUser(String uid) async {
    var userData = await UserRepository.loginUserByUid(uid);
    return userData;
  }

  void signup(IUser signupUser) async {
    var result = await UserRepository.signup(signupUser);
    if (result) {
      user(signupUser);
    }
  }

  // if (thumbnail == null) {
  //   _submitSignup(signupUser);
  // } else {
  //   var task = uploadXFile(
  //     thumbnail,
  //     '${signupUser.uid}/profile.${thumbnail.path.split('.').last}',
  //   );
  //   task.snapshotEvents.listen((event) async {
  //     print(event.bytesTransferred);
  //     if (event.totalBytes == event.bytesTransferred &&
  //         event.state == TaskState.success) {
  //       var downloadUrl = await event.ref.getDownloadURL();
  //       var updatedUserData = signupUser.copyWith(thumbnail: downloadUrl);
  //       _submitSignup(updatedUserData);
  //     }
  //   });
  // }
}
  // UploadTask uploadXFile(XFile file) {
  // //UploadTask uploadXFile(XFile file, String filename) {
  //   var f = File(file.path);
  //   var ref = FirebaseStorage.instance.ref().child('users').child(filename);
  //   final metadata = SettableMetadata(
  //     contentType: 'image/jpeg',
  //     customMetadata: {'picked-file-path': file.path},
  //   );
  //   return ref.putFile(f, metadata);
  // }

  // void _submitSignup(IUser signupUser) async {
  //   var result = await UserRepository.signup(signupUser);
  //   if (result) {
  //     user(signupUser);
  //   }
  // }
