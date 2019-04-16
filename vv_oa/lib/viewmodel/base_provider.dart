import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vv_oa/entity/common_response.dart';
import 'package:vv_oa/entity/extra_work_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';

///基础provider
///提供数据model
class BaseProvider extends ChangeNotifier {
  final CompositeSubscription _subscriptions = CompositeSubscription();
  final VVModelRepository repo;
  String _response = "";
  CommonResponse commonResponse;
  final String title;

  String get response => _response;


  set response(String response) {
    _response = response;
    notifyListeners();
  }

  BaseProvider(this.title, this.repo);

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
