import 'package:auto_route/auto_route_annotations.dart';
import 'package:tathastu/ui/views/auth_router/auth_router_view.dart';
import 'package:tathastu/ui/views/home/home_view.dart';
import 'package:tathastu/ui/views/login/verifyphone/verifyphone_view.dart';
import 'package:tathastu/ui/views/login/verifysmscode/verifysmscode_view.dart';
import 'package:tathastu/ui/views/user_registration/user_registration_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  AuthRouterView authRouterView;

  VerifyPhoneView verifyPhoneView;

  VerifySmsCodeView verifySmsCodeView;

  HomeView homeView;

  UserRegistrationView userRegistrationView;
}
