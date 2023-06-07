import 'models/seat_status.dart';

const nowPlaying =
    'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1';
const popular =
    'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
const upcoming =
    'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1';
const trending =
    'https://api.themoviedb.org/3/trending/movie/day?language=en-US';
List<Seat> selectedSeats = [];
String selectedTime = '12:00';
Map<String, dynamic> selectedDay = {
  'day': 'Mon',
  'dayNum': DateTime.now().day,
  'hours': DateTime.now().hour
};
