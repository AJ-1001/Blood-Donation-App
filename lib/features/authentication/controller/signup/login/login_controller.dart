import 'package:blood_donor/common/network_manager.dart';
import 'package:blood_donor/common/warning_snackbar.dart';
import 'package:blood_donor/data/repositories/authentication/authentication_repository.dart';
import 'package:blood_donor/features/personalization/controllers/user_controller.dart';
import 'package:blood_donor/utils/constants/image_strings.dart';
import 'package:blood_donor/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  final userController = Get.put(UserController());
  GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    final rememberEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final rememberPassword = localStorage.read('REMEMBER_ME_PASSWORD');
    if (rememberEmail != null) {
      email.text = rememberEmail;
    }
    if (rememberPassword != null) {
      password.text = rememberPassword;
    }
  }

  Future<void> emailandPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging You In', TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!loginformKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Login Failed', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging You In', TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecords(userCredentials);
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Login Failed', message: e.toString());
    }
  }
}
