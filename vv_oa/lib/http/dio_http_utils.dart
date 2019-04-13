import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';
import 'package:vv_oa/http/api.dart';

import 'dio_error_interceptor.dart';


///全局dio网络请求库
///@author pengyushan
///@createTime 2019-4-12
final Dio dio = Dio()
  ..options = BaseOptions(baseUrl: Api.BaseUrl, connectTimeout: 30*1000, receiveTimeout: 30*1000)
  ..interceptors.add(AuthInterceptor())
  ..interceptors.add(DioErrorInterceptor())
  ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

String token = "";

///头部认证用
class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    options.headers.update("Authorization", (_) => token, ifAbsent: () => token);
    return super.onRequest(options);
  }
}

///对外的get请求，带参数
Observable get(String url, {Map<String, dynamic> params}) =>
    Observable.fromFuture(_get(url, params: params)).asBroadcastStream();

///内部get请求
Future _get(String url, {Map<String, dynamic> params}) async {
  var response = await dio.get(url, queryParameters: params);
  return response.data;
}

///对外post请求，需要传递map参数
Observable post(String url, Map<String, dynamic> params) =>
    Observable.fromFuture(_post(url, params)).asBroadcastStream();

///内部post请求，需要传递map参数
Future _post(String url, Map<String, dynamic> params) async {
  var response = await dio.post(url, data: params);
  return response.data;
}

///对外的post请求，不需要传递参数
Observable postNoParams(String url) =>
    Observable.fromFuture(_postNoParams(url)).asBroadcastStream();

///内部的post请求，不需要传递参数
Future _postNoParams(String url) async {
  var response = await dio.post(url);
  return response.data;
}

///对外的post请求，传递json格式字符串
Observable posWithData(String url,String rowData) =>
    Observable.fromFuture(_posWithData(url,rowData)).asBroadcastStream();

///内部的post请求，传递json格式字符串
Future _posWithData(String url,String rowData) async {
  var response = await dio.post(url,data: rowData);
  return response.data;
}