/// @no-doc
class NotUiMultiPaneConfigs {
  /// @no-doc
  const NotUiMultiPaneConfigs({
    this.iconSize = 20.0,
  });

  /// @no-doc
  final double iconSize;

  /// @no-doc
  NotUiMultiPaneConfigs copyWith({
    double? iconSize,
  }) {
    return NotUiMultiPaneConfigs(
      iconSize: iconSize ?? this.iconSize,
    );
  }
}

/// @no-doc
class NotUiMultiPaneState {
  /// @no-doc
  const NotUiMultiPaneState({
    this.isLeftPaneOpen = true,
    this.isRightPaneOpen = true,
    this.configs,
  });

  /// @no-doc
  final bool isLeftPaneOpen;

  /// @no-doc
  final bool isRightPaneOpen;

  /// @no-doc
  final NotUiMultiPaneConfigs? configs;

  /// @no-doc
  NotUiMultiPaneState copyWith({
    bool? isLeftPaneOpen,
    bool? isRightPaneOpen,
    NotUiMultiPaneConfigs? configs,
  }) {
    return NotUiMultiPaneState(
      isLeftPaneOpen: isLeftPaneOpen ?? this.isLeftPaneOpen,
      isRightPaneOpen: isRightPaneOpen ?? this.isRightPaneOpen,
      configs: configs ?? this.configs,
    );
  }
}
