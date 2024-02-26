import 'package:dio/dio.dart';


import '../core/app_url/app_url.dart';
import 'sh/sh.dart';

class DioHelper
{
  static Dio? dio;
  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: AppUrl.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String ,dynamic>? query,
    String? token,
  }) async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      "Content-Type":"application/json",
      "lang" : "${SharedPreferencesHelper.getData(key: "lang")?? "ar"}",
      if(SharedPreferencesHelper.getData(key: "userToken") !=null )
      "Authorization":"Bearer ${SharedPreferencesHelper.getData(key: "userToken")}",
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    dynamic data,
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      "Content-Type" :"application/json",
      "lang" : "${SharedPreferencesHelper.getData(key: "lang") ?? "ar" }",
      if(SharedPreferencesHelper.getData(key: "userToken") !=null )
        "Authorization":"${SharedPreferencesHelper.getData(key: "userToken")}",
    };
    return   await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String ,dynamic>? query,
    required Map<String,dynamic> data,
    String lang = "en",
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      if(SharedPreferencesHelper.getData(key: "userToken") !=null )
        "Authorization":"Bearer ${SharedPreferencesHelper.getData(key: "userToken")}",
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String ,dynamic>? query,
    required Map<String,dynamic> data,
    String? token,
  })async
  {
    dio!.options.headers=
    {
      "Accept":"application/json",
      if(SharedPreferencesHelper.getData(key: "userToken") !=null )
        "Authorization":"Bearer ${SharedPreferencesHelper.getData(key: "userToken")}",

    };
    return await dio!.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

}