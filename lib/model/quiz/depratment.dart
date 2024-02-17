import '../../utilis/models/base_data_model.dart';

class DepartmentBaseModel extends BaseDataModel {
  String? id = null;

  String depName;


  DepartmentBaseModel({
    this.id,
    required this.depName,
    this.map

  });
  factory DepartmentBaseModel.fromJson(Map<String, dynamic> json, String id) {
    return DepartmentBaseModel(
      id: id,
      depName: json['depName'] == null ? null : json['depName'],
      map: json
    );
  }

  Map<String, dynamic> toJson() {
    if (map == null) {
      map = {};
    }
    if (id != null) {
      map!['id'] = id;
    }

    map!['depName'] = depName;

    return map!;
  }

  Map<String, dynamic>? map = Map();
}
