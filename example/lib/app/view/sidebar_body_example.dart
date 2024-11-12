import 'package:flutter/material.dart';
import 'package:notui/notui.dart';

class SidebarBodyExample extends StatelessWidget {
  const SidebarBodyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotUiSideBarMenuItem(
          data: const NotUiSideBarMenuItemData(
            id: 'home',
            label: 'Home',
            iconData: Icons.home,
          ),
          onPressed: (item) {},
        ),
        NotUiSideBarMenuItem(
          data: const NotUiSideBarMenuItemData(
            id: 'profile',
            label: 'Profile',
            iconData: Icons.person,
          ),
          onPressed: (item) {},
        ),
      ],
    );
  }
}
