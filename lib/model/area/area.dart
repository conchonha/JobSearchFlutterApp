import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class Area{
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'Name')
  String name;

  Area(this.id, this.name);

  factory Area.fromJson(Map<String, dynamic> json) =>
      _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}