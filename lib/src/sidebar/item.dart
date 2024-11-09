import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notui/src/sidebar/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class NotUiSideBarMenuItemData {
  /// @no-doc
  const NotUiSideBarMenuItemData({
    required this.id,
    required this.label,
    required this.iconData,
  });

  /// @no-doc
  final String id;

  /// @no-doc
  final String label;

  /// @no-doc
  final IconData iconData;
}

/// @no-doc
class NotUiSideBarMenuItem extends ConsumerWidget {
  /// @no-doc
  const NotUiSideBarMenuItem({
    required this.data,
    required this.onPressed,
    super.key,
  });

  /// @no-doc
  final NotUiSideBarMenuItemData data;

  /// @no-doc
  final void Function(NotUiSideBarMenuItemData) onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notUiSideBarNotifierProvider);

    final icon = Icon(
      data.iconData,
      size: state.configs.iconSize,
    );

    if (state.isExpanded) {
      return ShadButton.outline(
        width: double.infinity,
        onPressed: () => onPressed(data),
        icon: icon,
        decoration: const ShadDecoration(
          border: ShadBorder.none,
        ),
        child: Expanded(
          child: Row(
            children: [
              Text(data.label),
              const Spacer(),
            ],
          ),
        ),
      );
    }
    return ShadButton.outline(
      onPressed: () => onPressed(data),
      icon: icon,
    );
  }
}
