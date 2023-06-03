import 'package:flutter/material.dart';

class RecentTransactionCard extends StatelessWidget {
  const RecentTransactionCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
    required this.iconColor,
  });

  final String title, amount, date;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              radius: 25,
              backgroundColor: Colors.red.shade50.withOpacity(.5),
              child: Icon(icon, color: iconColor)),
          const SizedBox(width: 10),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), const Text('**4427')]),
          const Spacer(),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(amount), Text(date)])
        ],
      ),
    );
  }
}
