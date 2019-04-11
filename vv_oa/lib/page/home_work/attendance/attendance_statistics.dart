import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/page/webview/article_detail_page.dart';

///考勤统计
class AttendanceStatisticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AttendanceStatisticsPageState();
  }
}

class AttendanceStatisticsPageState extends State<AttendanceStatisticsPage> {
  @override
  Widget build(BuildContext context) {
    Widget icon = Image.asset(
      'images/ic_launcher_round.png',
      width: 100.0,
      height: 100.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalConfig.workAttendanceStatistics),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        children: <Widget>[
          ListTile(
              title: const Text('出勤天数'),
            subtitle: const Text(
                '3天'),
              trailing: Icon(Icons.chevron_right,
                  color: Theme.of(context).accentColor),
              ),
          ListTile(
            title: const Text('出勤班次'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),
          ListTile(
            title: const Text('休息天数'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),
          ListTile(
            title: const Text('迟到'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),
          ListTile(
            title: const Text('早退'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),
          ListTile(
            title: const Text('缺卡'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),ListTile(
            title: const Text('旷工'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),ListTile(
            title: const Text('外勤'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),ListTile(
            title: const Text('加班'),
            trailing: Icon(Icons.chevron_right,
                color: Theme.of(context).accentColor),
          ),
        ],
      ),
    );
  }
}
