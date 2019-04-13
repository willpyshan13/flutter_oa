import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vv_oa/entity/common_response.dart';
import 'package:vv_oa/entity/extra_work_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';

///加班页面
///提供数据model
class OvertimeProvider extends ChangeNotifier {
  final CompositeSubscription _subscriptions = CompositeSubscription();
  final VVModelRepository _repo;
  String _response = "";
  CommonResponse commonResponse;
  final String title;

  String get response => _response;

  set response(String response) {
    _response = response;
    notifyListeners();
  }

  OvertimeProvider(this.title, this._repo);

  Observable postExtraWork(ExtraWorkEntity extraWorkEntity) => _repo
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

  @override
  void dispose() {
    super.dispose();
  }

  void disposeBag() {
    _subscriptions.dispose();
  }

  /// add [StreamSubscription] to [_subscriptions]
  void plus(StreamSubscription s) {
    _subscriptions.add(s);
  }
}
