class VHttpStatus {

  ///请求成功
  static final int statusOk = 10000;

  ///登陆信息失效
  static final int statusCheckUserFailure = 20002;
  ///外出时间冲突
  static final int attendanceOutingFailure = 50012;
  ///请假
  static final int extraWorkTypeLeave = 1;
  ///加班
  static final int extraWorkTypeOverTime = 2;
  ///外出
  static final int extraWorkTypeOuting = 3;
  ///出差
  static final int extraWorkTypeTravel = 4;

  static final String extraWorkTypeParams = 'billType';

  ///抄送人中的参数名
  static final String assigneeAndCopyListAmount = 'amount';

  ///加班详情，id参数
  static final String flowOverviewInfoId = 'id';

}