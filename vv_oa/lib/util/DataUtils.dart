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

  static SharedPreferences _spf;

  DataUtils._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static DataUtils _instance;
  static Future<DataUtils> get instance async {
    return await getInstance();
  }


  Future<bool> putString(String key, String value) {
    if (_beforeCheck()) return null;
    return _spf.setString(key, value);
  }

  bool getBool(String key) {
    if (_beforeCheck()) return null;
    return _spf.getBool(key);
  }

  Future<bool> putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _spf.setBool(key, value);
  }

  int getInt(String key) {
    if (_beforeCheck()) return null;
    return _spf.getInt(key);
  }


  getString(String key) {
    if (_beforeCheck()) return null;
    return _spf.getString(key);
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  static Future<DataUtils> getInstance() async  {
    if (_instance == null) {
      _instance = new DataUtils._();
      await _instance._init();

    }
    return _instance;
  }
}
