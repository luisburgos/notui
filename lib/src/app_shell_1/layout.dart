import 'package:flutter/material.dart';
import 'package:notui/src/shared/not_ui_breakpoints.dart';

/// @no-doc
class NotUiAppShell1Layout extends StatelessWidget {
  /// @no-doc
  const NotUiAppShell1Layout({
    required this.topBar,
    required this.body,
    required this.breakpoints,
    required this.width,
    required this.sideBar,
    this.bottomBar,
    super.key,
  });

  /// @no-doc
  final Widget topBar;

  /// @no-doc
  final Widget body;

  /// @no-doc
  final Widget sideBar;

  /// @no-doc
  final Widget? bottomBar;

  /// @no-doc
  final NotUiBreakpoints breakpoints;

  /// @no-doc
  final double width;

  @override
  Widget build(BuildContext context) {
    var forceMobileDisplay = false;
    if (breakpoints.small != null) {
      forceMobileDisplay = width < breakpoints.small!;
    }

    if (forceMobileDisplay) {
      return Column(
        children: [
          topBar,
          Expanded(
            child: body,
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey.shade300,
          ),
          if (bottomBar != null) bottomBar!,
        ],
      );
    }

    return Row(
      children: [
        sideBar,
        VerticalDivider(
          thickness: 1,
          width: 1,
          color: Colors.grey.shade300,
        ),
        Expanded(
          child: body,
        ),
      ],
    );
  }
}
