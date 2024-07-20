// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResultModel {
  String id;
  String result;
  String awaid;
  String persetage;
  String language;
  String image;
  ResultModel({
    required this.id,
    required this.result,
    required this.awaid,
    required this.persetage,
    required this.language,
    required this.image,
  });

  toMap() {
    return "'$id','$result','$awaid','$persetage','$language','$image'";
  }

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      id: map['id'],
      result: map['result'],
      awaid: map['awaid'],
      persetage: map['persetage'],
      language: map['language'],
      image: map['image'],
    );
  }

  @override
  String toString() {
    return 'ResultModel(id: $id, result: $result, awaid: $awaid, persetage: $persetage, language: $language, image: $image)';
  }
}
