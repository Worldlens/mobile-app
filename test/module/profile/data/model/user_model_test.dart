import 'dart:convert';

import 'package:flutter_application_1/module/profile/data/model/user_model.dart';
import 'package:flutter_application_1/module/profile/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('should be a subclass of User entity', () {
    expect(tModel, isA<User>());
  });
  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as Map<String, dynamic>;
  print(tMap);
  group('fromMap', () {
    test('return UserModel from Map', () {
      final result = UserModel.fromMap(tMap);
      expect(result, tModel);
    });
  });

  group('fromJson', () {
    test('return UsertModel from Json', () {
      final result = UserModel.fromJson(tJson);
      expect(result, tModel);
    });
  });
  group('toMap', () {
    test('return map of data', () {
      final result = tModel.toMap();
      expect(result, tMap);
    });
  });

  group('copywith', () {
    test('return new name', () {
      final result = tModel.copyWith(name: "pepsi");
      expect(result.name, 'pepsi');
    });
  });
}
