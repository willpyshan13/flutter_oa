import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/constant/work_item.dart';
import 'package:vv_oa/entity/flow_overview_entity.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/viewmodel/overtime_detail_provider.dart';

///加班详情页面
///@author pengyushan
///@createTime 2019-4-16
class AttendanceOvertimeDetailPage extends PageProvideNode {
  final FlowOverviewRow flowOverviewRow;
  AttendanceOvertimeDetailPage(this.flowOverviewRow) {
    mProviders.provideValue(inject<OverTimeDetailProvider>());
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _AttendanceOvertimeDetailPage(flowOverviewRow);
  }
}


///审批详情
class _AttendanceOvertimeDetailPage extends StatefulWidget {
  final FlowOverviewRow flowOverviewRow;

  _AttendanceOvertimeDetailPage(this.flowOverviewRow);

  @override
  State<StatefulWidget> createState() {
    return _AttendanceOvertimeDetailPageState();
  }
}

class _AttendanceOvertimeDetailPageState extends State<_AttendanceOvertimeDetailPage> {
  OverTimeDetailProvider _overTimeDetailProvider;

  ///获取加班详细信息
  void getFlowOverviewInfo(int id) {
    final currentUser = _overTimeDetailProvider
        .getFlowOverviewInfo(id)
        .listen((t) {
          setState(() {});
    }, onError: (e) {
      //error
      dispatchFailure(context, e);
    });
    _overTimeDetailProvider.plus(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    _overTimeDetailProvider = Provide.value<OverTimeDetailProvider>(context);
    if(_overTimeDetailProvider.overtimeDetailEntity==null){
      getFlowOverviewInfo(widget.flowOverviewRow.id);
    }

    TextStyle _styleGray = TextStyle(color: Colors.grey,fontSize: 15);
    TextStyle _styleDark = TextStyle(color: Colors.black,fontSize: 15);
    double _leftWidth = 90.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalConfig.vWorkOvertime),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        children: <Widget>[
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/ic_launcher_round.png',
                  width: _leftWidth,
                  height: _leftWidth,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[Text(
                    widget.flowOverviewRow.title,
                    softWrap: true,
                    style: TextStyle(color: Colors.black,fontSize: 20),
                    textAlign: TextAlign.left,
                  ),Text(
                    int.parse(widget.flowOverviewRow.status)>=0?WorkItem.flowOverviewStatus[int.parse(widget.flowOverviewRow.status)]:WorkItem.flowOverviewStatus[2],
                    softWrap: true,
                    style: TextStyle(color: Colors.green,fontSize: 18),
                    textAlign: TextAlign.left,
                  )],
                ),

              ],
            ),
          ),
//          Container(
//            color: GlobalConfig.cardBackgroundColor,
//            child: Row(
//              children: <Widget>[
//                Container(child: Text(
//                  GlobalConfig.commonDepartmentNo,
//                  softWrap: true,
//                  style: _styleGray,
//                  textAlign: TextAlign.right,
//                ),
//                  width: _leftWidth,
//                ),
//                SizedBox(width: 5,),
//                Text(
//                  widget.flowOverviewRow.summary,
//                  softWrap: true,
//                  style: _styleDark,
//                  textAlign: TextAlign.left,
//                )
//              ],
//            ),
//          ),
//          Container(
//            color: GlobalConfig.cardBackgroundColor,
//            child: Row(
//              children: <Widget>[
//                Container(child: Text(
//                  GlobalConfig.commonDepartment,
//                  softWrap: true,
//                  style: _styleGray,
//                  textAlign: TextAlign.right,
//                ),
//                  width: _leftWidth,
//                ),
//                SizedBox(width: 5,),
//                Text(
//                  widget.flowOverviewRow.processInstanceId,
//                  softWrap: true,
//                  style: _styleDark,
//                  textAlign: TextAlign.left,
//                )
//              ],
//            ),
//          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: Row(
              children: <Widget>[
                Container(child: Text(
                  GlobalConfig.commonStartTime,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  _overTimeDetailProvider.overtimeDetailEntity==null?'':_overTimeDetailProvider.overtimeDetailEntity.extraWorkStartTime,
                  softWrap: true,
                  style: _styleDark,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: Row(
              children: <Widget>[
                Container(child: Text(
                  GlobalConfig.commonEndTime,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  _overTimeDetailProvider.overtimeDetailEntity==null?'':_overTimeDetailProvider.overtimeDetailEntity.extraWorkEndTime,
                  softWrap: true,
                  style: _styleDark,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: Row(
              children: <Widget>[
                Container(child: Text(
                  GlobalConfig.commonTotalTime,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  _overTimeDetailProvider.overtimeDetailEntity==null?'':_overTimeDetailProvider.overtimeDetailEntity.extraWorkHours,
                  softWrap: true,
                  style: _styleDark,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: Row(
              children: <Widget>[
                Container(child: Text(
                  GlobalConfig.commonOvertimeReason,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  _overTimeDetailProvider.overtimeDetailEntity==null?'':_overTimeDetailProvider.overtimeDetailEntity.extraWorkReason,
                  softWrap: true,
                  style: _styleDark,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
