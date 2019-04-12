import 'package:flutter/material.dart';
import 'package:vv_oa/constant/colors.dart';
import 'package:vv_oa/view/login/login_page.dart';
import 'package:vv_oa/view/vv_oa_page.dart';
import 'package:vv_oa/http/app_module.dart';
import 'package:vv_oa/util/DataUtils.dart';

DataUtils sp;

main() async {
  /// DartIn start
  await init();
  sp = await DataUtils.getInstance();
  runApp(new MyApp());
}


///程序主入口
class MyApp extends StatelessWidget {
  showLoginPage() {
     //判断是否登录，没有登录就跳转登录页面
    bool isLogin = sp.getBool(DataUtils.isLogin);
    if (isLogin == null||(isLogin!=null&&!isLogin)) {
      return LoginPage("VVOA");
    } else {
      return VVOAApp();
    }

  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primaryColor: Color(AppColors.appThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(AppColors.appThemeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(
          body: showLoginPage()
      ),
    );
  }
}
