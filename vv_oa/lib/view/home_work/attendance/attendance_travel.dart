import 'package:dartin/dartin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/constant/v_http_status.dart';
import 'package:vv_oa/entity/travel_entity.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/util/toast.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/viewmodel/attendance_travel_provider.dart';

const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;

///加班页面
///@author pengyushan
///@createTime 2019-4-12
class AttendanceTravelPage extends PageProvideNode {
  AttendanceTravelPage() {
    mProviders.provideValue(inject<AttendanceTravelProvider>());
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _AttendanceTravelTimePage();
  }
}

///出差页面
class _AttendanceTravelTimePage extends StatefulWidget {
  static const String routeName = '/cupertino/picker';

  @override
  _AttendanceTravelState createState() => _AttendanceTravelState();
}

class _AttendanceTravelState extends State<_AttendanceTravelTimePage> {
  AttendanceTravelProvider _attendanceTravelProvider;
  int _selectedColorIndex = 0;

  Duration timer = const Duration();

  DateTime _dateTimeStart = DateTime.now();

  DateTime _dateTimeEnd = DateTime.now();

  ///弹出底部ios风格按钮
  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  ///弹出开始时间选择框
  Widget _buildStartDateAndTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: _dateTimeStart,
                onDateTimeChanged: (DateTime newDateTime) {
                  if (mounted) {
                    setState(() => _dateTimeStart = newDateTime);
                  }
                },
              ),
            );
          },
        );
      },
      child: Text(
        DateFormat('yyyy-MM-dd').add_jm().format(_dateTimeStart),
        softWrap: true,
        style: TextStyle(color: Theme.of(context).accentColor),
        textAlign: TextAlign.left,
      ),
    );
  }

  ///弹出结束时间选择框
  Widget _buildEndDateAndTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: _dateTimeEnd,
                onDateTimeChanged: (DateTime newDateTime) {
                  if (mounted) {
                    setState(() => _dateTimeEnd = newDateTime);
                  }
                },
              ),
            );
          },
        );
      },
      child: Text(
        DateFormat('yyyy-MM-dd').add_jm().format(_dateTimeEnd),
        softWrap: true,
        style: TextStyle(color: Theme.of(context).accentColor),
        textAlign: TextAlign.left,
      ),
    );
  }

  ///获取抄送人，目前有获取，没有显示内容，后台会自动添加抄送人
  void _startFlowBusyTripBill() {
    final currentUser =
        _attendanceTravelProvider.startFlowBusyTripBill().listen((t) {
      Toast.show(_attendanceTravelProvider.commonResponse.message, context);
      if (_attendanceTravelProvider.commonResponse.code ==
          VHttpStatus.statusOk) {
        Navigator.pop(context);
      }
    }, onError: (e) {
      //error
      dispatchFailure(context, e);
    });
    _attendanceTravelProvider.plus(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    _attendanceTravelProvider =
        Provide.value<AttendanceTravelProvider>(context);
    _startFlowBusyTripBill();
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
              middle: const Text('出差'), previousPageTitle: '返回'),
          child: DefaultTextStyle(
            style: TextStyle(),
            child: DecoratedBox(
              decoration: BoxDecoration(color: CupertinoColors.white),
              child: ListView(
                children: <Widget>[
                  const Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 10)),
                  Container(
                    color: GlobalConfig.cardBackgroundColor,
                    child: Container(
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
                          _buildStartDateAndTimePicker(context),
                          Icon(
                            Icons.chevron_right,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: GlobalConfig.cardBackgroundColor,
                    child: Container(
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
                          _buildEndDateAndTimePicker(context),
                          Icon(
                            Icons.chevron_right,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
