
import 'package:flutter_application_1/core/domain/entities/products.dart';

// class ProductModel extends Product {
//   const ProductModel({
//     required super.id,
//     required super.name,
//     required super.country,
//     required super.des,
//     required super.manufacture,
//   });
//   ProductModel.empty()
//       : super(
//           id: '1',
//           name: "coca",
//           des: "",
//           manufacture: "vn",
//           country: "vn",
//         );
//   factory ProductModel.fromJson(String source) =>
//       ProductModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

//   ProductModel copyWith(
//       {String? id,
//       String? name,
//       String? country,
//       String? des,
//       String? manufacture}) {
//     return ProductModel(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         country: country ?? this.country,
//         des: des ?? this.des,
//         manufacture: manufacture ?? this.manufacture);
//   }

//   ProductModel.fromMap(Map<String, dynamic> map)
//       : this(
//             id: map["id"],
//             name: map["name"],
//             des: map["des"],
//             country: map["country"],
//             manufacture: map["manufact"]);

//   Map<String, dynamic> toMap() => {
//         'id': id,
//         'name': name,
//         'des': des,
//         'manufact': manufacture,
//         'country': country,
//       };

//   String toJson() => jsonEncode(toMap());
// }

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.code,
    required super.createdAt,
    required super.description,
    required super.explorer,
    required super.images,
    required super.isDelete,
    required super.manufactureCode,
    required super.updatedAt,
    required super.v,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    code = json['code'];
    name = json['name'];
    images = List<String>.from(json['images']);
    description = json['description'];
    explorer = json['explorer'];
    isDelete = json['isDelete'];
    manufactureCode = json['manufactureCode'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['images'] = images;
    data['description'] = description;
    data['explorer'] = explorer;
    data['isDelete'] = isDelete;
    data['manufactureCode'] = manufactureCode;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}
