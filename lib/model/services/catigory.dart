import '../../utilis/models/base_data_model.dart';

class CategoryOfService  implements BaseDataModel{
  String?  id;
  String? name;
  String? image;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryOfService(
      {
        this.id ,
        this.name,
        this.image,
       this.description,
        this.createdAt,
        this .updatedAt});

  factory CategoryOfService.fromJson(Map<String, dynamic> json ,  String id) {
    return CategoryOfService(
      id:  id ,
      name: json['name'],
      image: json['image']??"",
      description: json['description'],
      // null check
      // createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now() ,
      // updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : DateTime.now() ,
    );
  }
  Map<String, dynamic> toJson() {
    if (map == null) {
      map = {};
    }
    map!['name'] = name;
    map!['description'] = description;
     // change to utc
    // map!['createdAt'] = createdAt?.toUtc().toString();
    // map!['updatedAt'] = updatedAt?.toUtc().toString();
    return map!;
 }

  @override
  Map<String, dynamic>? map;
}