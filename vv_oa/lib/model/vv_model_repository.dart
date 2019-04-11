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

  Observable getFlowOverview() {
    token = "Bearer "+"eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMDk4NDExMDE0NDUwNzQ1MzQ0Iiwic3ViIjoiMjLmnJ3ml6UyMiIsImlhdCI6MTU1NDgwMDIyMCwiY29tcGFueUlkIjoiMSIsIndvcmtOdW1iZXIiOiIwOTciLCJjb21wYW55TmFtZSI6IuWOpumXqOWIhuWFrOWPuCIsImlkIjoiMTA5ODQxMTAxNDQ1MDc0NTM0NCIsImV4cCI6MTU1ODQwMDIyMH0.Yo2CrhRkeQ9XxsOLVnB65l5Y7A-RjG5HuOUyXm1V700";
    return _remote.getFlowOverview();
  }
}
