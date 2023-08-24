import 'package:commerce_module/modele/products/base_models/product_model.dart';

class ProductFromDep extends ProductBaseModel{
  String depId ;
  String depName ;
  ProductFromDep({
    required this.depId,
    required this.depName,
    required super.id, required super.name, required super.description, required super.userPrice});
  factory ProductFromDep.fromJson(Map<String , dynamic> json , id  ){
    return ProductFromDep(
      depId: json['depId'] == null ? null : json['depId'],
      id: id ,
      depName: json['depName'] == null ? null : json['depName'],
      name: json['name'] == null ? null : json['name'],
      description: json['description'] == null ? null : json['description'],
      userPrice: json['userPrice'] == null ? null : json['userPrice'],
       );
  }
  Map<String, dynamic> toJson() {
    final _data =  map;
    _data['depId'] = depId;
    _data['depName'] = depName;
    _data['name'] = name;
    _data['description'] = description;
    _data['userPrice'] = userPrice;

    return _data;
  }

}