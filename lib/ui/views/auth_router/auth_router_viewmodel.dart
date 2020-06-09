import 'package:stacked/stacked.dart';
import 'package:tathastu/app/locator.dart';
import 'package:tathastu/services/auth_service.dart';

class AuthRouterViewModel extends StreamViewModel {
  final AuthService _authService = locator<AuthService>();

  @override
  Stream<bool> get stream => _authService.authStateChanged();
}
