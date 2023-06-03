import 'package:flutter/material.dart';

import '../presentations/screens/dashboard.dart';
import '../presentations/screens/auth/login_screen.dart';

const String login = 'login';
const String dashboard = 'dashboard';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case dashboard:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    default:
      throw ('Unimplemented route');
  }
}
