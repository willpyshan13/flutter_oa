
import 'package:rxdart/rxdart.dart';
import 'package:vv_oa/util/netutils.dart';
import 'package:vv_oa/http/api.dart';

///网络服务
class VVModelService{

  ///登录服务
  Observable<dynamic> login(Map<String,dynamic> params)=> post(Api.login,params);

  ///
  Observable<dynamic> getFlowOverview()=> get(Api.flowOverview);

  Observable<dynamic> getCurrentUser()=> postNoParams(Api.currentUser);

}