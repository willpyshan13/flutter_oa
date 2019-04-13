import 'dart:convert';

import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/constants.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/event/login_event.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/view/home_work/work_finance_card.dart';
import 'package:vv_oa/view/home_work/work_management_card.dart';
import 'package:vv_oa/view/home_work/work_attendance_card.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/viewmodel/home_work_provider.dart';
///工作页面
///创建一个provider界面，可以对数据进行刷新操作
class HomeWorkPage extends PageProvideNode {

  HomeWorkPage() {
    mProviders.provideValue(inject<HomeWorkProvider>());
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _HomeWorkContentPage();
  }
}

class _HomeWorkContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeWorkPageState();
  }
}

class _HomeWorkPageState extends State<_HomeWorkContentPage> {
  HomeWorkProvider _homeWorkViewModel;
  @override
  void initState() {
    super.initState();
  }

  ///获取当前用户权限，以及用户信息
  void _getCurrentUser() {
    final currentUser = _homeWorkViewModel
        .getCurrentUser()
        .doOnListen(() {})
        .doOnCancel(() {
    }).listen((t) {
      print("======listen======");
      print(_homeWorkViewModel.userInfoEntity.data.permissionList.length);
      DataUtils.saveUserInfo(json.encode(_homeWorkViewModel.userInfoEntity)).then((r) {
        print("======save success======");
        Constants.eventBus.fire(LoginEvent());
      });
      setState(() {

      });
    }, onError: (e) {
      dispatchFailure(context, e);
    });
    _homeWorkViewModel.plus(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    _homeWorkViewModel = Provide.value<HomeWorkProvider>(context);
    if(_homeWorkViewModel.userInfoEntity==null){
       _getCurrentUser();
    }

    return new Scaffold(
        body: new SingleChildScrollView(
          child: new Container(
            color: GlobalConfig.backgroundColor,
            child: new Column(
              children: <Widget>[
                getWorkServiceCard(context),
                getWorkFinanceCard(context),
                getWorkManagementCard(context),
              ],
            ),
          ),
        )
    );
  }
}