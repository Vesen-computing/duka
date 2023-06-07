import 'package:duka/presentations/screens/movie/widgets/calender.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_sliverDelgate.dart';

class MovieScreen extends StatelessWidget {
  final Map<String, dynamic> arguments;
  const MovieScreen({Key? key, required this.arguments}) : super(key: key);

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
                buildMovieList(),
                const Text('Coming Soon',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                buildMovieList(),
                const Text(
                  'Top Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                buildMovieList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMovieList() {
    return Container(
      height: 160,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ListView(
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          buildMovieCard('https://picsum.photos/200/200'),
          buildMovieCard('https://picsum.photos/200/200'),
          buildMovieCard('https://picsum.photos/200/200'),
          buildMovieCard('https://picsum.photos/200/200'),
          buildMovieCard('https://picsum.photos/200/200'),
          buildMovieCard('https://picsum.photos/200/200'),
          // Add more movie cards as needed
        ],
      ),
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
          fit: BoxFit.cover,
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
