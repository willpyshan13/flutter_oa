import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vv_oa/util/toast.dart';

///处理返回错误信息
dispatchFailure(BuildContext context, dynamic e) {
  var message = e.toString();
  if (e is DioError && context != null) {
    Toast.show(message, context, type: Toast.ERROR);
  }
}
