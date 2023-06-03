import 'package:flutter/material.dart';

import '../../constants/theme.dart';

class DateTransaction extends StatelessWidget {
  const DateTransaction({super.key, required this.title, this.active = false});
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      alignment: Alignment.center,
      decoration: active
          ? BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: primaryColor),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
            ),
      child: Text(
        title,
        maxLines: 1,
        style: TextStyle(
          color: active ? whiteColor : Colors.black,
        ),
      ),
    );
  }
}
