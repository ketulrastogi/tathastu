import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tathastu/models/user_model.dart';

class UserService {
  static final Firestore _db = Firestore.instance;
  final CollectionReference _userCollectionRef = _db.collection('users');

  // Future<User> getCurrentUserProfile() async {
  //   _user = _authService.user;
  //   print('User Service : 14 - User Id: ${_user.id}');
  //   DocumentSnapshot doc = await _userCollectionRef.document(_user.id).get();
  //   return User.fromMap(doc.data);
  // }

  Future<void> updatedUserProfile(
      String userId,
      String phoneNumber,
      String displayName,
      String email,
      String gender,
      DateTime birthdate) async {
    User userData = User(
      id: userId,
      phoneNumber: phoneNumber,
      displayName: displayName,
      birthdate: birthdate,
      email: email,
      gender: gender,
    );

    return await _userCollectionRef
        .document(userData.id)
        .setData(userData.toMap(), merge: true);
  }
}
