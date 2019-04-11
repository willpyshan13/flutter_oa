import 'package:flutter/material.dart';
import 'package:vv_oa/constant/shared_preferences_keys.dart';
import 'package:vv_oa/page/login/login_page.dart';
import 'package:vv_oa/page/vv_oa_page.dart';
import 'package:vv_oa/http/app_module.dart';
import 'package:dartin/dartin.dart';
import 'package:vv_oa/util/DataUtils.dart';

const int ThemeColor = 0xFFC91B3A;
DataUtils sp;

Future main() async {
  /// DartIn start
  startDartIn(appModule);
  sp = await DataUtils.getInstance();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  showLoginPage() {
//    return VVOAApp();
     //判断是否登录，没有登录就跳转登录页面
    bool isLogin = sp.getBool(SharedPreferencesKeys.isLogin);
    if (isLogin == null || isLogin == true) {
      return VVOAApp();
    } else {
      return LoginPage("VVOA");
    }
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(
          body: showLoginPage()
      ),
    );
  }
}
