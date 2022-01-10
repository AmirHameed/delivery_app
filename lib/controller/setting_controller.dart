import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/helper/firebase_auth_helper.dart';
import 'package:truckdelivery/helper/firestore_database_helper.dart';
import 'package:truckdelivery/helper/shared_preference_helper.dart';
import 'package:truckdelivery/model/user_model.dart';

class SettingController extends GetxController {
  FirebaseAuthHelper _firebaseAuthHelper = FirebaseAuthHelper.instance;
  SharedPreferenceHelper _sharedPreferenceHelper = SharedPreferenceHelper.instance;
   String? name;
   UserModel?userModel;
  Future<void> logout() async {
    _firebaseAuthHelper.signout();
    _sharedPreferenceHelper.clear();
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
  getUser()async{
     name= await _sharedPreferenceHelper.user().then((value) { print(value); return;});
  }
}
