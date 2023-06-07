import 'package:flutter/material.dart';

class FeaturedServiceWidget extends StatelessWidget {
  const FeaturedServiceWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          Text(title)
        ],
      ),
    );
  }
}
