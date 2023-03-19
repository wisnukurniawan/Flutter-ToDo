import 'package:equatable/equatable.dart';
import 'package:flutter_todo_list/entity/theme.dart';

abstract class HostEvent extends Equatable {
  const HostEvent();

  @override
  List<Object> get props => [];
}

class LoadTheme extends HostEvent {
  const LoadTheme();
}

class ThemeLoaded extends HostEvent {
  const ThemeLoaded({required this.theme});
  final Theme theme;
}
