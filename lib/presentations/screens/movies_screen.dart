import 'package:duka/logic/bloc/movies/movies_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../logic/bloc/movies/movies_bloc.dart';
import '../../logic/bloc/movies/movies_state.dart';
import '../widgets/custom_sliverDelgate.dart';

class MovieScreen extends StatelessWidget {
  final Map<String, dynamic> arguments;
  const MovieScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(FetchMovies());
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
                return buildMovieCard(movies![index].backdropPath);
              });
        } else {
          return const Text('Something happened');
        }
      }),
    );
  }

  Widget buildMovieCard(String imageUrl) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fitHeight,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Stack(
              children: [
                child,
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(); // Show an empty container if the image fails to load
          },
        ),
      ),
    );
  }
}
