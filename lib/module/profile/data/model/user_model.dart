import 'dart:convert';

import 'package:flutter_application_1/module/profile/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id, required super.name, required super.point});

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as Map<String, dynamic>);
  const UserModel.empty() : super(id: 1, name: '', point: 3.0);

  UserModel.fromMap(Map<String, dynamic> map)
      : this(id: map["id"], name: map["name"], point: map["point"]);

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'point': point,
      };

  String toJson() => jsonEncode(toMap());

  UserModel copyWith({
    int? id,
    String? name,
    double? point,
  }) {
    return UserModel(
        id: id ?? this.id, name: name ?? this.name, point: point ?? this.point);
  }
}
