
import 'package:rxdart/rxdart.dart';
import 'package:vv_oa/http/dio_http_utils.dart';
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

  ///获取抄送人
  Observable<dynamic> findByBillType(Map<String,dynamic> param)=> get(Api.findByBillType,params:param);

  ///获取抄送人,通用
  Observable<dynamic> getAssigneeAndCopyList(Map<String,dynamic> param)=> get(Api.getAssigneeAndCopyList,params:param);

  ///获取加班具体信息
  Observable<dynamic> getFlowOverviewInfo(String param)=> postNoParams(Api.getFlowOverviewInfo+param);

  ///查询考勤统计记录
  Observable<dynamic> findBySearchEmployCountOne(Map<String,dynamic> param)=> post(Api.findBySearchEmployCountOne,param);

  ///发起一个新的外出申请
  Observable<dynamic> startGoutBill(String params)=> posWithData(Api.startGoutBill,params);

  ///发起一个新的出差申请
  Observable<dynamic> startFlowBusyTripBill(String params)=> posWithData(Api.startFlowBusyTripBill,params);
}