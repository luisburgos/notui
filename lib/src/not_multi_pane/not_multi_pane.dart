import 'package:flutter/material.dart';

/// @no-doc
const notUiDefaultLeftPaneWidth = 250.0;

/// @no-doc
class NotUiMultiPane extends StatelessWidget {
  /// @no-doc
  const NotUiMultiPane({
    required this.borderColor,
    this.isLeftPaneOpen = false,
    this.isRightPaneOpen = false,
    this.leftPane,
    this.rightPane,
    this.body,
    this.header,
    this.rightPaneWidth,
    this.leftPaneWidth,
    super.key,
  });

  /// @no-doc
  final bool isLeftPaneOpen;

  /// @no-doc
  final bool isRightPaneOpen;

  /// @no-doc
  final double? rightPaneWidth;

  /// @no-doc
  final double? leftPaneWidth;

  /// @no-doc
  final Widget? leftPane;

  /// @no-doc
  final Widget? rightPane;

  /// @no-doc
  final Widget? body;

  /// @no-doc
  final Widget? header;

  /// @no-doc
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (header != null) ...[
          header!,
          const Divider(
            thickness: 1,
            height: 1,
          ),
        ],
        Expanded(
          child: Row(
            children: [
              if (isLeftPaneOpen)
                Container(
                  constraints: BoxConstraints(
                    maxWidth: leftPaneWidth ?? notUiDefaultLeftPaneWidth,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: borderColor),
                    ),
                  ),
                  child: leftPane ??
                      const Center(
                        child: Text('Left Pane'),
                      ),
                ),
              Expanded(
                child: body ??
                    const Center(
                      child: Text('Body'),
                    ),
              ),
              if (isRightPaneOpen)
                Container(
                  constraints: BoxConstraints(
                    maxWidth: rightPaneWidth ?? notUiDefaultLeftPaneWidth,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: borderColor),
                    ),
                  ),
                  child: rightPane ??
                      const Center(
                        child: Text('Right Pane'),
                      ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
