import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notui/src/sidebar/state.dart';

/// @no-doc
class NotUiSideBarController extends Cubit<NotUiSideBarState> {
  /// @no-doc
  NotUiSideBarController({
    required this.initialIsExpanded,
  }) : super(
          NotUiSideBarState(
            isExpanded: initialIsExpanded,
            configs: const NotUiSideBarConfigs(),
          ),
        );

  /// @no-doc
  final bool initialIsExpanded;

  /// @no-doc
  void setExpanded({bool isExpanded = true}) {
    emit(state.copyWith(
      isExpanded: isExpanded,
    ));
  }

  /// @no-doc
  void toggle() {
    emit(state.copyWith(
      isExpanded: !state.isExpanded,
    ));
  }
}
