import 'package:dio/dio.dart';
import 'package:flutter_library/services/api.dart';
import 'package:retrofit/retrofit.dart';

import '../model/respone/auth/user/user_response.dart';
import '../model/respone/auth/user_uuid/user_uuid_response.dart';
import '../model/user/user.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'http://192.168.60.165/JobSearch/public/rest-api')
abstract class RestClient{

  factory RestClient(Dio dio,{String baseUrl}) = _RestClient;
  //-----------------------UUID services------
  @POST('/user/create')
  Future<UserUUIDResponse>createUserUUId(
      @Field("account") String userName,
      @Field("hash") String password
      );

  @POST('/user/hash')
  Future<UserUUIDResponse>loginUserUUId(
      @Field("account") String userName,
      @Field("hash") String password
      );

  //------------------------LARAVEL Services-----
  @POST('/User/register')
  Future<UseResponse>register(@Body() User user);

  @GET('/User/getUserByUserName?name={name}')
  Future<UseResponse>findUserByName(@Path("name") userName);
}

class Api {
  late RestClient client;
  late RestClient clientUUID;

  Api() {
    client = RestClient(API().dio, baseUrl: 'http://192.168.60.165/JobSearch/public/rest-api');
  }

  Api.clientUUID() {
    clientUUID = RestClient(API().dio, baseUrl: 'https://cvnl.me/uuid/v1');
  }
}