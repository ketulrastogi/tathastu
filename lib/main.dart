import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tathastu/app/locator.dart';
import 'package:tathastu/app/router.gr.dart';
import 'package:tathastu/ui/views/auth_router/auth_router_view.dart';
import 'package:tathastu/ui/views/home/home_view.dart';
import 'package:tathastu/ui/views/login/verifyphone/verifyphone_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: AuthRouterView(),
      initialRoute: Routes.authRouterView,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
