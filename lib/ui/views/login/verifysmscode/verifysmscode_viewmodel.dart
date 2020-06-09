import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tathastu/app/locator.dart';
import 'package:tathastu/app/router.gr.dart';
import 'package:tathastu/models/user_model.dart';
import 'package:tathastu/services/auth_service.dart';
import 'package:tathastu/services/user_service.dart';

class VerifySmsCodeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  String _smsCode = null;
  String _errorMessage = null;
  User _user;

  String get smsCode => _smsCode;
  String get errorMessage => _errorMessage;
  bool get formValid => _formValid;
  bool _formValid = false;

  setSmsCode(String value) {
    _smsCode = value;
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

  validateSmsCode() {
    if (_smsCode != null) {
      // SMS Code is not null
      if (_smsCode.isEmpty) {
        setFormValid(false);
        setErrorMessage('SMS code can not be empty');
      } else if (_smsCode.length < 10) {
        setFormValid(false);
        setErrorMessage(null);
      } else {
        setFormValid(true);
        setErrorMessage(null);
      }
    } else {
      // SMS Code is null
      setFormValid(false);
      setErrorMessage(null);
    }
  }

  verifySMSCode() async {
    print('VerifySMSCode_ViewModel');
    setBusy(true);
    await _authService.signInWithPhoneNumber(smsCode);
    notifyListeners();
    setBusy(false);
  }
}
