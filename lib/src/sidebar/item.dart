import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/src/sidebar/controller.dart';
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
class NotUiSideBarMenuItem extends StatelessWidget {
  /// @no-doc
  const NotUiSideBarMenuItem({
    required this.data,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });

  /// @no-doc
  final NotUiSideBarMenuItemData data;

  /// @no-doc
  final bool isSelected;

  /// @no-doc
  final void Function(NotUiSideBarMenuItemData) onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NotUiSideBarController>();

    final color = isSelected
        ? ShadTheme.of(context).colorScheme.primary
        : ShadTheme.of(context).colorScheme.mutedForeground;
    final icon = Icon(
      data.iconData,
      size: controller.state.configs.iconSize,
      color: color,
    );

    if (controller.state.isExpanded) {
      return ShadButton.outline(
        width: double.infinity,
        foregroundColor: color,
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
      foregroundColor: color,
      onPressed: () => onPressed(data),
      icon: icon,
    );
  }
}
