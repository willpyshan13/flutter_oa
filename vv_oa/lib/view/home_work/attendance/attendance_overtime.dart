import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_widget.dart';

///加班
class AttendanceOvertimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AttendanceOvertimePageState();
  }
}

class _AttendanceOvertimePageState extends State<AttendanceOvertimePage> {
  DateTime _startDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();

  DateTime _endDate = DateTime.now();
  TimeOfDay _endTime = TimeOfDay.now();

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
