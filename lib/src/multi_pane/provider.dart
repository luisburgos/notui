import 'package:flutter_riverpod/flutter_riverpod.dart';

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
class NotUiMultiPaneProvider extends Notifier<NotUiMultiPaneState> {
  /// @no-doc
  NotUiMultiPaneProvider({
    this.initialState = const NotUiMultiPaneState(),
  });

  /// @no-doc
  final NotUiMultiPaneState initialState;

  @override
  NotUiMultiPaneState build() {
    return initialState.copyWith(
      configs: const NotUiMultiPaneConfigs(),
    );
  }

  /// @no-doc
  void setLeftOpen({bool isOpen = true}) {
    state = state.copyWith(
      isLeftPaneOpen: isOpen,
    );
  }

  /// @no-doc
  void setRightOpen({bool isOpen = true}) {
    state = state.copyWith(
      isRightPaneOpen: isOpen,
    );
  }

  /// @no-doc
  void toggleLeftPane() {
    state = state.copyWith(
      isLeftPaneOpen: !state.isLeftPaneOpen,
    );
  }

  /// @no-doc
  void toggleRightPane() {
    state = state.copyWith(
      isRightPaneOpen: !state.isRightPaneOpen,
    );
  }
}

/// @no-doc
final notUiMultiPaneNotifierProvider =
    NotifierProvider<NotUiMultiPaneProvider, NotUiMultiPaneState>(
  () => NotUiMultiPaneProvider(),
);
