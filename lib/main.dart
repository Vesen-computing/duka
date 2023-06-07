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
      title: 'Duka',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.login,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryMaterialColor),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: primaryColor),
        appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor,
            foregroundColor: whiteColor,
            centerTitle: true),
        useMaterial3: true,
      ),
    );
  }
}
