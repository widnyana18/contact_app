import 'package:flutter/material.dart';

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverHeaderDelegate({
    required this.tightedChild,
    this.minHeight = 60,
    this.maxHeight,
    this.expandedChild,
  });

  final double minHeight;
  final double? maxHeight;
  final Widget tightedChild;
  final Widget? expandedChild;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight ?? minHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: AnimatedCrossFade(
          duration: Duration(seconds: 1),
          crossFadeState: shrinkOffset >= maxExtent * .5
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: expandedChild!,
          secondChild: tightedChild,
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) =>
      tightedChild != oldDelegate.tightedChild;
}
