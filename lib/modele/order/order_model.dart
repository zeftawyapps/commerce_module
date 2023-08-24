// create order extends ICommerceBaseModel
import 'package:commerce_module/modele/order/ordered_product_model.dart';
import 'package:commerce_module/modele/order/user_base_model.dart';
import 'package:commerce_module/utilis/models/base_data_model.dart';

import '../shop_model.dart';

class OrderBaseModel extends ICommerceBaseDataModel
{

  String id ;
  ShopBaseModel senderUser ;
  UserBaseModel reciverUser ;
  List <OrderedProductModel> products ;
  double totalPrice ;
  String status ;

  OrderBaseModel({
    required this.id , required this.senderUser ,
  required  this.reciverUser
  ,  required this.products , required this.totalPrice , required this.status});
  factory OrderBaseModel.fromJson(Map<String , dynamic> json , String id ){
    return OrderBaseModel(
      id:  id ,
      senderUser:   ShopBaseModel.fromJson(json['senderUser']),
      reciverUser: UserBaseModel.fromJson(json['reciverUser']),
      products: json['products'] == null ? [] : json['products'].map<OrderedProductModel>((e) => OrderedProductModel.fromJson(e)).toList(),
      totalPrice: json['totalPrice'] == null ? 0 : json['totalPrice'],
      status: json['status'] == null ? null : json['status'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    final _data = map;
    _data['id'] = id;
    _data['user'] = senderUser.toJson();
    _data['reciverUser'] = reciverUser.toJson();
    _data['products'] = products.map((e) => e.toJson()).toList();
    _data['totalPrice'] = totalPrice;
    _data['status'] = status;
    return _data;
  }

}