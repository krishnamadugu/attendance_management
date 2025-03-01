import 'package:bloc/bloc.dart';

/// Cubit for the error message value
class BottomBarCubit extends Cubit<int> {
  int selectedIndex = 0;
  BottomBarCubit({required this.selectedIndex}) : super(0);

  void onPressed(int index) {
    selectedIndex = index;
    emit(selectedIndex);
  }
}
