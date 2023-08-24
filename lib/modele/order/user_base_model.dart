import 'package:commerce_module/utilis/models/base_data_model.dart';

class UserBaseModel extends ICommerceBaseDataModel
{
  String uid ;
  String name ;
  String email ;
  String phone ;
  String address ;

  UserBaseModel({
    required this.uid ,
    required this.name ,
    required this.email ,
    required this.phone ,
    required this.address ,
  });
  factory UserBaseModel.fromJson(Map<String , dynamic> json ){
    return UserBaseModel(
      uid: json['uid'] == null ? null : json['uid'],
      name: json['name'] == null ? null : json['name'],
      email: json['email'] == null ? null : json['email'],
      phone: json['phone'] == null ? null : json['phone'],
      address: json['address'] == null ? null : json['address'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    final _data = map;
    _data['uid'] = uid;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['address'] = address;
    return _data;
  }

}