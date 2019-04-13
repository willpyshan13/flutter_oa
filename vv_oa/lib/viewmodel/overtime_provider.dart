import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vv_oa/entity/common_response.dart';
import 'package:vv_oa/entity/extra_work_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'base_provider.dart';

///加班页面
///提供数据model
class OvertimeProvider extends BaseProvider {
  OvertimeProvider(String title, VVModelRepository repo) : super(title, repo);

  Observable postExtraWork(ExtraWorkEntity extraWorkEntity) => repo
      .postExtraWork(extraWorkEntity)
      .doOnData((r) {
        commonResponse = CommonResponse.fromJson(r);
        response = r.toString();
      })
      .doOnError((e, stacktrace) {
        if (e is DioError) {
          response = e.response.data.toString();
        }
      })
      .doOnListen(() {})
      .doOnDone(() {});


}
