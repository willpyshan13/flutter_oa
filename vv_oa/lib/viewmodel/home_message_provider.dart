import 'dart:async';

import 'package:dio/dio.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'base_provider.dart';

///我的页面
///提供数据model
class HomeMessageProvider extends BaseProvider {
  HomeMessageProvider(String title, VVModelRepository repo)
      : super(title, repo);

  ///获取我的日程
  Observable getFlowOverview() => repo.getFlowOverview().doOnData((r) {
        response = r.toString();
      }).doOnError((e, stacktrace) {
        if (e is DioError) {
          response = e.response.data.toString();
        }
      });
}
