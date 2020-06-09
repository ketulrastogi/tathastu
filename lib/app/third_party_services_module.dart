import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tathastu/services/auth_service.dart';
import 'package:tathastu/services/user_service.dart';

@registerModule
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackBarService;
  @lazySingleton
  AuthService get authService;
  @lazySingleton
  UserService get userService;
}
