import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/src/multi_pane/controller.dart';
import 'package:notui/src/multi_pane/layout.dart';
import 'package:notui/src/multi_pane/state.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class NotUiMultiPane extends StatelessWidget {
  /// @no-doc
  const NotUiMultiPane({
    super.key,
    this.headerBuilder,
    this.bodyBuilder,
  });

  /// @no-doc
  final Widget Function(
    NotUiMultiPaneState,
    NotUiMultiPaneController,
  )? headerBuilder;

  /// @no-doc
  final Widget Function(
    NotUiMultiPaneState,
    NotUiMultiPaneController,
  )? bodyBuilder;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NotUiMultiPaneController>();

    return NotUiMultiPaneLayout(
      isLeftPaneOpen: controller.state.isLeftPaneOpen,
      isRightPaneOpen: controller.state.isRightPaneOpen,
      borderColor: ShadTheme.of(context).colorScheme.border,
      header: headerBuilder?.call(controller.state, controller),
      body: bodyBuilder?.call(controller.state, controller),
    );
  }
}
