import 'package:equatable/equatable.dart';

abstract class HostEvent extends Equatable {
  const HostEvent();

  @override
  List<Object> get props => [];
}

class LoadTheme extends HostEvent {
  const LoadTheme();
}
