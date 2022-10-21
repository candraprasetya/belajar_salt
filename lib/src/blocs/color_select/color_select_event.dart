part of 'color_select_bloc.dart';

@immutable
abstract class ColorSelectEvent {}

class SelectColor extends ColorSelectEvent {
  final int index;

  SelectColor(this.index);
}
