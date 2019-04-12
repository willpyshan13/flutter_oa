import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vv_oa/entity/user_info_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vv_oa/util/DataUtils.dart';

///我的页面
///提供数据model
class HomeWorkViewModel extends ChangeNotifier {
  final CompositeSubscription _subscriptions = CompositeSubscription();
  final VVModelRepository _repo;
  String _response = "";
  UserInfoEntity userInfoEntity;
  final String title;

  String get response => _response;

  set response(String response) {
    _response = response;
    notifyListeners();
  }

  HomeWorkViewModel(this.title, this._repo);

  Observable getCurrentUser() => _repo
      .getCurrentUser()
      .doOnData((r) {
        response = r.toString();

        userInfoEntity = UserInfoEntity.fromJson(r);
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
