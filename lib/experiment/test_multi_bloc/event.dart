
import 'package:equatable/equatable.dart';

abstract class Event1 extends Equatable {
  const Event1();

  @override
  List<Object> get props => [];
}

class Changes extends Event1 {
  const Changes(this.text);

  final String text;
}
