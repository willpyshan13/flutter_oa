import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_widget.dart';
import 'package:vv_oa/view/webview/article_detail_page.dart';

///请假页面
class AttendanceLeavePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AttendanceLeavePageState();
  }
}

class _AttendanceLeavePageState extends State<AttendanceLeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(GlobalConfig.vWorkLeave),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        children: <Widget>[
          getAttendanceTextItem(context, GlobalConfig.vWorkLeave),
          new Container(
            margin: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
            child: new Text(
              GlobalConfig.workVacationBalance,
              softWrap: true,
              style: TextStyle(color: Theme.of(context).accentColor),
              textAlign: TextAlign.left,
            ),
          ),
          getAttendanceTextItem(context, GlobalConfig.commonStartTime),
          getAttendanceTextItem(context, GlobalConfig.commonEndTime),
          getAttendanceTextItemNoIcon(context, GlobalConfig.commonTotalTime,
              GlobalConfig.commonInputTime),
          getContainerText(context, GlobalConfig.commonInputTimeAuto),
          SizedBox(height: 10.0),
          getTextField(context, GlobalConfig.commonLeaveReason),
          SizedBox(height: 10.0),
          getImagePicker(context),
          new MaterialButton(
            onPressed: () {},
            child: Text("提交",style: TextStyle(color: Colors.white)),
            // 按钮颜色
            color: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
