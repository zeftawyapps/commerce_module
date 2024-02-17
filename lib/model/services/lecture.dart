import '../../utilis/models/base_data_model.dart';

class Lectures implements BaseDataModel {
  final String? id;
  final String name;
  final String description;
  final String? serviceId;
  final String? video;
  final String? pdf;
  final String? audio;
  final String? lictureLink;
  final String? labNo;
  final String? acadimicName;
  final int hours;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  List<String>? objectives = [];

  Lectures({
      this.id,
    required this.name,
    required this.description,
    required this.hours,
    this.video,
    this.pdf,
    this.audio,
    this.createdAt,
    this.updatedAt,
    this.objectives,
    this.lictureLink,
    this.labNo,
    this.serviceId,

    this.acadimicName,
  });

  factory Lectures.fromJson(Map<String, dynamic> json) {
    return Lectures(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      hours: json['hours'] ,
      serviceId: json['service_id'],
      video: json['video'],
      pdf: json['pdf'],
      audio: json['audio'],
      lictureLink: json['lictureLink'],
      labNo: json['labNo'],
      acadimicName: json['acadimicName'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      objectives: json['objectives'] != null
          ? List<String>.from(json['objectives'])
          : [],
    );
  }
  // to json
  Map<String, dynamic> toJson() {
    if (map == null) {
      map = Map<String, dynamic>();
    }
    map!['id'] = id;
    map!['name'] = name;
    map!['description'] = description;
    map!['service_id'] = serviceId;
    map!['video'] = video;
    map!['pdf'] = pdf;
    map!['audio'] = audio;
    map!['lictureLink'] = lictureLink;
    map!['labNo'] = labNo;
    map!['acadimicName'] = acadimicName;
    map!['created_at'] = createdAt?.toIso8601String();
    map!['updated_at'] = updatedAt?.toIso8601String();
    map!['objectives'] = objectives;
    map!["hours"] = hours;
    return map!;
  }

  @override
  Map<String, dynamic>? map;
}
