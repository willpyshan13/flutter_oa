import 'dart:convert';

import 'package:vv_oa/constant/v_http_status.dart';
import 'package:vv_oa/entity/extra_work_entity.dart';
import 'package:vv_oa/http/dio_http_utils.dart';
import 'package:vv_oa/entity/login_user_params.dart';
import 'package:vv_oa/model/vv_model_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vv_oa/util/DataUtils.dart';

///网络库，提供服务
class VVModelRepository {
  final VVModelService _remote;

  VVModelRepository(this._remote,this._sp);

  final DataUtils _sp;

  ///登陆
  Observable login(String username, String password) {
    LoginUserParams user = new LoginUserParams(password,username,true);
    return _remote.login(user.toJson());
  }

  ///获取我的日程
  Observable getFlowOverview() {
    if(_sp!=null){
      token = "Bearer "+_sp.getString(DataUtils.token);
    }
    return _remote.getFlowOverview();
  }

  ///获取当前用户权限以及用户信息
  Observable getCurrentUser() {
    if(_sp!=null){
      token = "Bearer "+_sp.getString(DataUtils.token);
    }
    return _remote.getCurrentUser();
  }

  ///提交加班申请
  Observable postExtraWork(ExtraWorkEntity entity) {
    if(_sp!=null){
      token = "Bearer "+_sp.getString(DataUtils.token);
    }
    return _remote.postExtraWork(json.encode(entity));
  }

  ///获取抄送人，需要权限
  ///2019-4-15 测试的时候一直提示权限不足
  Observable findByBillType(int type) {
    if(_sp!=null){
      token = "Bearer "+_sp.getString(DataUtils.token);
    }
    Map<String,dynamic> params = {VHttpStatus.extraWorkTypeParams:type};
    return _remote.findByBillType(params);
  }

  ///获取抄送人
  ///需要传入amount 金额
  Observable getAssigneeAndCopyList(int amount) {
    if(_sp!=null){
      token = "Bearer "+_sp.getString(DataUtils.token);
    }
    Map<String,dynamic> params = {VHttpStatus.assigneeAndCopyListAmount:amount};
    return _remote.getAssigneeAndCopyList(params);
  }
}
