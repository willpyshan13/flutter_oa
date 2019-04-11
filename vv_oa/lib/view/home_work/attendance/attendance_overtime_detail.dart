import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_widget.dart';

///加班
class AttendanceOvertimeDetailPage extends StatefulWidget {
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
                    '彭榆杉',
                    softWrap: true,
                    style: TextStyle(color: Colors.black,fontSize: 20),
                    textAlign: TextAlign.left,
                  ),Text(
                    '等待审核',
                    softWrap: true,
                    style: TextStyle(color: Colors.yellow,fontSize: 18),
                    textAlign: TextAlign.left,
                  )],
                ),

              ],
            ),
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: Row(
              children: <Widget>[
                Container(child: Text(
                  GlobalConfig.commonDepartmentNo,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  'sss',
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
                  GlobalConfig.commonDepartment,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  'sss',
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
                  GlobalConfig.commonStartTime,
                  softWrap: true,
                  style: _styleGray,
                  textAlign: TextAlign.right,
                ),
                  width: _leftWidth,
                ),
                SizedBox(width: 5,),
                Text(
                  'sss',
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
                  'sss',
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
                  'sss',
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
                  'sss',
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
