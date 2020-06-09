import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tathastu/app/locator.dart';
import 'package:tathastu/app/router.gr.dart';
import 'package:tathastu/models/user_model.dart';
import 'package:tathastu/services/auth_service.dart';
import 'package:tathastu/services/user_service.dart';
import 'package:get/src/snackbar/snack.dart';

class UserRegistrationViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();
  String _displayName;
  String _email;
  DateTime _birthdate;
  String _gender;
  bool _formValid = false;
  String _errorMessage;
  String _displayNameError;
  String _emailError;
  String _birthdateError;
  String _genderError;
  final List<String> _genderList = [
    'Male',
    'Female',
    'Other',
  ];
  int _selectedGenderIndex = -1;
  User _user;

  String get displayName => _displayName;
  String get email => _email;
  DateTime get birthdate => _birthdate;
  String get gender => _gender;
  bool get formValid => _formValid;
  String get errorMessage => _errorMessage;
  String get displayNameError => _displayNameError;
  String get emailError => _emailError;
  String get birthdateError => _birthdateError;
  String get genderError => _genderError;
  int get selectedGenderIndex => _selectedGenderIndex;

  setDisplayName(String value) {
    _displayName = value;
    notifyListeners();
  }

  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  setBirthdate(String value) {
    _birthdate = DateTime.parse(value);
    notifyListeners();
  }

  setGender(int value) {
    _selectedGenderIndex = value;
    _gender = _genderList[value];
    notifyListeners();
  }

  setFormValid() {
    // print('DisplayName: $displayName');
    // print('DisplayNameError: $displayNameError');
    // print('BirthDate: $birthdate');
    // print('BirthDateError: $birthdateError');
    // print('Email: $email');
    // print('EmailError: $emailError');
    // print('Gender: $gender');
    // print('GenderError: $genderError');
    // print('FormValid: $formValid');
    if (displayName != null &&
        birthdate != null &&
        email != null &&
        gender != null) {
      _formValid = true;
    } else {
      _formValid = false;
    }
    notifyListeners();
  }

  setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  setDisplayNameError(String value) {
    _displayNameError = value;
    notifyListeners();
  }

  setEmailError(String value) {
    _emailError = value;
    notifyListeners();
  }

  setBirthdateError(String value) {
    _birthdateError = value;
    notifyListeners();
  }

  setGenderError(String value) {
    _genderError = value;
    notifyListeners();
  }

  validateDisplayName() {
    if (_displayName.isEmpty) {
      setDisplayNameError('Display name can not be empty');
    } else {
      setDisplayNameError(null);
    }
    setFormValid();
  }

  validateEmail() {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (_email.isEmpty) {
      setEmailError('Email address can not be empty');
    } else if (!emailValid) {
      setEmailError('Email address is not valid');
    } else {
      setEmailError(null);
    }
    setFormValid();
  }

  validateBirthdate() {
    if (_birthdate == null) {
      setBirthdateError('Birthdate can not be empty');
    } else {
      setBirthdateError(null);
    }
    setFormValid();
  }

  validateGender() {
    if (_gender.isEmpty || _gender == null) {
      setGenderError('Please select your gender');
    } else {
      setGenderError(null);
    }
    setFormValid();
  }

  createUserProfile() async {
    try {
      await _authService.getCurrentUser();
      String userId = _authService.firebaseUser.uid;
      String phoneNumber = _authService.firebaseUser.phoneNumber;
      await _userService.updatedUserProfile(
          userId, phoneNumber, displayName, email, gender, birthdate);
      notifyListeners();
      _navigationService.navigateTo(Routes.homeView);
    } catch (e) {
      _snackbarService.showCustomSnackBar(
        title: 'Profile Updation Error',
        message: '${e.toString()}',
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(8.0),
        borderRadius: 8.0,
      );
    }
  }
}
