import 'package:json_annotation/json_annotation.dart';

import '../../../user/user.dart';


part 'user_response.g.dart';

@JsonSerializable()
class UseResponse{
  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'statuscode')
  int statuscode;

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'data')
  User data;

  UseResponse(this.message, this.statuscode, this.total, this.data);

  factory UseResponse.fromJson(Map<String, dynamic> json) =>
      _$UseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UseResponseToJson(this);
}