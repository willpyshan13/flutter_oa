import 'dart:convert';

import 'package:vv_oa/http/dio_http_modules.dart';
import 'package:vv_oa/entity/user.dart';
import 'package:vv_oa/model/vv_model_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vv_oa/util/DataUtils.dart';

///网络库
class VVModelRepository {
  final VVModelService _remote;

  VVModelRepository(this._remote,this._sp);

  final DataUtils _sp;

  Observable login(String username, String password) {
//    token = "basic " + base64Encode(utf8.encode('$username:$password'));
    User user = new User(password,username);
    return _remote.login(user.toJson());
  }

  Observable getFlowOverview() {
    if(_sp!=null){
      token = "Bearer "+_sp.getString(DataUtils.token);
    }
    return _remote.getFlowOverview();
  }

  Observable getCurrentUser() {
    if(_sp!=null){
      token = "Bearer "+_sp.getString(DataUtils.token);
    }
    return _remote.getCurrentUser();
  }
}
