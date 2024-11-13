import 'package:flutter/material.dart';

/// @no-doc
class NotUiSideBar extends StatelessWidget {
  /// @no-doc
  const NotUiSideBar({
    required this.bodyBuilder,
    required this.backgroundColor,
    this.headerBuilder,
    this.footerBuilder,
    this.isExpanded = true,
    this.expandedWidth = 180,
    this.collapsedWidth = 80,
    super.key,
  });

  /// @no-doc
  final bool isExpanded;

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
  double get width => isExpanded ? expandedWidth : collapsedWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: width,
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
