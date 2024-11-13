import 'package:flutter/material.dart';
import 'package:notui/notui.dart';

class MySidebarBody extends StatelessWidget {
  const MySidebarBody({
    required this.selectedIndex,
    required this.setSelectedIndex,
    super.key,
  });

  final int selectedIndex;
  final void Function(int) setSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotUiSideBarMenuItem(
          isSelected: selectedIndex == 0,
          data: const NotUiSideBarMenuItemData(
            id: 'home',
            label: 'Home',
            iconData: Icons.home,
          ),
          onPressed: (item) => setSelectedIndex(0),
        ),
        NotUiSideBarMenuItem(
          isSelected: selectedIndex == 1,
          data: const NotUiSideBarMenuItemData(
            id: 'profile',
            label: 'Profile',
            iconData: Icons.person,
          ),
          onPressed: (item) => setSelectedIndex(1),
        ),
      ],
    );
  }
}
