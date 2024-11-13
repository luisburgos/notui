import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/src/not_multi_pane/state.dart';

/// @no-doc
class NotUiMultiPaneCubit extends Cubit<NotUiMultiPaneState> {
  /// @no-doc
  NotUiMultiPaneCubit({
    this.initialConfigs = const NotUiMultiPaneConfigs(),
  }) : super(
          NotUiMultiPaneState(
            configs: initialConfigs,
          ),
        );

  /// @no-doc
  final NotUiMultiPaneConfigs initialConfigs;

  /// @no-doc
  void setLeftOpen({bool isOpen = true}) {
    emit(
      state.copyWith(
        isLeftPaneOpen: isOpen,
      ),
    );
  }

  /// @no-doc
  void setRightOpen({bool isOpen = true}) {
    emit(
      state.copyWith(
        isRightPaneOpen: isOpen,
      ),
    );
  }

  /// @no-doc
  void toggleLeftPane() {
    emit(
      state.copyWith(
        isLeftPaneOpen: !state.isLeftPaneOpen,
      ),
    );
  }

  /// @no-doc
  void toggleRightPane() {
    emit(
      state.copyWith(
        isRightPaneOpen: !state.isRightPaneOpen,
      ),
    );
  }
}
