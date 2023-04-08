import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({required this.child, this.height = 60});

  final double? height;
  final Widget child;

  @override
  double get minExtent => height!;

  @override
  double get maxExtent => height!;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) =>
      child != oldDelegate.child;
}
