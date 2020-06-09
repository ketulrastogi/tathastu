import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tathastu/ui/views/auth_router/auth_router_viewmodel.dart';
import 'package:tathastu/ui/views/home/home_view.dart';
import 'package:tathastu/ui/views/login/verifyphone/verifyphone_view.dart';

class AuthRouterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthRouterViewModel>.reactive(
      builder: (context, model, child) {
        return StreamBuilder(
          stream: model.stream,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data) {
                return HomeView();
              } else {
                return VerifyPhoneView();
              }
            } else {
              return Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
          },
        );
      },
      viewModelBuilder: () => AuthRouterViewModel(),
    );
  }
}
