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

  ///交通工具（1：飞机；2；火车；3：汽车；4：其他）
  static const Map<int,String> travelTransportationType = {
    1:"飞机",
    2:"火车",
    3:"汽车",
    4:"其他",
  };

  ///时间类别（1：上午；2：下午）
  static const Map<int,String> travelDayType = {
    1:"上午",
    2:"下午",
  };

  ///行程类别（1：单程；2：往返）
  static const Map<int,String> travelStrokeType = {
    1:"单程",
    2:"往返",
  };

  ///审批状态
  static const List<String> flowOverviewStatus = ['审批中',"审批成功", "审批失败"];

  ///我的流程item，第一个占位用
  static const List<String> flowOverviewType = ['',"请假",
  "加班",
  "外出",
  "出差",];
}