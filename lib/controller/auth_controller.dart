import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/helper/firebase_auth_helper.dart';
import 'package:truckdelivery/helper/firestore_database_helper.dart';
import 'package:truckdelivery/helper/shared_preference_helper.dart';
import 'package:truckdelivery/model/user_model.dart';

class AuthController extends GetxController {
  FirebaseAuthHelper _firebaseAuthHelper = FirebaseAuthHelper.instance;
  FirestoreDatabaseHelper _firestoreDatabaseHelper = FirestoreDatabaseHelper.instance;
  SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper.instance;
  Rx<bool> isMale = false.obs;
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  String? otp;

  Future<String?> signUp() async {
    try {
      final userCredential = await _firebaseAuthHelper.createAccountWithEmail(email.value.text, password: password.value.text);
      final userUid = userCredential.user?.uid;
      if (userUid == null) return null;
      final userData = UserModel(
          firstName: firstName.value.text,
          email: email.value.text,
          id: userUid,
          image: '',
          lastName: lastName.value.text,
          phone: phoneNumber.value.text,
          gender: isMale.value);
      final updatedUser = await _firestoreDatabaseHelper.addUser(userData);
      if (updatedUser == null) return null;
      _sharedPreferenceHelper.storeUser(updatedUser);
      return '';
    } on FirebaseAuthException catch (e) {
      return _firebaseAuthHelper.getErrorMessage(e);
    } catch (e) {
      return null;
    }
  }

  Future<String?> login() async {
    try {
      await _firebaseAuthHelper.signIn(email.value.text, password.value.text);
      final user = _firebaseAuthHelper.currentUser;
      if (user == null) return null;
      final userData = await _firestoreDatabaseHelper.getUser(user.uid);
      if (userData == null) return null;
      _sharedPreferenceHelper.storeUser(userData);
      return '';
    } on FirebaseAuthException catch (e) {
      return _firebaseAuthHelper.getErrorMessage(e);
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  Future<String?> phoneVerify() async {
    try {
      otp = await _firebaseAuthHelper.verifyPhoneNumber(phoneNumber.value.text);
      if (otp == '') return '';
      print('otp');
      print(otp);
      return otp;
    } on FirebaseAuthException catch (e) {
      return _firebaseAuthHelper.getErrorMessage(e);
    } catch (_) {
      return null;
    }
  }

  Future<String?> checkedOtp(String sms) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: otp!,
        smsCode: sms,
      );
      return 'user';
    }catch (_) {
      return null;
    }
  }
}
