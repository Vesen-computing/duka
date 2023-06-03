import 'package:flutter/material.dart';

import 'constants/theme.dart';
import 'constants/routes.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savey',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.login,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryMaterialColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.black,
          ), // Customize the default text color here
          // You can customize other text styles like headline1, subtitle1, etc.
        ),
        iconTheme: const IconThemeData(
            color: primaryColor), // Customize the default icon color here
        useMaterial3: true,
      ),
    );
  }
}
