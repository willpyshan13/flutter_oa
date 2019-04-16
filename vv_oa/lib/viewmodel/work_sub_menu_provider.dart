import 'package:dio/dio.dart';
import 'package:vv_oa/entity/user_info_entity.dart';
import 'package:vv_oa/entity/work_wigdet_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'base_provider.dart';

///我的页面
///提供数据model
class WorkSubMenuProvider extends BaseProvider {
  List<WorkWidgetEntity> categories = [];
  WorkSubMenuProvider(String title, VVModelRepository repo) : super(title, repo);

}
