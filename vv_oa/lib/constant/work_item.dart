class WorkItem{
  static const Map<int,String> workItem = {
    0:"考勤统计",
    1:"签到",
    2:"请假",
    3:"补卡申请",
    4:"外出",
    5:"加班",
    6:"付款申请",
  };

  ///审批状态
  static const List<String> flowOverviewStatus = ['审批中',"审批成功", "审批失败"];

  ///我的流程item，第一个占位用
  static const List<String> flowOverviewType = ['',"请假",
  "加班",
  "外出",
  "出差",];
}