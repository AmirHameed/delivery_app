import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truckdelivery/model/car_rent.dart';
import 'package:truckdelivery/model/chat.dart';
import 'package:truckdelivery/model/furniture.dart';
import 'package:truckdelivery/model/order.dart';
import 'package:truckdelivery/model/parcel.dart';
import 'package:truckdelivery/model/user_model.dart';
import 'package:truckdelivery/model/user_model2.dart';

class FirestoreDatabaseHelper {
  static final FirestoreDatabaseHelper instance = FirestoreDatabaseHelper._internal();
  static const String _USER = 'user';
  static const String _PARCEL ='parcel';
  static const String _FURNITURE= 'furniture';
  static const String _RENT_CAR='rent_car';
  static const String _ORDER = 'order';
  static const String USER_RIDER = 'service_provider';
  static const String _CHAT='chat';

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirestoreDatabaseHelper._internal() {
    _firebaseFirestore.settings = const Settings(persistenceEnabled: false);
  }

  final _timeoutDuration = const Duration(seconds: 15);

  Future<UserModel?> addUser(UserModel user) async {
      await _firebaseFirestore.collection(_USER).doc(user.id).set(user.toJson()).timeout(_timeoutDuration);
      return user.copyWith(id: user.id);
    }

  Future<void> sendMessage(Chat chat) =>
      _firebaseFirestore.collection(_CHAT).add(chat.toJson(FieldValue.serverTimestamp())).timeout(_timeoutDuration);


  Future<UserModelRider?> getRider(String id) async {
    final documentReference = await _firebaseFirestore.collection(USER_RIDER).doc(id).get().timeout(_timeoutDuration);
    if (documentReference.data() == null) return null;
    return UserModelRider.fromJson(documentReference.data()!);
  }
  Future<List<Order>> getOrderRequest(String userId) async {
    final documentReferences = await Future.wait([
      _firebaseFirestore.collection(_ORDER).
      where('user_id', isEqualTo: userId).
      get(const GetOptions(source: Source.server)).timeout(_timeoutDuration),
    ]);

    final order = <String, Order>{};
    for (final querySnapshot in documentReferences) {
      for (final data in querySnapshot.docs) {
        if (order[data.id] != null) continue;
        UserModelRider? userModel = await getRider(data.data()['creator_id']);
        if (userModel != null) {
          final orders = Order.fromJson(data.data(), data.id, userModel);
          order[data.id] = orders;
        } else {
          final orders = Order.fromJson(data.data(), data.id, UserModelRider.fromJson({'id': ''}));
          order[data.id] = orders;
        }
      }
    }
    return order.values.toList();
  }
  Future<UserModel?> getUser(String id) async {
      final documentReference = await _firebaseFirestore.collection(_USER).doc(id).get().timeout(_timeoutDuration);
      if (documentReference.data() == null) return null;
      return UserModel.fromJson(documentReference.data()!);
  }

  Future<Order?> getSingleOrderRequest(String id) async {
    final documentReference = await _firebaseFirestore.collection(_ORDER).doc(id).get().timeout(_timeoutDuration);
    if (documentReference.data() == null) return null;
    return Order.fromJson(documentReference.data()!,id, UserModelRider.fromJson({id:''}));
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
  Future<void> updateOrder(Order order) =>
      _firebaseFirestore.collection(_ORDER).doc(order.id).update(order.toJson()).timeout(_timeoutDuration);
  Future<void> updateUser(UserModel user) =>
      _firebaseFirestore.collection(_USER).doc(user.id).update(user.toJson()).timeout(_timeoutDuration);
}
