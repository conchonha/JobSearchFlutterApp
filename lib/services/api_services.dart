import 'package:dio/dio.dart';
import 'package:flutter_library/services/api.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled_folder/model/area/area.dart';
import 'package:untitled_folder/model/career/career.dart';
import 'package:untitled_folder/model/job/job.dart';
import 'package:untitled_folder/model/profile/profile.dart';

import '../model/response/auth/user/user_response.dart';
import '../model/response/auth/user_uuid/user_uuid_response.dart';
import '../model/response/home/response_data.dart';
import '../model/user/user.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'http://192.168.179.165/JobSearch/public/rest-api')
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

  @GET('/Career/getDataCarreer')
  Future<ResponseData<Career>> getListCareer();

  @GET('/Career/getDataArea')
  Future<ResponseData<Area>> getListArea();

  @POST('/Profile/register')
  Future<ResponseData<Profile>> registerProfile(@Body() Profile profile);

  @GET('/Career/getListJobFromCarreId?careerId={careerId}')
  Future<ResponseData<Job>> getListRecommendedByCareer(@Path("careerId") careerId);

  @GET('/Career/getListJobFromArea?areaId={areaId}')
  Future<ResponseData<Job>> getListRecommendedByArea(@Path("areaId") areaId);

  @GET('/Career/getListJobLess10tr')
  Future<ResponseData<Job>> getListJobLess10tr();

  @GET('/Career/getListJobBetter10tr_20tr')
  Future<ResponseData<Job>> getListJobBetter10tr_20tr();

  @GET('/Career/getListJobBigger20tr')
  Future<ResponseData<Job>> getListJobBigger20tr();

  @GET('/Career/getListJobFromEnglishLevelId?englishLevel={englishLevel}')
  Future<ResponseData<Job>> getListJobFromEnglishLevelId(@Path('englishLevel') englishLevel);

  @GET('/Career/getListFromSearch?textSearch={textSearch}')
  Future<ResponseData<Job>> getListFromSearch(@Path('textSearch') textSearch);
}

class Api {
  late RestClient client;
  late RestClient clientUUID;

  Api() {
    client = RestClient(API().dio, baseUrl: 'http://192.168.0.100/JobSearch/public/rest-api');
  }

  Api.clientUUID() {
    clientUUID = RestClient(API().dio, baseUrl: 'https://cvnl.me/uuid/v1');
  }
}