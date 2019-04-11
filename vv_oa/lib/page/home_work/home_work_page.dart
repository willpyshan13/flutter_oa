import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/constant/work_item.dart';
import 'package:vv_oa/page/home_work/work_finance_card.dart';
import 'package:vv_oa/page/home_work/work_management_card.dart';
import 'package:vv_oa/page/home_work/work_attendance_card.dart';
import 'package:vv_oa/page/login/login_page.dart';
import 'package:vv_oa/util/DataUtils.dart';
//工作
class HomeWorkPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWorkPageState();
  }
}

class HomeWorkPageState extends State<HomeWorkPage> {

  @override
  void initState() {
    super.initState();
//    _getTree();
  }

  _checkLogin(){
    DataUtils.getIsLogin().then((isLogin) {
      if (!isLogin) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return LoginPage("VVOA");
        }));
      } else {
        print('已登录!');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
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
        ));
  }
  }

    ListTile buildItem(index) {
          return ListTile(
            title:  Text(WorkItem.workItem[index].toString()), // item 标题
            leading: Icon(Icons.access_time), // item 前置图标
            trailing: Icon(Icons.keyboard_arrow_right),// item 后置图标
            isThreeLine:false,  // item 是否三行显示
            dense:true,                // item 直观感受是整体大小
            contentPadding: EdgeInsets.all(10.0),// item 内容内边距
            enabled:true,
            onTap:(){print('点击:$index');},// item onTap 点击事件
            onLongPress:(){print('长按:$index');},// item onLongPress 长按事件
            selected:false,     // item 是否选中状态
          );

  }
