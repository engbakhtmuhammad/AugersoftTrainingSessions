
import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Model{
  int? id;
  String? title;
  String? body;

  Model({this.body,this.id,this.title});

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String , dynamic> toJosn()=> _$ModelToJson(this);
}