import 'package:flutter_bloc/flutter_bloc.dart';

class AppState {
  const AppState({
    this.selectedIndex = 0,
  });

  final int selectedIndex;
}

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  String get titleForSelectedIndex {
    if (state.selectedIndex == 0) {
      return 'Home';
    }
    if (state.selectedIndex == 1) {
      return 'Profile';
    }
    return 'Unsupported index';
  }

  void setSelectedIndex(int index) {
    emit(
      AppState(selectedIndex: index),
    );
  }
}
