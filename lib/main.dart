import 'package:duka/logic/bloc/movies/movies_event.dart';
import 'package:duka/repository/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/theme.dart';
import 'constants/routes.dart' as route;
import 'logic/bloc/movies/movies_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MovieRepository(),
      child: BlocProvider(
        create: (context) =>
            MoviesBloc(movieRepository: MovieRepository())..add(FetchMovies()),
        child: MaterialApp(
          title: 'Duka',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: route.controller,
          initialRoute: route.login,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryMaterialColor),
            textTheme:
                const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
            iconTheme: const IconThemeData(color: primaryColor),
            appBarTheme: const AppBarTheme(
                backgroundColor: primaryColor,
                foregroundColor: whiteColor,
                centerTitle: true),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
