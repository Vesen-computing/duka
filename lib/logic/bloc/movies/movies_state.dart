import 'package:flutter/material.dart';

import '../../../constants/models/movie.dart';

@immutable
abstract class MoviesState {
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesError extends MoviesState {
  final String message;
  MoviesError({required this.message});

  @override
  List<Object> get props => [message];
}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final Map<String, List<Movie>> movies;
  MoviesLoaded({required this.movies});
  @override
  List<Object> get props => [movies];
}
