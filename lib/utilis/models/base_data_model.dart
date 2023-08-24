 abstract class ICommerceBaseDataModel{
  // create to json method and factory forJson
  Map<String, dynamic> toJson();
  ICommerceBaseDataModel();
  factory ICommerceBaseDataModel.fromJson(Map<String, dynamic> json , String id ) {
    throw UnimplementedError();
  }
  Map<String, dynamic>  map = Map();

 }