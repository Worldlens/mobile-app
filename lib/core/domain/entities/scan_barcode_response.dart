class ScanBarCodeResponse {
  final String message;
  final String? status;
  final DataBarCode? data;
  final String? option;

  ScanBarCodeResponse(
      {required this.message, this.status, this.data, this.option});

  factory ScanBarCodeResponse.fromJson(Map<String, dynamic> json) =>
      ScanBarCodeResponse(
        message: json['message'].toString(),
        status: json['status'].toString(),
        data: DataBarCode.fromJson(json['data']),
        option: json['option'],
      );
}

class DataBarCode {
  final String _id;
  final String code;
  final String name;
  final List<dynamic> images;
  final String description;
  final String explorer;
  final bool isDelete;
  final String manufactureCode;
  final String createdAt;
  final String updatedAt;
  final String __v;

  DataBarCode(
      this._id,
      this.code,
      this.name,
      this.images,
      this.description,
      this.explorer,
      this.isDelete,
      this.manufactureCode,
      this.createdAt,
      this.updatedAt,
      this.__v);

  factory DataBarCode.fromJson(Map<String, dynamic> json) {
    return DataBarCode(
      json['_id'].toString(),
      json['code'].toString(),
      json['name'].toString(),
      json['images'],
      json['description'].toString(),
      json['explorer'].toString(),
      json['isDelete'],
      json['manufactureCode'].toString(),
      json['createdAt'].toString(),
      json['updatedAt'].toString(),
      json['__v'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": _id,
      "code": code,
      "name": name,
      "images": images,
      "description": description,
      "explorer": explorer,
      "isDelete": isDelete,
      "manufactureCode": manufactureCode,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "__v": __v,
    };
  }
}
