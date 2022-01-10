import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truckdelivery/model/user_model.dart';

class FirestoreDatabaseHelper {
  static final FirestoreDatabaseHelper instance = FirestoreDatabaseHelper._internal();
  static const String _USER = 'user';
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
}
