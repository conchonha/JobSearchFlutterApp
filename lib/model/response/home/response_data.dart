import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable(explicitToJson: true,genericArgumentFactories: true)
class ResponseData<T>{
  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'statuscode')
  int statuscode;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'data')
  List<T> data;

  ResponseData(this.message, this.statuscode, this.total, this.data);

  factory ResponseData.fromJson(Map<String, dynamic> json,T Function(Object? json) fromJsonT) =>
      _$ResponseDataFromJson<T>(json,fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) => _$ResponseDataToJson<T>(this,toJsonT);
}