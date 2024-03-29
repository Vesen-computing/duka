import 'package:flutter/material.dart';
import 'package:duka/presentations/screens/payment_screen.dart';

import '../presentations/screens/auth/sign_up_screen.dart';
import '../presentations/screens/dashboard.dart';
import '../presentations/screens/auth/login_screen.dart';
import '../presentations/screens/movie/movie_details_screen.dart';
import '../presentations/screens/movie/movies_screen.dart';
import '../presentations/screens/movie/seats_screen.dart';

const String login = 'login';
const String dashboard = 'dashboard';
const String payment = 'payment';
const String signUp = 'sign_up';
const String movies = 'movies';
const String movieDetails = 'movie_details';
const String seatsScreen = 'seats_screen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case login:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case dashboard:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    case payment:
      return MaterialPageRoute(
        builder: (context) => PaymentScreen(
          arguments: settings.arguments as Map<String, dynamic>,
        ),
      );

    case movies:
      return MaterialPageRoute(
        builder: (context) => const MovieScreen(),
      );
    case movieDetails:
      return MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(
          arguments: settings.arguments as Map<String, dynamic>,
        ),
      );
    case signUp:
      return MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      );
    case seatsScreen:
      return MaterialPageRoute(
        builder: (context) => const SeatsScreen(),
      );
    default:
      throw ('Unimplemented route');
  }
}
