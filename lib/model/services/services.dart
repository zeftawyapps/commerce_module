
import '../../utilis/models/base_data_model.dart';

class EductionServices implements BaseDataModel {
  // add Id to the collection
  String?  id = "id";
  String? name = "name";
  String? image = "image";
  String? description = "description";
  String? catigoryId = "catigoryId";
  String? catigoryName = "catigoryName";
  String? catigoryImage = "catigoryImage";
  double servicePrice = 0;
  int serviceTime = 0;
  int?   serviceType = 0;
  DateTime? createdAt;
  DateTime? updatedAt;
  // constructor
  EductionServices({
      this.id,
     this.name,
      this.image,
      this.description,
     this.catigoryId ,
    this.catigoryName ,
    this.catigoryImage ,
      this.servicePrice = 1,
      this.serviceTime = 10,
        this.serviceType,
      this.createdAt,
      this.updatedAt,
  });
  // from json
  factory EductionServices.fromJson(Map<String, dynamic> json, String id) {
    return EductionServices(
      id: id,

      name: json['name'] == null ? "" : json['name'],
      image: json['imguri'] == null ? "" : json['imguri'],
      description: json['description'] == null ? "" : json['description'],
      catigoryId:  json['catigoryId'] == null ? "" : json['catigoryId'],
      catigoryImage: json['catigoryImage'] == null ? "" : json['catigoryImage'],
    catigoryName: json['catigoryName'] == null ? "" : json['catigoryName'],

      servicePrice: json['servicePrice'] == null ? 1 : json['servicePrice'],
      serviceTime: json['serviceTime'] == null ? 10 : json['serviceTime'],
      serviceType: json['serviceType'] == null ? 0 : json['serviceType'],
      //  createdAt: json['createdAt'] == null ? DateTime.now() : json['createdAt'],
      // updatedAt: json['updatedAt'] == null ? DateTime.now() : json['updatedAt'],
    );
  }
  // to json
  Map<String, dynamic> toJson() {
    if (map == null) {
      map = Map<String, dynamic>();
    }
    map!['id'] = id;
    map!['name'] = name;
    map!['imguri'] = image;
    map!['description'] = description;
    map!['catigoryId'] = catigoryId;
    map!['catigoryName'] = catigoryName;
    map!['catigoryImage'] = catigoryImage;
    map!['servicePrice'] = servicePrice;
    map!['serviceTime'] = serviceTime;
    map!['serviceType'] = serviceType;
    map!['createdAt'] = DateTime.now().toUtc();
    map!['updatedAt'] = DateTime.now().toUtc();;
    
    return map!;
  }

  @override
  Map<String, dynamic>? map;


}