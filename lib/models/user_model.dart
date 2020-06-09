import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String displayName;
  final String phoneNumber;
  final String email;
  final String gender;
  final DateTime birthdate;
  final DateTime createdOn;
  final DateTime updatedOn;
  final bool disabled;

  User({
    this.id,
    this.displayName,
    this.phoneNumber,
    this.email,
    this.gender,
    this.birthdate,
    this.createdOn,
    this.updatedOn,
    this.disabled = false,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      displayName:
          (data.containsKey('displayName')) ? data['displayName'] : null,
      phoneNumber:
          (data.containsKey('phoneNumber')) ? data['phoneNumber'] : null,
      email: (data.containsKey('email')) ? data['email'] : null,
      gender: (data.containsKey('gender')) ? data['gender'] : null,
      birthdate: (data.containsKey('birthdate'))
          ? DateTime.parse(
              ((data['birthdate'] as Timestamp).toDate().toString()))
          : null,
      createdOn: (data.containsKey('createdOn'))
          ? DateTime.parse(
              ((data['createdOn'] as Timestamp).toDate().toString()))
          : null,
      updatedOn: (data.containsKey('updatedOn'))
          ? DateTime.parse(
              ((data['updatedOn'] as Timestamp).toDate().toString()))
          : null,
      disabled: (data.containsKey('disabled')) ? data['disabled'] : false,
    );
  }

  toMap() {
    Map<String, dynamic> data = {};
    if (displayName != null) {
      data = {
        ...data,
        'displayName': displayName,
      };
    }
    if (email != null) {
      data = {
        ...data,
        'email': email,
      };
    }

    if (birthdate != null) {
      data = {
        ...data,
        'birthdate': Timestamp.fromDate(birthdate),
      };
    }

    if (gender != null) {
      data = {
        ...data,
        'gender': gender,
      };
    }

    return {
      'id': id,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'email': email,
      'birthdate': birthdate,
      'gender': gender,
      // 'createdOn': createdOn,
      // 'updatedOn': updatedOn,
      // 'disabled': disabled,
    };
  }
}
