
import '../products/base_models/product_model.dart';

class OrderedProductModel extends ProductBaseModel{
  int  quantity ;
  double  totalPrice ;
  String orderProductId ;
  OrderedProductModel({
    required this.quantity, required this.totalPrice,
    required this.orderProductId,
    required super.id, required super.name, required super.description, required super.userPrice });

  factory OrderedProductModel.fromJson(Map<String , dynamic> json ){
    return OrderedProductModel(
      orderProductId: json['orderProductId'] == null ? null : json['orderProductId'],
      quantity: json['quantity'] == null ? 0 : json['quantity'],
      totalPrice: json['totalPrice'] == null ? 0 : json['totalPrice'],
      id: json['id'] == null ? null : json['id'],
      name: json['name'] == null ? null : json['name'],
      description: json['description'] == null ? null : json['description'],
      userPrice: json['userPrice'] == null ? null : json['userPrice'],
       );
  }
  Map<String, dynamic> toJson() {
    final _data =  map;
    _data['orderProductId'] = orderProductId;
    _data['quantity'] = quantity;
    _data['totalPrice'] = totalPrice;

    return _data;
  }
}