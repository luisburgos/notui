import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    required this.bodyBuilder,
    this.backgroundColor = Colors.black,
    this.barHeight = 60,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 12,
    ),
    super.key,
  });

  final Color backgroundColor;
  final double barHeight;
  final EdgeInsetsGeometry padding;
  final Widget Function() bodyBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      constraints: BoxConstraints(
        minWidth: barHeight,
      ),
      padding: padding,
      child: bodyBuilder.call(),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.bodyBuilder,
    this.backgroundColor = Colors.black,
    this.barHeight = 60,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 12,
    ),
    super.key,
  });

  final Color backgroundColor;
  final double barHeight;
  final EdgeInsetsGeometry padding;
  final Widget Function() bodyBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      constraints: BoxConstraints(
        minWidth: barHeight,
      ),
      padding: padding,
      child: bodyBuilder.call(),
    );
  }
}
