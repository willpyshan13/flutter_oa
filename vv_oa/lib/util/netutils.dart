
import 'dart:async';

import 'package:vv_oa/http/dio_http_modules.dart';
import 'package:rxdart/rxdart.dart';

Future _get(String url, {Map<String, dynamic> params}) async {
  var response = await dio.get(url, queryParameters: params);
  return response.data;
}

Observable post(String url, Map<String, dynamic> params) =>
    Observable.fromFuture(_post(url, params)).asBroadcastStream();

Observable get(String url, {Map<String, dynamic> params}) =>
    Observable.fromFuture(_get(url, params: params)).asBroadcastStream();

Future _post(String url, Map<String, dynamic> params) async {
  var response = await dio.post(url, data: params);
  return response.data;
}

Observable postNoParams(String url) =>
    Observable.fromFuture(_postNoParams(url)).asBroadcastStream();


Future _postNoParams(String url) async {
  var response = await dio.post(url);
  return response.data;
}

