import 'package:flutter/material.dart';
import 'package:vv_oa/constant/colors.dart';
import 'package:vv_oa/page/home_message/home_message_page.dart';
import 'package:vv_oa/page/home_person/home_person_page.dart';
import 'package:vv_oa/page/login/login_page.dart';
import 'package:vv_oa/page/home_work/home_work_page.dart';
import 'package:vv_oa/util/DataUtils.dart';

//主页
class VVOAApp extends StatefulWidget {
  @override
  _VVOAAppState createState() => _VVOAAppState();
}

class _VVOAAppState extends State<VVOAApp>
    with TickerProviderStateMixin {
  int _tabIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  var appBarTitles = ['我的', '工作', '个人中心'];

  var _body;

  initData() {
    _body = IndexedStack(
      children: <Widget>[HomeMessagePage(), HomeWorkPage(), HomePersonInfoPage()],
      index: _tabIndex,
    );
  }


  @override
  void initState() {
    super.initState();
    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: Text(appBarTitles[0]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: Text(appBarTitles[1]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: Text(appBarTitles[2]),
        backgroundColor: Colors.blue,
      ),
    ];
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    initData();

    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
          primaryColor: AppColors.colorPrimary, accentColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            appBarTitles[_tabIndex],
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationViews
              .map((BottomNavigationBarItem navigationView) => navigationView)
              .toList(),
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}
