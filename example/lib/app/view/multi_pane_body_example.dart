import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class MultiPaneBodyExample extends StatelessWidget {
  /// @no-doc
  const MultiPaneBodyExample({
    required this.isLeftPaneOpen,
    required this.isRightPaneOpen,
    required this.isSidebarOpen,
    required this.setLeftOpen,
    required this.setRightOpen,
    required this.toggleSidebar,
    super.key,
  });

  /// @no-doc
  final bool isLeftPaneOpen;

  /// @no-doc
  final bool isRightPaneOpen;

  /// @no-doc
  final bool isSidebarOpen;

  /// @no-doc
  /// ignore: avoid_positional_boolean_parameters
  final void Function(bool) setLeftOpen;

  /// @no-doc
  /// ignore: avoid_positional_boolean_parameters
  final void Function(bool) setRightOpen;

  /// @no-doc
  /// ignore: avoid_positional_boolean_parameters
  final void Function(bool) toggleSidebar;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: ShadCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShadSwitch(
                label: const Text('isSidebarOpen'),
                value: isSidebarOpen,
                onChanged: toggleSidebar,
              ),
              ShadSwitch(
                label: const Text('isLeftPaneOpen'),
                value: isLeftPaneOpen,
                onChanged: setLeftOpen,
              ),
              ShadSwitch(
                label: const Text('isRightPaneOpen'),
                value: isRightPaneOpen,
                onChanged: setRightOpen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
