import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MovieScreen extends StatelessWidget {
  final Map<String, dynamic> arguments;
  const MovieScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Perform filter action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Movies',
              ),
              onChanged: (value) {
                // Perform search action
              },
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Now Playing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            buildMovieList(),
            const SizedBox(height: 16.0),
            const Text(
              'Coming Soon',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            buildMovieList(),
            const SizedBox(height: 16.0),
            const Text(
              'Top Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            buildMovieList(),
          ],
        ),
      ),
    );
  }

  Widget buildMovieList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildMovieCard('https://picsum.photos/piscum/seed/1/200/200'),
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
    return Slidable(
      child: Container(
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
      ),
    );
  }
}
