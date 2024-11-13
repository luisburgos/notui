import 'package:flutter/material.dart';

/// @no-doc
class NotUiAppShell1 extends StatelessWidget {
  /// @no-doc
  const NotUiAppShell1({
    required this.sideBar,
    required this.body,
    super.key,
  });

  /// @no-doc
  final Widget sideBar;

  /// @no-doc
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        sideBar,
        const VerticalDivider(
          thickness: 1,
          width: 1,
        ),
        Expanded(child: body),
      ],
    );
  }
}
