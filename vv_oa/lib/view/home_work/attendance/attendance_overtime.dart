import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/constant/v_http_status.dart';
import 'package:vv_oa/entity/extra_work_entity.dart';
import 'package:vv_oa/util/PageRouteUtils.dart';
import 'package:vv_oa/util/toast.dart';
import 'package:vv_oa/util/widgetutils.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_overtime_detail.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_widget.dart';
import 'package:vv_oa/viewmodel/overtime_provider.dart';

///加班页面
///@author pengyushan
///@createTime 2019-4-12
class AttendanceOvertimePage extends PageProvideNode {
  AttendanceOvertimePage() {
    mProviders.provideValue(inject<OvertimeProvider>());
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _AttendanceOvertimePage();
  }
}

class _AttendanceOvertimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AttendanceOvertimePageState();
  }
}

class _AttendanceOvertimePageState extends State<_AttendanceOvertimePage> {
  OvertimeProvider _overtimeViewModel;
  ExtraWorkEntity _extraWorkEntity;
  TextEditingController _nameController = TextEditingController(text: '020');
  TextEditingController _passwordController = TextEditingController(text: '123456');
  DateTime _startDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();

  DateTime _endDate = DateTime.now();
  TimeOfDay _endTime = TimeOfDay.now();

  ///选择日期对话框，目前使用的是安卓样式，需要改成ios样式
  Future<void> _selectDate(BuildContext context, int type) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _startDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _startDate)
      print("data selectied :${_startDate.toString()}");
      _selectTime(context, type);
      setState(() {
        if (type == 0) {
           _startDate = picked;
        } else {
           _endDate = picked;
        }
    });

    if (picked == null) _startDate = DateTime.now();
  }

  ///生成请求体，提交加班
  ExtraWorkEntity getExtraWorkEntity() {
    List<String> copyToList = List();
    copyToList.add("1115800549863620608");
    _extraWorkEntity = ExtraWorkEntity(copyTo:copyToList,extraWorkType:1,extraWorkReason:'ddd',
        extraWorkEndTime:'2019-04-14 16:18:00',extraWorkStartTime:'2019-04-13 16:18:00',extraWorkHours:24);
    return _extraWorkEntity;
  }

  ///提交加班申请
  ///listen 处理返回结果
  /// onError 处理错误消息
  void _postExtraWork() {
    final currentUser = _overtimeViewModel
        .postExtraWork(getExtraWorkEntity())
        .listen((t) {
      if(_overtimeViewModel.commonResponse!=null){
        if(_overtimeViewModel.commonResponse.code==VHttpStatus.statusOk){
          routePagerAndReplace(context, new AttendanceOvertimeDetailPage());
        }
        Toast.show(_overtimeViewModel.commonResponse.message, context, type: Toast.SUCCESS);
      }

    }, onError: (e) {
      //error
      dispatchFailure(context, e);
    });
    _overtimeViewModel.plus(currentUser);
  }

  ///选择时间对话框，目前使用的是安卓样式，需要改成ios样式
  Future<void> _selectTime(BuildContext context, int type) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _startTime);
    if (picked != null && picked != _startTime)
      print("data selectied :${_startTime.toString()}");
    setState(() {
      if (type == 0) {
        _startTime = picked;
      } else {
        _endTime = picked;
      }
    });
    if (picked == null) _startTime = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    _overtimeViewModel = Provide.value<OvertimeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalConfig.vWorkOvertime),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        children: <Widget>[
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: new FlatButton(
                onPressed: () {
                  _selectDate(context, 0);
                },
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red)),
                              TextSpan(
                                  text: GlobalConfig.commonStartTime,
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '${_startDate.year}-${_startDate.month}-${_startDate.day} ${_startTime.hour}:${_startTime.minute}',
                        softWrap: true,
                        style: TextStyle(color: Theme.of(context).accentColor),
                        textAlign: TextAlign.left,
                      ),
                      Icon(
                        Icons.chevron_right,
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: new FlatButton(
                onPressed: () {
                  _selectDate(context, 1);
                },
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red)),
                              TextSpan(
                                  text: GlobalConfig.commonEndTime,
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '${_endDate.year}-${_endDate.month}-${_endDate.day} ${_endTime.hour}:${_endTime.minute}',
                        softWrap: true,
                        style: TextStyle(color: Theme.of(context).accentColor),
                        textAlign: TextAlign.left,
                      ),
                      Icon(
                        Icons.chevron_right,
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            child: new FlatButton(
                onPressed: () {
//            _handleOnItemCollect(widget.itemData);
                },
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red)),
                              TextSpan(
                                  text: GlobalConfig.commonTotalTime,
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        GlobalConfig.commonInputTime,
                        softWrap: true,
                        style: TextStyle(color: Theme.of(context).accentColor),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                )),
          ),
          getContainerText(context, GlobalConfig.commonInputTimeAuto),
          SizedBox(
            height: 1,
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
              children: <Widget>[
                Text(GlobalConfig.vWorkOvertime,
                    style: TextStyle(
                        fontSize: 15.5, height: 1.2, color: Colors.blue),
                    textAlign: TextAlign.left),
                TextField(
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  decoration: InputDecoration(
                    helperText: GlobalConfig.commonLeaveReasonInput,
                  ),
                )
              ],
            ),
          ),
          new MaterialButton(
            onPressed: () {
              _postExtraWork();
            },
            child: Text("提交", style: TextStyle(color: Colors.white)),
            // 按钮颜色
            color: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
