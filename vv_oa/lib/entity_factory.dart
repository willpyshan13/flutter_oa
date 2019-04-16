import 'package:vv_oa/constant/copy_person_entity.dart';
import 'package:vv_oa/entity/assignee_and_copy_entity.dart';
import 'package:vv_oa/entity/banner_entity.dart';
import 'package:vv_oa/entity/extra_work_entity.dart';
import 'package:vv_oa/entity/flow_overview_entity.dart';
import 'package:vv_oa/entity/overtime_detail_entity.dart';
import 'package:vv_oa/entity/start_gout_bill_entity.dart';
import 'package:vv_oa/entity/user_info_entity.dart';
import 'package:vv_oa/entity/work_wigdet_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CopyPersonEntity") {
      return CopyPersonEntity.fromJson(json) as T;
    } else if (T.toString() == "AssigneeAndCopyEntity") {
      return AssigneeAndCopyEntity.fromJson(json) as T;
    } else if (T.toString() == "ExtraWorkEntity") {
      return ExtraWorkEntity.fromJson(json) as T;
    } else if (T.toString() == "FlowOverviewEntity") {
      return FlowOverviewEntity.fromJson(json) as T;
    } else if (T.toString() == "OvertimeDetailEntity") {
      return OvertimeDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "StartGoutBillEntity") {
      return StartGoutBillEntity.fromJson(json) as T;
    } else if (T.toString() == "UserInfoEntity") {
      return UserInfoEntity.fromJson(json) as T;
    }else {
      return null;
    }
  }
}