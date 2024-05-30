import 'package:flutter_application_1/module/register_product/domain/entities/data.dart';

class CountryRp {
  CountryRp({
    String? message,
    int? status,
    Data? data,
    dynamic options,
  }) {
    _message = message;
    _status = status;
    _data = data;
    _options = options;
  }

  CountryRp.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _options = json['options'];
  }

  String? _message;
  int? _status;
  Data? _data;
  dynamic _options;

  CountryRp copyWith({
    String? message,
    int? status,
    Data? data,
    dynamic options,
  }) =>
      CountryRp(
        message: message ?? _message,
        status: status ?? _status,
        data: data ?? _data,
        options: options ?? _options,
      );

  String? get message => _message;

  int? get status => _status;

  Data? get data => _data;

  dynamic get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['options'] = _options;
    return map;
  }
}
