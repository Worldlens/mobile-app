import 'dart:convert';

import 'package:flutter_application_1/core/data/models/product_model.dart';
import 'package:flutter_application_1/core/domain/entities/products.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = ProductModel.empty();
  test('should be a subclass of Product entity', () {
    expect(tModel, isA<Product>());
  });
  final tJson = fixture('product.json');
  final tMap = jsonDecode(tJson) as Map<String, dynamic>;
  group('fromMap', () {
    test('return ProductModel from Map', () {
      final result = ProductModel.fromMap(tMap);
      expect(result, tModel);
    });
  });
  group('fromJson', () {
    test('return ProductModel from Json', () {
      final result = ProductModel.fromJson(tJson);
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
      final result = tModel.copyWith(name: "Paul");
      expect(result.name, 'Paul');
    });
  });
}
