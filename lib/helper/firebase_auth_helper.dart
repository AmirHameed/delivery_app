import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper._internal();

  static const WEAK_PASSWORD = 'weak-password';
  static const EMAIL_ALREADY_IN_USE = 'email-already-in-use';
  static const INVALID_EMAIL = 'invalid-email';
  static const USER_NOT_FOUND = 'user-not-found';
  static const WRONG_PASSWORD = 'wrong-password';

  FirebaseAuthHelper._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
  String _otpCode='';

  Future<String> verifyPhoneNumber(String phone) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+92$phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.currentUser?.updatePhoneNumber(credential);
      },
      timeout: Duration(seconds: 60),
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
          _otpCode = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
          _otpCode = verificationId;
      },
    );
    return _otpCode;
  }

  Future<UserCredential> createAccountWithEmail(String email, {String password = '123456789'}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  String? getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case USER_NOT_FOUND:
        return 'No user found with this email';
      case WRONG_PASSWORD:
        return 'Invalid password';
      case INVALID_EMAIL:
        return 'Invalid email';
      case WEAK_PASSWORD:
        return 'Password must be greater than 8 characters';
      case EMAIL_ALREADY_IN_USE:
        return 'Email is already used by another user';
      default:
        return null;
    }
  }

  String? getDatabaseErrorMessage(FirebaseException e) {
    return e.message;
  }

  Future<void> signout() async => _firebaseAuth.signOut();

  Future<void> resetPassword(String email) => _firebaseAuth.sendPasswordResetEmail(email: email);
}
