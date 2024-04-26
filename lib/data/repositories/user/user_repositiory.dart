import 'package:blood_donor/data/repositories/user/user_model.dart';
import 'package:blood_donor/utils/exceptions/firebase_exceptions.dart';
import 'package:blood_donor/utils/exceptions/format_exceptions.dart';
import 'package:blood_donor/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositiory extends GetxController {
  static UserRepositiory get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again later.';
    }
  }
}
