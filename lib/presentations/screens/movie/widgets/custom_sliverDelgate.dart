// ignore_for_file: file_names

import 'package:duka/constants/theme.dart';
import 'package:flutter/material.dart';

import 'custom_search_bar.dart';

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final String title;

  CustomSliverDelegate(
      {required this.title,
      required this.expandedHeight,
      this.hideTitleWhenExpanded = true});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = screenHeight * 0.20;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 7,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              elevation: 0,
              backgroundColor: primaryColor,
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              flexibleSpace: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //!The Search bar widget
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 * percent),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20.0,
                  child: const CustomSearchBar(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
