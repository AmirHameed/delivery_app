import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckdelivery/model/user_model.dart';


class GetStorageHelper {
  static const String _USER = 'getSotrage.user';

  static final GetStorageHelper instance = GetStorageHelper._internal();

  GetStorageHelper._internal();
  GetStorage getStorage=GetStorage();


  Future<void> storeUser(UserModel user) async {
    final userSerialization = json.encode(user.toJson());
    print(userSerialization);
    getStorage.write(_USER, userSerialization);
  }

  Future<UserModel?> user() async {
     final  userSerialization =  getStorage.read(_USER);
     print(userSerialization);
     print('get string');
    if (userSerialization == null) return null;
    print(json.decode(userSerialization));
    return UserModel.fromJson((await json.decode(userSerialization)));
  }

  Future<void> clear() async => await getStorage.erase();
}
