import 'package:flutter/material.dart';

import '../widgets/featured_service.dart';
import '../widgets/recent_transaction_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            height: size.height * .30,
            color: Colors.blue,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.menu_sharp)),
                        CircleAvatar(radius: 30),
                        Icon(Icons.notifications_outlined,
                            size: 30, color: Colors.white)
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text('Good Morning John!',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500)),
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
                      FeaturedServiceWidget(
                          onTap: () {},
                          color: Colors.green,
                          icon: Icons.phone_android_rounded,
                          title: 'Buy airtime'),
                      FeaturedServiceWidget(
                          onTap: () {},
                          color: Colors.blue,
                          icon: Icons.live_tv_outlined,
                          title: 'Pay Tv'),
                      FeaturedServiceWidget(
                          onTap: () {},
                          color: Colors.green,
                          icon: Icons.water_drop_rounded,
                          title: 'Nairobi water'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Recent transactions'), Text('See All')]),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.blueAccent)),
                        child: const Text('Today',
                            maxLines: 1, style: TextStyle(color: Colors.white)),
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: const Text('This week', maxLines: 1),
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: const Text('This Month', maxLines: 1),
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: const Text('Six Months', maxLines: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  RecentTransactionCard(
                      title: 'Airtime',
                      icon: Icons.phone_android_rounded,
                      iconColor: Colors.green,
                      backgroundColor: Colors.red.shade50,
                      amount: '-S423.43',
                      date: '10 oct 21'),
                  RecentTransactionCard(
                      title: 'Pay Tv',
                      icon: Icons.live_tv,
                      iconColor: Colors.blue,
                      backgroundColor: Colors.red.shade50,
                      amount: 'S423.43',
                      date: '10 oct 21'),
                  RecentTransactionCard(
                      title: 'Nairobi water',
                      icon: Icons.water_drop,
                      iconColor: Colors.blue,
                      backgroundColor: Colors.red.shade50,
                      amount: '-S423.43',
                      date: '10 oct 21'),
                  RecentTransactionCard(
                      title: 'Airtime',
                      icon: Icons.phone_android_rounded,
                      iconColor: Colors.green,
                      backgroundColor: Colors.red.shade50,
                      amount: '-S423.43',
                      date: '10 oct 21'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
