import 'package:flutter/material.dart';

class MySideBarToolbar extends StatelessWidget {
  const MySideBarToolbar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Row(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
