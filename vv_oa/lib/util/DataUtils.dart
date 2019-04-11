import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

///数据保存工具，用于保存用户信息，鱼配置信息
///@author pengyushan
///@createTime 2019-4-11
class DataUtils {
  static const String isLogin = "isLogin";
  static const String username = "userName";
  static const String passWord = "password";
  static const String token = "token";
  static const String currentAuthority = "currentAuthority";

  // 保存用户登录信息，data中包含了userName
  static Future saveLoginInfo(String userName,String password,String tokens,String authority) async {
    print('isLogin');
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(username, userName);
    await sp.setString(passWord, password);
    await sp.setString(token, tokens);
    await sp.setString(currentAuthority, authority);
    await sp.setBool(isLogin, true);

  }

  static Future clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print('clean');
    return sp.clear();
  }

  static Future<String> getUserName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(username);
  }

  static Future<String> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(token);
  }

  static Future<String> getPassword() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(passWord);
  }

  static Future<bool> getIsLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool b = sp.getBool(isLogin);
    return true == b;
  }
}
