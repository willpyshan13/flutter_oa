class Api {

  ///release url
//  static const String BaseUrl = "http://oa.vv.cn/";
  ///test url
  static const String BaseUrl = "http://172.16.1.122:4001/";

  ///我的流程列表
  static const   String flowOverview = "api/flowOverview";

  ///登录
  static const   String login = "api/login/account";

  ///获取当前用户信息
  static const   String currentUser = "api/currentUser";

  ///请求加班
  static const   String startFlowExtraWorkBill = "api/flowExtraWorkBill/startFlowExtraWorkBill";

  ///获取加班信息
  static const   String getFlowExtraWorkBill = "api/flowExtraWorkBill/findById?api_key=flowOverview";

  ///获取抄送人,需要权限
  static const   String findByBillType = "/api/flowBillCopyToSet/findByBillType";

  ///获取抄送人
  static const   String getAssigneeAndCopyList = "/api/flowBusyTripBill/getAssigneeAndCopyList";
}
