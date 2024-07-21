// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResultModel {
  String id;
  String result;
  String award;
  String percentage;
  String language;
  String image;
  String time;
  ResultModel({
    required this.id,
    required this.result,
    required this.award,
    required this.percentage,
    required this.language,
    required this.image,
    required this.time,
  });

  toMap() {
    return "'$id','$result','$award','$percentage','$language','$image','$time'";
  }

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      id: map['id'],
      result: map['result'],
      award: map['award'],
      percentage: map['percentage'],
      language: map['language'],
      image: map['image'],
      time: map['time'],
    );
  }

  @override
  String toString() {
    return 'ResultModel(id: $id, result: $result, award: $award, percentage: $percentage, language: $language, image: $image, time: $time)';
  }
}
