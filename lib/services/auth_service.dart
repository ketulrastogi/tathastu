import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:observable_ish/value/value.dart';
import 'package:stacked/stacked.dart';
import 'package:tathastu/shared/const.dart';

class AuthService with ReactiveServiceMixin {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult _authResult;
  RxValue<FirebaseUser> _firebaseUser = RxValue<FirebaseUser>(initial: null);
  RxValue<String> _verificationId = RxValue<String>(initial: null);
  RxValue<String> _errorCode = RxValue<String>(initial: null);
  RxValue<String> _errorMessage = RxValue<String>(initial: null);
  RxValue<LoginStatus> _loginStatus = RxValue<LoginStatus>(initial: null);
  RxValue<AuthStatus> _authStatus =
      RxValue<AuthStatus>(initial: AuthStatus.UNAUTHENTICATED);

  FirebaseUser get firebaseUser => _firebaseUser.value;
  String get verificationId => _verificationId.value;
  String get errorCode => _errorCode.value;
  String get errorMessage => _errorMessage.value;
  LoginStatus get loginStatus => _loginStatus.value;
  AuthStatus get authStatus => _authStatus.value;

  AuthService() {
    listenToReactiveValues([
      _authStatus,
      _loginStatus,
      _errorCode,
      _errorMessage,
      _verificationId
    ]);
  }

  Future<void> getCurrentUser() async {
    _firebaseUser.value = await _auth.currentUser();
  }

  Stream<bool> authStateChanged() {
    return _auth.onAuthStateChanged.map((firebaseUser) {
      if (firebaseUser != null) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) async {
      _authResult = await _auth.signInWithCredential(phoneAuthCredential);
      _firebaseUser.value = _authResult.user;
      _authStatus.value = AuthStatus.AUTHENTICATED;
      print('Logged In User : ${_firebaseUser.value.phoneNumber}');
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      print(authException.message);
      _authStatus.value = AuthStatus.UNAUTHENTICATED;
      _loginStatus.value = LoginStatus.PHONE_VERIFICATION_FAILED;
      _errorMessage.value = authException.message;
      _errorCode.value = authException.code;
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId.value = verificationId;
      print('SMS Code sent and VerificationId : $verificationId');
      _loginStatus.value = LoginStatus.SMS_CODE_SENT;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {};

    return await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  Future<void> signInWithPhoneNumber(String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      _authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = _authResult.user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      _firebaseUser.value = _authResult.user;
      _authStatus.value = AuthStatus.AUTHENTICATED;
    } on PlatformException catch (e) {
      _errorCode.value = e.code;
      _errorMessage.value = e.message;
      _loginStatus.value = LoginStatus.SMS_CODE_VERIFICATION_FAILED;
      _authStatus.value = AuthStatus.UNAUTHENTICATED;
    }
  }
}
