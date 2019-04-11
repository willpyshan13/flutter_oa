
import 'package:rxdart/rxdart.dart';
import 'package:vv_oa/util/netutils.dart';
import 'package:vv_oa/http/api.dart';

class VVModelService{

  Observable<dynamic> login(Map<String,dynamic> params)=> post(Api.LOGIN,params);

  Observable<dynamic> getFlowOverview()=> get(Api.FLOW_OVERVIEW);

}