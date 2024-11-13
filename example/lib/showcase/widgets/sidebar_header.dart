import 'package:colorful_iconify_flutter/icons/twemoji.dart' show Twemoji;
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class MySidebarHeader extends StatelessWidget {
  const MySidebarHeader({
    required this.isExpanded,
    super.key,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment:
            isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            child: const Iconify(
              Twemoji.bullseye,
            ),
          ),
          if (isExpanded)
            Container(
              margin: const EdgeInsets.all(4),
              child: const Text(
                'NotUI',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
        ],
      ),
    );
  }
}
