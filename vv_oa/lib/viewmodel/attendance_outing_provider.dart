import 'package:dio/dio.dart';
import 'package:vv_oa/entity/common_response.dart';
import 'package:vv_oa/entity/start_gout_bill_entity.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'base_provider.dart';

///外出
///提供数据model
class AttendanceOutingProvider extends BaseProvider {

  AttendanceOutingProvider(String title, VVModelRepository repo) : super(title, repo);

  Observable startGoutBill(StartGoutBillEntity id) => repo
      .startGoutBill(id)
      .doOnData((r) {
        commonResponse = CommonResponse.fromJson(r);
      })
      .doOnError((e, stacktrace) {
        if (e is DioError) {
          response = e.response.data.toString();
        }
      })
      .doOnListen(() {})
      .doOnDone(() {});
}
