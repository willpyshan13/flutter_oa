import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/constant/work_item.dart';
import 'package:vv_oa/entity/flow_overview_entity.dart';

///审批详情
class AttendanceOvertimeDetailPage extends StatefulWidget {
  final FlowOverviewRow flowOverviewRow;

  AttendanceOvertimeDetailPage(this.flowOverviewRow);

  @override
  State<StatefulWidget> createState() {
    return _AttendanceOvertimeDetailPageState();
  }
}

class _AttendanceOvertimeDetailPageState extends State<AttendanceOvertimeDetailPage> {

  @override
  Widget build(BuildContext context) {
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
                  widget.flowOverviewRow.createTime,
                  softWrap: true,
                  style: _styleDark,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
//          Container(
//            color: GlobalConfig.cardBackgroundColor,
//            child: Row(
//              children: <Widget>[
//                Container(child: Text(
//                  GlobalConfig.commonEndTime,
//                  softWrap: true,
//                  style: _styleGray,
//                  textAlign: TextAlign.right,
//                ),
//                  width: _leftWidth,
//                ),
//                SizedBox(width: 5,),
//                Text(
//                  widget.flowOverviewRow.updateTime,
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
                  GlobalConfig.commonTotalTime,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  widget.flowOverviewRow.summary,
                  softWrap: true,
                  style: _styleDark,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
//          Container(
//            color: GlobalConfig.cardBackgroundColor,
//            child: Row(
//              children: <Widget>[
//                Container(child: Text(
//                  GlobalConfig.commonOvertimeReason,
//                  softWrap: true,
//                  style: _styleGray,
//                  textAlign: TextAlign.right,
//                ),
//                  width: _leftWidth,
//                ),
//                SizedBox(width: 5,),
//                Text(
//                  'sss',
//                  softWrap: true,
//                  style: _styleDark,
//                  textAlign: TextAlign.left,
//                )
//              ],
//            ),
//          ),
        ],
      ),
    );
  }
}
