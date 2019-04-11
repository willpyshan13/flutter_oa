import 'package:dio/dio.dart';
import 'package:vv_oa/http/api.dart';

String token = "";

final Dio dio = Dio()
  ..options = BaseOptions(baseUrl: Api.BaseUrl, connectTimeout: 30, receiveTimeout: 30)
  ..interceptors.add(AuthInterceptor())
  ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));


///头部认证用
class AuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    options.headers.update("Authorization", (_) => token, ifAbsent: () => token);
    return super.onRequest(options);
  }
}
