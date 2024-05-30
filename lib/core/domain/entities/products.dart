
// class Product extends Equatable {
//   const Product(
//       {required this.manufacture,
//       required this.country,
//       required this.id,
//       required this.name,
//       required this.des});

//   final String id;
//   final String name;
//   final String des;
//   final String manufacture;
//   final String country;

//   const Product.empty()
//       : this(
//             id: '1', country: 'vn', des: '', manufacture: '', name: 'product1');

//   @override
//   // TODO: implement props
//   List<Object?> get props => [id, name, des, manufacture, country];
// }

class Product {
  String? id;
  int? code;
  String? name;
  List<String?>? images;
  String? description;
  String? explorer;
  bool? isDelete;
  int? manufactureCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Product(
      {this.id,
      this.code,
      this.name,
      this.images,
      this.description,
      this.explorer,
      this.isDelete,
      this.manufactureCode,
      this.createdAt,
      this.updatedAt,
      this.v});
}
