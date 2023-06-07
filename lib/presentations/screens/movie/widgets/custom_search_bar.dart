import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      height: 55,
      child: TextField(
        onSubmitted: (value) {},
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          enabledBorder: null,
          focusedBorder: null,
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: Colors.black54,
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          hintText: 'Search',
        ),
      ),
    );
  }
}
