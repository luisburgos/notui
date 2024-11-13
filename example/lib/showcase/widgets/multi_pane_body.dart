import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class MyMultiPaneBody extends StatelessWidget {
  /// @no-doc
  const MyMultiPaneBody({
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
    return Center(
      child: ShadCard(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxHeight: 400,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Example Controls',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const Text('SIDEBAR'),
              const SizedBox(height: 10),
              ShadSwitch(
                label: const Text('isSidebarOpen'),
                value: isSidebarOpen,
                onChanged: toggleSidebar,
              ),
              const SizedBox(height: 24),
              const Text('MULTI-PANE'),
              const SizedBox(height: 10),
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
