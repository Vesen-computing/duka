import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:duka/constants/theme.dart';
import 'package:duka/presentations/screens/movie/widgets/calender.dart';
import '../../../constants/constants.dart';
import '../../../constants/routes.dart' as route;

import '../../../constants/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> arguments;
  const MovieDetailsScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = arguments["movie"];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .5,
              width: size.width,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: movie.backdropPath,
                    height: size.height * .5,
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                    child: Container(
                      height: size.height,
                      padding: const EdgeInsets.only(top: 14, left: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: IconButton.styleFrom(
                                    backgroundColor:
                                        primaryColor.withOpacity(.4)),
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          MovieTitleSection(movie: movie),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.black,
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xff4e4e4e),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Read more',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Calender(),
                  const ShowtimesSection(),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(route.seatsScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: const Color(0xffe82251),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Proceed',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieTitleSection extends StatelessWidget {
  final Movie movie;

  const MovieTitleSection({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor.withOpacity(.3),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            movie.originalTitle,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${movie.genreIds[0]}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 15,
                width: 3,
                color: whiteColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                movie.originalLanguage,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                height: 15,
                width: 3,
                color: whiteColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                movie.releaseDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const Text(
            'Summary',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class ShowtimesSection extends StatefulWidget {
  const ShowtimesSection({super.key});

  @override
  _ShowtimesSectionState createState() => _ShowtimesSectionState();
}

class _ShowtimesSectionState extends State<ShowtimesSection> {
  List<bool> isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: const EdgeInsets.only(left: 24),
        semanticChildCount: 5,
        scrollDirection: Axis.horizontal,
        children: [
          ...[
            "12:00",
            "14:00",
            "17:30",
            "19:00",
            "19:00",
          ].asMap().entries.map(
            (entry) {
              final index = entry.key;
              final time = entry.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = List<bool>.generate(
                      isSelected.length,
                      (i) => i == index,
                    );
                    selectedTime = time;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: isSelected[index]
                        ? const Color(0xffe82251)
                        : const Color(0xff4f4e4e),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    time,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
