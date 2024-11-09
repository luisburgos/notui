import 'package:flutter/material.dart';

/// @no-doc
class NotUiSidebarBottomBar extends StatelessWidget {
  /// @no-doc
  const NotUiSidebarBottomBar({
    required this.children,
    required this.backgroundColor,
    super.key,
  });

  /// @no-doc
  final List<Widget> children;

  /// @no-doc
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return NotUiSidebarBottomBarBuilder(
      backgroundColor: backgroundColor,
      builder: () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        );
      },
    );
  }
}

/// @no-doc
class NotUiSidebarBottomBarBuilder extends StatelessWidget {
  /// @no-doc
  const NotUiSidebarBottomBarBuilder({
    required this.builder,
    required this.backgroundColor,
    this.barHeight = 60,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 12,
    ),
    super.key,
  });

  /// @no-doc
  final Color backgroundColor;

  /// @no-doc
  final double barHeight;

  /// @no-doc
  final EdgeInsetsGeometry padding;

  /// @no-doc
  final Widget Function() builder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      constraints: BoxConstraints(
        minWidth: barHeight,
      ),
      padding: padding,
      child: builder.call(),
    );
  }
}
