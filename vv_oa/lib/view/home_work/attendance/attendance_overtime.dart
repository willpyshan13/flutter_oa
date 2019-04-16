import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/constant/v_http_status.dart';
import 'package:vv_oa/entity/extra_work_entity.dart';
import 'package:vv_oa/util/toast.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_widget.dart';
import 'package:vv_oa/viewmodel/overtime_provider.dart';
import 'package:vv_oa/widget/ensure_visible_when_focused.dart';

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
  FocusNode _focusNodeTime = new FocusNode();
  FocusNode _focusNodeReason = new FocusNode();
  OvertimeProvider _overtimeViewModel;
  ExtraWorkEntity _extraWorkEntity;
  TextEditingController _overTimeReason = TextEditingController(text: '');
  TextEditingController _inputTimeCount = TextEditingController(text: '');
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

    if(picked.isBefore(_startDate)){
      Toast.show("结束时间不能小于开始时间", context,type: Toast.ERROR);
    }else {
      _selectTime(context, type);
      setState(() {
        if (type == 0) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
    if (picked == null) _startDate = DateTime.now();
  }

  ///选择时间对话框，目前使用的是安卓样式，需要改成ios样式
  Future<void> _selectTime(BuildContext context, int type) async {
    final TimeOfDay picked =
    await showTimePicker(context: context, initialTime: _startTime);
    if (picked != null && picked != _startTime)
      print("data selectied :${_startTime.toString()}");
    if(_endDate.isAtSameMomentAs(_startDate)&&picked.hour<_startTime.hour){
      Toast.show("结束时间不能小于开始时间", context,type: Toast.ERROR);
    }else {
      setState(() {
        if (type == 0) {
          _startTime = picked;
        } else {
          _endTime = picked;

        }
      });
    }

    if (picked == null) _startTime = TimeOfDay.now();
  }


  ///生成请求体，提交加班
  ExtraWorkEntity getExtraWorkEntity() {
    _extraWorkEntity = ExtraWorkEntity(extraWorkType:1,extraWorkReason:_overTimeReason.text,
        extraWorkEndTime:'${_endDate.year}-${_endDate.month}-${_endDate.day} ${_endTime.hour}:${_endTime.minute}:00',extraWorkStartTime: '${_startDate.year}-${_startDate.month}-${_startDate.day} ${_startTime.hour}:${_startTime.minute}:00',extraWorkHours:int.parse(_inputTimeCount.text));
    return _extraWorkEntity;
  }

  ///判断数据是否正确
  bool checkData(){
    bool flag;
    if(_overTimeReason.text == ''){
      Toast.show(GlobalConfig.commonLeaveReasonInput, context,type: Toast.ERROR);
      flag =  false;
    }else{
      flag= true;
    }

    if(_inputTimeCount.text == ''){
      Toast.show(GlobalConfig.commonSelectTime, context,type: Toast.ERROR);
      flag =  false;
    }else{
      flag= true;
    }

    return flag;
  }

  ///提交加班申请
  ///listen 处理返回结果
  /// onError 处理错误消息
  void _postExtraWork() {
    if(checkData()) {
      final currentUser = _overtimeViewModel
          .postExtraWork(getExtraWorkEntity())
          .listen((t) {
        if (_overtimeViewModel.commonResponse != null) {
          Toast.show(_overtimeViewModel.commonResponse.message, context,
              type: Toast.SUCCESS);
          if (_overtimeViewModel.commonResponse.code == VHttpStatus.statusOk) {
//            routePagerAndReplace(context, new AttendanceOvertimeDetailPage());
              Navigator.pop(context);
          }
        }
      }, onError: (e) {
        //error
        dispatchFailure(context, e);
      });
      _overtimeViewModel.plus(currentUser);
    }
  }

  ///获取抄送人，目前有获取，没有显示内容，后台会自动添加抄送人
  void _findByBillType() {
      final currentUser = _overtimeViewModel
          .getAssigneeAndCopyList(100)
          .listen((t) {

      }, onError: (e) {
        //error
        dispatchFailure(context, e);
      });
      _overtimeViewModel.plus(currentUser);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _overtimeViewModel = Provide.value<OvertimeProvider>(context);
    _findByBillType();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
          getContainerRichText(context, GlobalConfig.commonTotalTime),
          EnsureVisibleWhenFocused(
            focusNode: _focusNodeTime,
            child: TextField(
              focusNode: _focusNodeTime,
              keyboardType: TextInputType.number,
              maxLength: 5,
              controller: _inputTimeCount,
              decoration: InputDecoration(
                helperText: GlobalConfig.commonInputTime,
              ),
            ),
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
                  focusNode: _focusNodeReason,
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  controller: _overTimeReason,
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
