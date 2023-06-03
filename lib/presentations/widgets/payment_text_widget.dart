import 'package:flutter/material.dart';

class PaymentTextWidget extends StatelessWidget {
  final String hintText;
  const PaymentTextWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 16,
        ),
      ),
    );
  }
}
