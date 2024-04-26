import 'package:blood_donor/common/warning_snackbar.dart';
import 'package:blood_donor/data/repositories/user/user_model.dart';
import 'package:blood_donor/data/repositories/user/user_repositiory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepositiory = Get.put(UserRepositiory());
  Future<void> saveUserRecords(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final userName =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        final user = UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
          userName: userName,
          profilePicture: userCredential.user!.photoURL ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
        );
        await userRepositiory.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data Not Saved',
          message:
              'Something went wrong While Saving Data,You can re-save it from Profile');
    }
  }
}
