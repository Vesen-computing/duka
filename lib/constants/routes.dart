import 'package:flutter/material.dart';
import 'package:savey/presentations/screens/payment_screen.dart';

import '../presentations/screens/dashboard.dart';
import '../presentations/screens/auth/login_screen.dart';

const String login = 'login';
const String dashboard = 'dashboard';
const String payment = 'payment';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case dashboard:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    case payment:
      return MaterialPageRoute(
          builder: (context) => const PaymentScreen(
                page: 'tv',
                title: 'Pay Tv',
              ));
    default:
      throw ('Unimplemented route');
  }
}
