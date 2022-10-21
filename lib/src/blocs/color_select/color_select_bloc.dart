import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'color_select_event.dart';
part 'color_select_state.dart';

class ColorSelectBloc extends Bloc<ColorSelectEvent, ColorSelectState> {
  ColorSelectBloc() : super(ColorSelectIsSelected(0)) {
    on<SelectColor>((event, emit) {
      emit(ColorSelectIsSelected(event.index));
    });
  }
}
