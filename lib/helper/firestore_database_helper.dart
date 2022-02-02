import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truckdelivery/model/car_rent.dart';
import 'package:truckdelivery/model/furniture.dart';
import 'package:truckdelivery/model/parcel.dart';
import 'package:truckdelivery/model/user_model.dart';

class FirestoreDatabaseHelper {
  static final FirestoreDatabaseHelper instance = FirestoreDatabaseHelper._internal();
  static const String _USER = 'user';
  static const String _PARCEL ='parcel';
  static const String _FURNITURE= 'furniture';
  static const String _RENT_CAR='rent_car';
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirestoreDatabaseHelper._internal() {
    _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
  }

  final _timeoutDuration = const Duration(seconds: 15);

  Future<UserModel?> addUser(UserModel user) async {
      await _firebaseFirestore.collection(_USER).doc(user.id).set(user.toJson()).timeout(_timeoutDuration);
      return user.copyWith(id: user.id);
    }

  Future<UserModel?> getUser(String id) async {
      final documentReference = await _firebaseFirestore.collection(_USER).doc(id).get().timeout(_timeoutDuration);
      if (documentReference.data() == null) return null;
      return UserModel.fromJson(documentReference.data()!);
  }

  Future<Parcel> addParcel(Parcel parcel) async {
    final documentReference = await _firebaseFirestore.collection(_PARCEL).add(parcel.toJson()).timeout(_timeoutDuration);
    return parcel.copyWith(id: documentReference.id);
  }

  Future<Furniture> addFurniture(Furniture furniture) async {
    final documentReference = await _firebaseFirestore.collection(_FURNITURE).add(furniture.toJson()).timeout(_timeoutDuration);
    return furniture.copyWith(id: documentReference.id);
  }
  Future<RentCar> addRentCar(RentCar rentCar) async {
    final documentReference = await _firebaseFirestore.collection(_RENT_CAR).add(rentCar.toJson()).timeout(_timeoutDuration);
    return rentCar.copyWith(id: documentReference.id);
  }

  Future<void> updateUser(UserModel user) =>
      _firebaseFirestore.collection(_USER).doc(user.id).update(user.toJson()).timeout(_timeoutDuration);
}
