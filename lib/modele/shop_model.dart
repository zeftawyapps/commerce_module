import 'package:commerce_module/modele/order/user_base_model.dart';
import 'package:commerce_module/modele/products/base_models/depoartment.dart';
 import 'package:commerce_module/utilis/models/base_data_model.dart';

import 'products/base_models/product_model.dart';

class ShopBaseModel extends ICommerceBaseDataModel{
 String id ;
 String name ;
  String image ;
  UserBaseModel mainUser ;


  ShopBaseModel({


    required this.id , required this.name , required this.image , required this.mainUser});
factory ShopBaseModel.fromJson(Map<String , dynamic> json ){
    return ShopBaseModel(

      id: json['id'] == null ? null : json['id'],
      name: json['name'] == null ? null : json['name'],
      image: json['image'] == null ? null : json['image'],
      mainUser: UserBaseModel.fromJson(json['userBaseModel']),
      );
}



  @override
  Map<String, dynamic> toJson() {
    final _data = map;
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['userBaseModel'] = mainUser.toJson();
      return _data;

  }


}