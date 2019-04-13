import 'dart:io';

import 'package:dio/dio.dart';

///网络请求出错统一处理
///@Auroth pengyushan
///@CreateTime 2019-4-12
class DioErrorInterceptor extends Interceptor{
  @override
  onError(DioError err) {
    // TODO: implement onError
    //error
    var message = err.message;
    if (err is DioError) {
      final response = err.response;
      if (response?.statusCode == 401) {
        message = "account or password error ";
      } else if (403 == response?.statusCode) {
        message = "forbidden";
      } else if (404 == response?.statusCode) {
        message = "page not found";
      } else if (500 == response?.statusCode) {
        message = "Server internal error";
      } else if (503 == response?.statusCode) {
        message = "Server Updating";
      } else if (err.error is SocketException) {
        message = "network cannot use";
      } else {
        message = "Oops!!";
      }
    }
    err.message = message;
    print("error ：" + err.message);
    return super.onError(err);
  }
}