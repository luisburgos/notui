import 'package:flutter_bloc/flutter_bloc.dart';

class AppState {
  const AppState({
    this.selectedIndex = 0,
  });

  final int selectedIndex;
}

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void setSelectedIndex(int index) {
    emit(
      AppState(selectedIndex: index),
    );
  }
}
