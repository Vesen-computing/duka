import 'package:flutter/material.dart';

import 'package:duka/constants/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/routes.dart' as route;
import '../../logic/bloc/movies/movies_bloc.dart';
import '../../logic/bloc/movies/movies_event.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/date_transaction.dart';
import '../widgets/featured_service.dart';
import '../widgets/recent_transaction_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  List<String> dateRanges = ['Today', 'This Week', 'This Month', 'Six Months'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
            height: size.height * .30,
            color: primaryColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) {
                            return GestureDetector(
                              onTap: () =>
                                  Scaffold.of(context).openDrawer(),
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.menu_sharp),
                              ),
                            );
                          },
                        ),
                        const CircleAvatar(radius: 30),
                        const Icon(Icons.notifications_outlined,
                            size: 30, color: Colors.white)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Good Morning John!',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Text('Total Balance',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white)),
                    Text(
                      'Ksh 2500',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Featured Services'),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Buy Airtime
                      FeaturedServiceWidget(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            route.payment,
                            arguments: {
                              "page": "Airtime",
                              "title": "Buy airtime"
                            },
                          );
                        },
                        color: greenColor,
                        icon: Icons.phone_android_rounded,
                        title: 'Buy airtime',
                      ),
                      // Movies
                      FeaturedServiceWidget(
                        onTap: () {
                          context.read<MoviesBloc>().add(FetchMovies());
                          Navigator.of(context).pushNamed(
                            route.movies,
                            arguments: {
                              "page": "Movies",
                              "title": "Choose Movies"
                            },
                          );
                        },
                        color: redColor,
                        icon: Icons.theaters_outlined,
                        title: 'Movies',
                      ),
                      // Nairobi Water
                      FeaturedServiceWidget(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            route.payment,
                            arguments: {
                              "page": "Nairobi Water",
                              "title": "Pay Nairobi water"
                            },
                          );
                        },
                        color: lightBlueColor,
                        icon: Icons.water_drop_rounded,
                        title: 'Nairobi water',
                      ),
                      // Pay Tv
                      FeaturedServiceWidget(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            route.payment,
                            arguments: {"page": "Tv", "title": "Pay Tv"},
                          );
                        },
                        color: deepBlueColor,
                        icon: Icons.live_tv_outlined,
                        title: 'Pay Tv',
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Recent transactions'), Text('See All')]),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: dateRanges.map((dateRange) {
                      int index = dateRanges.indexOf(dateRange);
                      bool isSelected = index == selectedIndex;
                      return DateTransaction(
                        title: dateRange,
                        active: isSelected,
                        onTap: () {
                          if (isSelected) return; // Do nothing if already selected
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 15),
                  const RecentTransactionCard(
                      title: 'Airtime',
                      icon: Icons.phone_android_rounded,
                      iconColor: greenColor,
                      amount: '-S423.43',
                      date: '10 oct 21'),
                  const RecentTransactionCard(
                    title: 'Pay Tv',
                    icon: Icons.live_tv,
                    iconColor: deepBlueColor,
                    amount: 'S423.43',
                    date: '10 oct 21',
                  ),
                  const RecentTransactionCard(
                    title: 'Nairobi water',
                    icon: Icons.water_drop,
                    iconColor: lightBlueColor,
                    amount: '-S423.43',
                    date: '10 oct 21',
                  ),
                  const RecentTransactionCard(
                    title: 'Airtime',
                    icon: Icons.phone_android_rounded,
                    iconColor: greenColor,
                    amount: '-S423.43',
                    date: '10 oct 21',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
