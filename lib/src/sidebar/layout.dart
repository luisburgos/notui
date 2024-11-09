import 'package:flutter/material.dart';

/// @no-doc
class NotSidebarLayout extends StatelessWidget {
  /// @no-doc
  const NotSidebarLayout({
    required this.bodyBuilder,
    required this.backgroundColor,
    this.headerBuilder,
    this.footerBuilder,
    this.isCollapsed = false,
    this.expandedWidth = 300,
    this.collapsedWidth = 80,
    super.key,
  });

  /// @no-doc
  final bool isCollapsed;

  /// @no-doc
  final double expandedWidth;

  /// @no-doc
  final double collapsedWidth;

  /// @no-doc
  final Color backgroundColor;

  /// @no-doc
  final Widget Function()? headerBuilder;

  /// @no-doc
  final Widget Function() bodyBuilder;

  /// @no-doc
  final Widget Function()? footerBuilder;

  /// @no-doc
  double get width => isCollapsed ? collapsedWidth : expandedWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      child: Column(
        children: [
          if (headerBuilder != null)
            SizedBox(
              child: headerBuilder!.call(),
            ),
          Expanded(
            child: SizedBox(
              child: bodyBuilder.call(),
            ),
          ),
          if (footerBuilder != null)
            SizedBox(
              child: footerBuilder!.call(),
            ),
        ],
      ),
    );
  }
}
