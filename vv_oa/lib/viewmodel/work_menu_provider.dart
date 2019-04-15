import 'package:dio/dio.dart';
import 'package:vv_oa/entity/user_info_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'base_provider.dart';

///我的页面
///提供数据model
class WorkMenuProvider extends BaseProvider {
  UserInfoEntity userInfoEntity;

  WorkMenuProvider(String title, VVModelRepository repo) : super(title, repo);

  Observable getCurrentUser() => repo
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
}
