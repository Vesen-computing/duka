abstract class MoviesEvent {
  const MoviesEvent();
}

class FetchMovies extends MoviesEvent {}

class FetchSpecificMovies extends MoviesEvent {
  final String url;

  FetchSpecificMovies({required this.url});
}
