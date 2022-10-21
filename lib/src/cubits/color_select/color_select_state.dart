part of 'color_select_cubit.dart';

@immutable
abstract class ColorSelectState {}

class ColorSelectInitial extends ColorSelectState {}

class ColorSelectIsSelected extends ColorSelectState {
  final int index;

  ColorSelectIsSelected(this.index);
}
