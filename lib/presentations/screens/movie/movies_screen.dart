import 'package:duka/presentations/screens/movie/widgets/custom_sliverDelgate.dart';
import 'package:duka/presentations/screens/movie/widgets/movie_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
import '../../../logic/bloc/movies/movies_bloc.dart';
import '../../../logic/bloc/movies/movies_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                  title: 'Choose Movies', expandedHeight: screenHeight * 0.25)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Text(
                  'Now Playing',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                buildMovieList(nowPlaying),
                const Text('Coming Soon',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                buildMovieList(upcoming),
                const Text(
                  'Top Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                buildMovieList(trending),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMovieList(String url) {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (state is MoviesLoading) {
          return const CupertinoActivityIndicator(radius: 30);
        } else if (state is MoviesError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is MoviesLoaded) {
          final movies =
              state.movies[url]; // Get movies based on the provided URL
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return MovieCard(movie: movies![index]);
              });
        } else {
          return const Text('Something happened');
        }
      }),
    );
  }
}
