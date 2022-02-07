import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truckdelivery/helper/firebase_auth_helper.dart';
import 'package:truckdelivery/helper/firebase_storage_helper.dart';
import 'package:truckdelivery/helper/firestore_database_helper.dart';
import 'package:truckdelivery/helper/get_storage_helper.dart';
import 'package:truckdelivery/model/order.dart';
import 'package:truckdelivery/model/user_model.dart';

class SettingController extends GetxController {
  FirebaseAuthHelper _firebaseAuthHelper = FirebaseAuthHelper.instance;
  GetStorageHelper getStorageHelper=GetStorageHelper.instance;
  FirebaseStorageHelper _firebaseStorageHelper=FirebaseStorageHelper.instance;
  FirestoreDatabaseHelper _firestoreDatabaseHelper=FirestoreDatabaseHelper.instance;
  UserModel? userModel;
  List<Order> order=[];
  Future<void> logout() async {
    _firebaseAuthHelper.signout();
    getStorageHelper.clear();
  }

  @override
  void onInit() async{
     final user=await getStorageHelper.user();
     if(user==null)return null;
     userModel=user;
     getOrderRequest();
     update();
     notifyChildrens();
    super.onInit();
  }

  Future<void> updateUser(XFile? file) async {
    final previousUser = await getStorageHelper.user();
    if (previousUser == null) throw Exception();
    final imagePath = file != null ? await _firebaseStorageHelper.uploadImage(File(file.path)) : previousUser.image;
    if (imagePath == null) return;

    final updatedUser = previousUser.copyWith(image: imagePath);
    await _firestoreDatabaseHelper.updateUser(updatedUser);
    await getStorageHelper.storeUser(updatedUser);
    final user=await getStorageHelper.user();
    if(user==null)return null;
    userModel=user;
    update();
  }

  Future getOrderRequest() async {
    final user = await getStorageHelper.user();
    if (user == null) return null;
    order = await _firestoreDatabaseHelper.getOrderRequest(user.id);
    update();
    notifyChildrens();
  }
  Future<void> updateOrderRequest(String id) async {
    final previousOrder= await _firestoreDatabaseHelper.getSingleOrderRequest(id);
    if(previousOrder==null)return;
    final updatedOrder =previousOrder.copyWith(status: true);
    _firestoreDatabaseHelper.updateOrder(updatedOrder);
  }



}
