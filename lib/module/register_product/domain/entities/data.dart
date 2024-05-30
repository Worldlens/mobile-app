class Data {
  Data({
    String? id,
    String? country,
    int? barcode,
  }) {
    _id = id;
    _country = country;
    _barcode = barcode;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _country = json['country'];
    _barcode = json['barcode'];
  }

  String? _id;
  String? _country;
  int? _barcode;

  Data copyWith({
    String? id,
    String? country,
    int? barcode,
  }) =>
      Data(
        id: id ?? _id,
        country: country ?? _country,
        barcode: barcode ?? _barcode,
      );

  String? get id => _id;

  String? get country => _country;

  int? get barcode => _barcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['country'] = _country;
    map['barcode'] = _barcode;
    return map;
  }
}
