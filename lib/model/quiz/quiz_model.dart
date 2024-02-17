import '../../utilis/models/base_data_model.dart';

class QuizBaseModel  extends BaseDataModel {
  String? id = null;
  String depId;

  String question;
  String choose1;
  String choose2;
  String choose3;
  String choose4;
  int answer;

  QuizBaseModel({
    this.id,
    required this.depId,

    required this.question,
    required this.choose1,
    required this.choose2,
    required this.choose3,
    required this.choose4,
    required this.answer,

  });
  factory QuizBaseModel.fromJson(Map<String, dynamic> json, String id) {
    return QuizBaseModel(
      id: id,
      depId: json['depId'] == null ? "" : json['depId'],

      question: json['question'] == null ? "" : json['question'],
      choose1: json['choose1'] == null ? "" : json['choose1'],
      choose2: json['choose2'] == null ? "" : json['choose2'],
      choose3: json['choose3'] == null ? "" : json['choose3'],
      choose4: json['choose4'] == null ? "" : json['choose4'],
      answer: json['answer'] == null ? "" : json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    if (map == null) {
      map = {};
    }
    map!['id'] = id;
    map!['depId'] = depId;

    map!['question'] = question;
    map!['choose1'] = choose1;
    map!['choose2'] = choose2;
    map!['choose3'] = choose3;
    map!['choose4'] = choose4;
    map!['answer'] = answer;
    return map!;
  }

  Map<String, dynamic>? map = Map();


}
