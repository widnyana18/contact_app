import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 70;

  @override
  double get maxExtent => 70;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) =>
      child != oldDelegate.child;
}
