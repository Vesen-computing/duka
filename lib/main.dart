import 'package:flutter/material.dart';

import 'constants/theme.dart';
import 'constants/routes.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Savey',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.controller,
      initialRoute: route.login,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: colors['primary'] as Color),
        useMaterial3: true,
      ),
    );
  }
}
