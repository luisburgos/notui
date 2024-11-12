import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/src/sidebar/controller.dart';
import 'package:notui/src/sidebar/layout.dart';
import 'package:notui/src/sidebar/state.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class NotUiSideBar extends StatelessWidget {
  /// @no-doc
  const NotUiSideBar({
    required this.headerBuilder,
    required this.bodyBuilder,
    super.key,
  });

  /// @no-doc
  final Widget Function(
    NotUiSideBarState,
    NotUiSideBarController,
  ) bodyBuilder;

  /// @no-doc
  final Widget Function(
    NotUiSideBarState,
    NotUiSideBarController,
  ) headerBuilder;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NotUiSideBarController>();

    return NotUiSidebarLayout(
      isExpanded: controller.state.isExpanded,
      headerBuilder: () => headerBuilder(controller.state, controller),
      bodyBuilder: () => bodyBuilder(controller.state, controller),
      backgroundColor: ShadTheme.of(context).colorScheme.background,
    );
  }
}
