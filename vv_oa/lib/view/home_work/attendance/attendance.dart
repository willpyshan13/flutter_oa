import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/view/webview/article_detail_page.dart';

///考勤打卡页面
class AttendancePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AttendancePageState();
  }
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    Widget icon = Image.asset(
      'images/ic_launcher_round.png',
      width: 100.0,
      height: 100.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalConfig.workAttendance),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        children: <Widget>[
          icon,
          ListTile(
              title: const Text('关于我们'),
              subtitle: const Text(
                  '微微科技'),
              trailing: Icon(Icons.chevron_right,
                  color: Theme.of(context).accentColor),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ArticleDetailPage(
                    title: '微科技 微生活',
                    url: 'http://vv.cn/',
                  );
                }));
              }),
        ],
      ),
    );
  }
}
