import 'package:commerce_module/utilis/models/base_data_model.dart';

class ProductBaseModel extends ICommerceBaseDataModel{
  // The id of the product
  final String id;
  // The name of the product
  final String name;
  // The description of the product
  final String description;
  // The price of the product
  final double userPrice;
  // The image url of the product
  final String? imageUrl;
  // The category of the product


  // A constructor to initialize the product fields
  ProductBaseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.userPrice,
     this.imageUrl,

  });
factory ProductBaseModel.fromJson(Map<String , dynamic> json    ){
    return ProductBaseModel(
      id:  json['id'] == null ? null : json['id'] ,
      name: json['name'] == null ? null : json['name'],
      description: json['description'] == null ? null : json['description'],
      userPrice: json['userPrice'] == null ? null : json['userPrice'],
      imageUrl: json['imageUrl'] == null ? null : json['imageUrl'],

    );
  }
  factory ProductBaseModel.fireBasefromJson(Map<String , dynamic> json , String id     ){
    return ProductBaseModel(
      id:  json['id'] == null ? null : json['id'] ,
      name: json['name'] == null ? null : json['name'],
      description: json['description'] == null ? null : json['description'],
      userPrice: json['userPrice'] == null ? null : json['userPrice'],
      imageUrl: json['imageUrl'] == null ? null : json['imageUrl'],

    );
  }



  // A method to convert the product to a map for database operations
  Map<String, dynamic> toJson() {
    final _data = map;
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['userPrice'] = userPrice;
    _data['imageUrl'] = imageUrl??"";

    return _data;

  }



}


