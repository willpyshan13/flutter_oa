import 'package:dio/dio.dart';
import 'package:vv_oa/entity/overtime_detail_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'base_provider.dart';

///工作菜单页面
///提供数据model
class OverTimeDetailProvider extends BaseProvider {
  OvertimeDetailEntity overtimeDetailEntity;

  OverTimeDetailProvider(String title, VVModelRepository repo) : super(title, repo);

  Observable getFlowOverviewInfo(int id) => repo
      .getFlowOverviewInfo(id.toString())
      .doOnData((r) {
        overtimeDetailEntity = OvertimeDetailEntity.fromJson(r);
      })
      .doOnError((e, stacktrace) {
        if (e is DioError) {
          response = e.response.data.toString();
        }
      })
      .doOnListen(() {})
      .doOnDone(() {});
}
