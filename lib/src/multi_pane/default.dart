import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notui/src/multi_pane/layout.dart';
import 'package:notui/src/multi_pane/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class NotUiMultiPaneController {
  /// @no-doc
  const NotUiMultiPaneController({
    required this.setLeftOpen,
    required this.setRightOpen,
  });

  /// @no-doc
  /// ignore: avoid_positional_boolean_parameters
  final void Function(bool) setLeftOpen;

  /// @no-doc
  /// ignore: avoid_positional_boolean_parameters
  final void Function(bool) setRightOpen;
}

/// @no-doc
class NotUiMultiPane extends ConsumerWidget {
  /// @no-doc
  const NotUiMultiPane({
    super.key,
    this.headerBuilder,
  });

  /// @no-doc
  final Widget Function(
    NotUiMultiPaneState,
    NotUiMultiPaneController,
  )? headerBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch<NotUiMultiPaneState>(
      notUiMultiPaneNotifierProvider,
    );
    final controller = NotUiMultiPaneController(
      setLeftOpen: (isOpen) {
        ref.read(notUiMultiPaneNotifierProvider.notifier).setLeftOpen(
              isOpen: isOpen,
            );
      },
      setRightOpen: (isOpen) {
        ref.read(notUiMultiPaneNotifierProvider.notifier).setRightOpen(
              isOpen: isOpen,
            );
      },
    );

    return NotUiMultiPaneLayout(
      isLeftPaneOpen: state.isLeftPaneOpen,
      isRightPaneOpen: state.isRightPaneOpen,
      borderColor: ShadTheme.of(context).colorScheme.border,
      header: headerBuilder?.call(state, controller),
    );
  }
}
