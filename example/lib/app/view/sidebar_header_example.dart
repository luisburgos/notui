import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SidebarHeaderExample extends StatelessWidget {
  const SidebarHeaderExample({
    required this.isExpanded,
    super.key,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            Icons.snapchat,
            color: ShadTheme.of(context).colorScheme.primary,
          ),
        ),
        if (isExpanded)
          const Text(
            'App Name',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
      ],
    );
  }
}
