import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/viewmodel/attendance_statistics_provider.dart';

///外出页面
///@author pengyushan
///@createTime 2019-4-16
class AttendanceStatisticsPage extends PageProvideNode {
  AttendanceStatisticsPage() {
    mProviders.provideValue(inject<AttendanceStatisticsProvider>());
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _AttendanceStatisticsPage();
  }
}

///考勤统计
class _AttendanceStatisticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AttendanceStatisticsPageState();
  }
}

class AttendanceStatisticsPageState extends State<_AttendanceStatisticsPage> {

  AttendanceStatisticsProvider _attendanceStatisticsProvider;

  void findBySearchEmployCountOne() {
    final currentUser = _attendanceStatisticsProvider
        .findBySearchEmployCountOne(1)
        .listen((t) {

    }, onError: (e) {
      //error
      dispatchFailure(context, e);
    });
    _attendanceStatisticsProvider.plus(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    _attendanceStatisticsProvider = Provide.value<AttendanceStatisticsProvider>(context);
    findBySearchEmployCountOne();
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
                ''),
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
