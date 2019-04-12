
import 'package:rxdart/rxdart.dart';
import 'package:vv_oa/util/netutils.dart';
import 'package:vv_oa/http/api.dart';

///网络服务
class VVModelService{

  ///登录服务
  Observable<dynamic> login(Map<String,dynamic> params)=> post(Api.login,params);

  ///获取我的事物
  Observable<dynamic> getFlowOverview()=> get(Api.flowOverview);

  ///获取当前用户权限
  Observable<dynamic> getCurrentUser()=> postNoParams(Api.currentUser);

  ///提交加班申请
  Observable<dynamic> postExtraWork(String params)=> posWithData(Api.startFlowExtraWorkBill,params);
}