import 'package:flutter/material.dart';

class SideBarToolbarExample extends StatelessWidget {
  const SideBarToolbarExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.greenAccent,
          height: 40,
          child: const Text('Toolbar'),
        ),
      ],
    );
  }
}
