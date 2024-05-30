
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({required this.id, required this.name, required this.point});

  final int id;
  final String name;
  final double point;

  const User.empty() : this(id: 1, point: 3.0, name: 'product1');
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
