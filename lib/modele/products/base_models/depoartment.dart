 import 'package:commerce_module/utilis/models/base_data_model.dart';
import 'package:firebase_storage/firebase_storage.dart';



class DepartmentBaseModel extends ICommerceBaseDataModel{
  String? id=null  ;
  String name ;
  String image ;
  DepartmentBaseModel({
   this.image = "" ,
      this.id ="", required this.name});
factory DepartmentBaseModel.fromJson(Map<String , dynamic> json  , String id ){
    return DepartmentBaseModel(
      id: id ,
      name: json['name'] == null ? null : json['name'],
      image: json['image'] == null ? null : json['image'],
        );
  }
  @override
  Map<String, dynamic> toJson() {
    final _data = map;
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;

    return _data;
  }


}