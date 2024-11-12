/// @no-doc
class NotUiSideBarState {
  /// @no-doc
  const NotUiSideBarState({
    required this.configs,
    this.isExpanded = true,
  });

  /// Open state of the sidebar
  final bool isExpanded;

  /// @no-doc
  final NotUiSideBarConfigs configs;

  /// @no-doc
  NotUiSideBarState copyWith({
    bool? isExpanded,
    NotUiSideBarConfigs? configs,
  }) {
    return NotUiSideBarState(
      isExpanded: isExpanded ?? this.isExpanded,
      configs: configs ?? this.configs,
    );
  }
}

/// @no-doc
class NotUiSideBarConfigs {
  /// @no-doc
  const NotUiSideBarConfigs({
    this.iconSize = 20.0,
  });

  /// @no-doc
  final double iconSize;

  /// @no-doc
  NotUiSideBarConfigs copyWith({
    double? iconSize,
  }) {
    return NotUiSideBarConfigs(
      iconSize: iconSize ?? this.iconSize,
    );
  }
}
