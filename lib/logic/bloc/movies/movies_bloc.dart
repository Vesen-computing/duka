import 'package:duka/constants/constants.dart';
import 'package:duka/repository/movie_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/models/movie.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MovieRepository movieRepository;
  MoviesBloc({required this.movieRepository}) : super(MoviesInitial()) {
    on<FetchMovies>(fetchMovies);
  }

  void fetchMovies(FetchMovies event, Emitter emit) async {
    emit(MoviesLoading());
    try {
//       const nowPlaying ;
// const popular;
// const upcoming ;
// const trending ;
      final List<Movie> nowPlayingMovies =
          await movieRepository.fetchMovies(url: nowPlaying);
      final List<Movie> upcomingMovies =
          await movieRepository.fetchMovies(url: upcoming);
      final List<Movie> trendingMovies =
          await movieRepository.fetchMovies(url: trending);
      emit(MoviesLoaded(movies: {
        nowPlaying: nowPlayingMovies,
        upcoming: upcomingMovies,
        trending: trendingMovies
      }));
    } catch (error) {
      // Handle error
      emit(MoviesError(message: error.toString()));
      debugPrint('Error fetching movies: $error');
    }
  }
}
