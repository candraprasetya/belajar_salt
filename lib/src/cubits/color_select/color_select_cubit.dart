import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'color_select_state.dart';

class ColorSelectCubit extends Cubit<ColorSelectState> {
  ColorSelectCubit() : super(ColorSelectIsSelected(0));

  void changeColor(int index) {
    emit(ColorSelectIsSelected(index));
  }
}
