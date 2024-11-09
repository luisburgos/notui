import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notui/src/sidebar/layout.dart';
import 'package:notui/src/sidebar/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class NotUiSideBarController {
  /// @no-doc
  const NotUiSideBarController({
    required this.toggleOpen,
    required this.setExpanded,
  });

  /// @no-doc
  final void Function() toggleOpen;

  /// @no-doc
  /// ignore: avoid_positional_boolean_parameters
  final void Function(bool) setExpanded;
}

/// @no-doc
class NotUiSideBar extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch<NotUiSideBarState>(notUiSideBarNotifierProvider);
    final controller = NotUiSideBarController(
      toggleOpen: () {
        ref.read(notUiSideBarNotifierProvider.notifier).toggle();
      },
      setExpanded: (isExpanded) {
        ref
            .read(notUiSideBarNotifierProvider.notifier)
            .setExpanded(isExpanded: isExpanded);
      },
    );

    return NotUiSidebarLayout(
      isExpanded: state.isExpanded,
      headerBuilder: () => headerBuilder(state, controller),
      bodyBuilder: () => bodyBuilder(state, controller),
      backgroundColor: ShadTheme.of(context).colorScheme.background,
    );
  }
}
