import 'dart:io';

import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/constant/v_http_status.dart';
import 'package:vv_oa/entity/start_gout_bill_entity.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/util/toast.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vv_oa/viewmodel/attendance_outing_provider.dart';

///外出页面
///@author pengyushan
///@createTime 2019-4-16
class AttendanceOutingPage extends PageProvideNode {
  AttendanceOutingPage() {
    mProviders.provideValue(inject<AttendanceOutingProvider>());
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _AttendanceOutingPage();
  }
}

///外出
class _AttendanceOutingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AttendanceOutingPageState();
  }
}

///外出申请状态
class _AttendanceOutingPageState extends State<_AttendanceOutingPage> {
  FocusNode _focusNodeTime = new FocusNode();
  FocusNode _focusNodeReason = new FocusNode();
  AttendanceOutingProvider _attendanceOutingProvider;
  StartGoutBillEntity _goutBillEntity;
  TextEditingController _outingReasonController = TextEditingController(text: 'hello');
  TextEditingController _inputTimeCount = TextEditingController(text: '');
  DateTime _startDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();

  DateTime _endDate = DateTime.now();
  TimeOfDay _endTime = TimeOfDay.now();

  ///选择日期
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

  ///选择时间
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

  ///打开图库选择
  Future _imageFile;
  _selectedImage() async {
    ///
    var imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = imageFile;
    });
  }

  ///拍照
  _takeImage() async {
    ///
    _imageFile = ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {

    });
  }

  ///申请外出
  void _startGoutBill() {
    _goutBillEntity = StartGoutBillEntity(goutReason: _outingReasonController.text,goutEndTime: '${_endDate.year}-${_endDate.month}-${_endDate.day} ${_endTime.hour}:${_endTime.minute}:00',goutHours: 3,goutStartTime: '${_startDate.year}-${_startDate.month}-${_startDate.day} ${_startTime.hour}:${_startTime.minute}:00');
    final currentUser = _attendanceOutingProvider
        .startGoutBill(_goutBillEntity)
        .listen((t) {
          Toast.show(_attendanceOutingProvider.commonResponse.message, context);
          if(_attendanceOutingProvider.commonResponse.code == VHttpStatus.statusOk){
            Navigator.pop(context);
          }
    }, onError: (e) {
      //error
      dispatchFailure(context, e);
    });
    _attendanceOutingProvider.plus(currentUser);
  }

  ///生成图片选择控件
  ///暂时不需要
  Widget _previewImage() {
    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return new ClipRect(
              child: SizedBox(
                  width: 70.0,
                  height: 150.0,
                  child: Image.file(snapshot.data, fit: BoxFit.cover)
              ),
            );
          } else {
            return new Image.asset("images/ic_launcher_round.png", height: 0.0, width: 0.0);
          }
        });
  }
  @override
  Widget build(BuildContext context) {
    _attendanceOutingProvider = Provide.value<AttendanceOutingProvider>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(GlobalConfig.vWorkOuting),
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
          TextField(
            focusNode: _focusNodeTime,
            keyboardType: TextInputType.number,
            maxLength: 5,
            controller: _inputTimeCount,
            decoration: InputDecoration(
              helperText: GlobalConfig.commonInputTime,
            ),
          ),
//          getContainerText(context, GlobalConfig.commonInputTimeAuto),
          SizedBox(
            height: 1,
          ),
          Container(
            color: GlobalConfig.cardBackgroundColor,
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
              children: <Widget>[
                Text(GlobalConfig.commonOutReason,
                    style: TextStyle(
                        fontSize: 15.5, height: 1.2, color: Colors.blue),
                    textAlign: TextAlign.left),
                TextField(
                  focusNode: _focusNodeReason,
                  controller: _outingReasonController,
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  maxLength: 70,
                  decoration: InputDecoration(
                    helperText: GlobalConfig.commonLeaveReasonInput,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ///选择图片控件暂时不用添加
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
//            children: <Widget>[
//              FlatButton(
//                  onPressed: () => {_selectedImage()},
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
//                    children: <Widget>[
//                      Text(GlobalConfig.commonImageText,
//                          style: TextStyle(
//                              fontSize: 15.5, height: 1.2, color: Colors.blue),
//                          textAlign: TextAlign.left),
//                      new Container(
//                        margin: const EdgeInsets.only(bottom: 6.0),
//                        child: new CircleAvatar(
//                          radius: 20.0,
//                          child: new Icon(Icons.add, color: Colors.white),
//                          backgroundColor: Colors.grey,
//                        ),
//                      ),
//                    ],
//                  )),
//            ],
//          ),
//          _previewImage(),
          MaterialButton(
            onPressed: () {
              _startGoutBill();
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
