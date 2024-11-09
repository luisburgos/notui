import 'package:flutter_riverpod/flutter_riverpod.dart';

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

/// @no-doc
class NotUiSideBarProvider extends Notifier<NotUiSideBarState> {
  /// @no-doc
  NotUiSideBarProvider({
    required this.initialIsExpanded,
  });

  /// @no-doc
  final bool initialIsExpanded;

  @override
  NotUiSideBarState build() => NotUiSideBarState(
        isExpanded: initialIsExpanded,
        configs: const NotUiSideBarConfigs(),
      );

  /// @no-doc
  void setExpanded({bool isExpanded = true}) {
    state = state.copyWith(
      isExpanded: isExpanded,
    );
  }

  /// @no-doc
  void toggle() {
    state = state.copyWith(
      isExpanded: !state.isExpanded,
    );
  }
}

/// @no-doc
final notUiSideBarNotifierProvider =
    NotifierProvider<NotUiSideBarProvider, NotUiSideBarState>(
  () => NotUiSideBarProvider(initialIsExpanded: false),
);
