import 'dart:convert';

import 'package:vv_oa/http/modules.dart';
import 'package:vv_oa/entity/user.dart';
import 'package:vv_oa/model/vv_model_service.dart';
import 'package:rxdart/rxdart.dart';

class VVModelRepository {
  final VVModelService _remote;

  VVModelRepository(this._remote);

  Observable login(String username, String password) {
//    token = "basic " + base64Encode(utf8.encode('$username:$password'));
    User user = new User(password,username);
    return _remote.login(user.toJson());
  }

  Observable getFlowOverview(String tokens) {
    token = "Bearer "+tokens;
    return _remote.getFlowOverview();
  }
}
