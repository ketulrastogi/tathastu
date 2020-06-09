import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tathastu/app/locator.dart';
import 'package:tathastu/app/router.gr.dart';
import 'package:tathastu/models/user_model.dart';
import 'package:tathastu/services/auth_service.dart';
import 'package:tathastu/shared/const.dart';

class VerifyPhoneViewModel extends ReactiveViewModel {
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  String _countryCode = '+91';
  String _phoneNumber = null;
  String _errorMessage = null;
  bool _formValid = false;
  User _user;

  String get phoneNumberE123 => '$_countryCode$_phoneNumber';
  String get errorMessage => _errorMessage;
  bool get formValid => _formValid;
  User get user => _user;

  setCountryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  setErrorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  setFormValid(bool value) {
    _formValid = value;
    notifyListeners();
  }

  validatePhoneNumber() {
    if (_phoneNumber != null) {
      // Phone number is not null
      if (_phoneNumber.length < 10) {
        setFormValid(false);
        setErrorMessage(null);
      } else {
        setFormValid(true);
        setErrorMessage(null);
      }
    } else {
      // Phone number is null
      setFormValid(false);
      setErrorMessage(null);
    }
  }

  verifyNumber() async {
    setBusy(true);
    print('VerifyPhone_ViewModel');
    await _authService.verifyPhoneNumber(phoneNumberE123);
    // notifyListeners();

    Future.delayed(Duration(seconds: 3), () {
      setBusy(false);
      AuthStatus _authStatus = _authService.authStatus;
      LoginStatus _loginStatus = _authService.loginStatus;
      print('AuthStatus: $_authStatus, LoginStatus: $_loginStatus');
      if (_authStatus == AuthStatus.AUTHENTICATED) {
        _navigationService.navigateTo(Routes.homeView);
      } else {
        if (_loginStatus == LoginStatus.SMS_CODE_SENT) {
          _navigationService.navigateTo(Routes.verifySmsCodeView);
        } else if (_loginStatus == LoginStatus.PHONE_VERIFICATION_FAILED) {
          _snackbarService.showCustomSnackBar(
            title: 'ERROR',
            message: _authService.errorMessage,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
            margin: EdgeInsets.all(8.0),
            borderRadius: 8.0,
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
          );
        }
      }
    });
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_authService];
}
