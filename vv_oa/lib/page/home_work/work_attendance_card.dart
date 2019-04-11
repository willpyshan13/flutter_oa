import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/page/home_work/attendance/attendance.dart';
import 'package:vv_oa/page/home_work/attendance/attendance_leave.dart';
import 'package:vv_oa/page/home_work/attendance/attendance_outing.dart';
import 'package:vv_oa/page/home_work/attendance/attendance_overtime.dart';
import 'package:vv_oa/page/home_work/attendance/attendance_statistics.dart';
import 'package:vv_oa/page/home_work/attendance/attendance_supplementary_apply.dart';
import 'package:vv_oa/page/home_work/attendance/attendance_sign.dart';
import 'package:vv_oa/util/PageRouteUtils.dart';

Widget getWorkServiceCard(BuildContext context) {
  return new Container(
    color: GlobalConfig.cardBackgroundColor,
    margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
    padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
    child: new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              GlobalConfig.vWorkTitle,
                              style: new TextStyle(
                                  color: GlobalConfig.fontColor,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePagerNavigator(context, new AttendancePage());
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child:
                                  new Icon(Icons.layers, color: Colors.white),
                              backgroundColor: Colors.green,
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.workAttendance,
                              style: new TextStyle(
                                  color: GlobalConfig.fontColor,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePagerNavigator(context, new AttendanceStatisticsPage());
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.watch, color: Colors.white),
                              backgroundColor: Colors.blue,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.workAttendanceStatistics,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePagerNavigator(context, new AttendanceSignPage());
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.tablet_android,
                                  color: Colors.white),
                              backgroundColor: new Color(0xFFA68F52),
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.vWorkSignIn,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePagerNavigator(context, new AttendanceLeavePage());
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.tv, color: Colors.white),
                              backgroundColor: new Color(0xFF088DB4),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.vWorkLeave,
                              style: new TextStyle(
                                  color: GlobalConfig.fontColor,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePagerNavigator(context, new AttendanceSupplementaryPage());
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.radio, color: Colors.white),
                              backgroundColor: Colors.cyan,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.vWorkSupplementaryApply,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePagerNavigator(context, new AttendanceOutingPage());
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.wifi_tethering,
                                  color: Colors.white),
                              backgroundColor: Colors.brown,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.vWorkOuting,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
                      routePagerNavigator(context, new AttendanceOvertimePage());
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.text_format,
                                  color: Colors.white),
                              backgroundColor: new Color(0xFF355A9B),
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.vWorkOvertime,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
