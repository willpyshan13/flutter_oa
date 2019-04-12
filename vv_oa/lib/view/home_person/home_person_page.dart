import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vv_oa/constant/constants.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/entity/user_info_entity.dart';
import 'package:vv_oa/event/login_event.dart';
import 'package:vv_oa/view/about/about_us_page.dart';
import 'package:vv_oa/view/login/login_page.dart';
import 'package:vv_oa/util/DataUtils.dart';

///个人中心界面
class HomePersonInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePersonInfoPageState();
  }
}

///个人中心内部用，不给外部调用
class _HomePersonInfoPageState extends State<HomePersonInfoPage> with WidgetsBindingObserver {
  String userName;
  UserInfoEntity _userInfoEntity;

  @override
  void initState() {
    super.initState();
    _getName();

    Constants.eventBus.on<LoginEvent>().listen((event) {
      _getName();
    });
  }

  void _getName() async {
    DataUtils.getUserNo().then((username) {
      setState(() {
        userName = username;
      });
    });

    DataUtils.getUserInfo().then((info) {
      setState(() {
        if (info != null) {
          _userInfoEntity = UserInfoEntity.fromJson(json.decode(info));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget icon = Image.asset(
      'images/ic_head_img.png',
      width: 80.0,
      height: 80.0,
    );

    TextStyle _styleGray = TextStyle(color: Colors.grey,fontSize: 15);
    TextStyle _styleDark = TextStyle(color: Colors.black,fontSize: 15);
    double _leftWidth = 90.0;
    Widget raisedButton = RaisedButton(
      child: Text(
        userName == null ? "请登录" : "退出登录",
        style: TextStyle(color: Colors.white),
      ),
      color: Theme.of(context).accentColor,
      onPressed: () async {
        await _loginOrLogout(context);
      },
    );

    Widget listAbout = ListTile(
        leading: const Icon(Icons.ac_unit),
        title: const Text('关于我们'),
        trailing:
            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AboutUsPage();
          }));
        });

    Widget listLogout = ListTile(
        leading: const Icon(Icons.info),
        title: const Text('退出登录'),
        trailing:
            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
        onTap: () async {

        });

    return ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      children: <Widget>[
        icon,
        Container(
          color: GlobalConfig.cardBackgroundColor,
          child: Row(
            children: <Widget>[
              Container(child: Text(
                GlobalConfig.commonUsername,
                softWrap: true,
                style: _styleGray,
                textAlign: TextAlign.right,
              ),
                width: _leftWidth,
              ),
              SizedBox(width: 5,),
              Text(
                _userInfoEntity==null?"":_userInfoEntity.data.username,
                softWrap: true,
                style: _styleDark,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        Container(
          color: GlobalConfig.cardBackgroundColor,
          child: Row(
            children: <Widget>[
              Container(child: Text(
                GlobalConfig.commonPhone,
                softWrap: true,
                style: _styleGray,
                textAlign: TextAlign.right,
              ),
                width: _leftWidth,
              ),
              SizedBox(width: 5,),
              Text(
                _userInfoEntity==null?"":_userInfoEntity.data.mobile,
                softWrap: true,
                style: _styleDark,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        Container(
          color: GlobalConfig.cardBackgroundColor,
          child: Row(
            children: <Widget>[
              Container(child: Text(
                GlobalConfig.commonEmail,
                softWrap: true,
                style: _styleGray,
                textAlign: TextAlign.right,
              ),
                width: _leftWidth,
              ),
              SizedBox(width: 5,),
              Text(
                _userInfoEntity==null?"":_userInfoEntity.data.email,
                softWrap: true,
                style: _styleDark,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        Container(
          color: GlobalConfig.cardBackgroundColor,
          child: Row(
            children: <Widget>[
              Container(child: Text(
                GlobalConfig.commonCompany,
                softWrap: true,
                style: _styleGray,
                textAlign: TextAlign.right,
              ),
                width: _leftWidth,
              ),
              SizedBox(width: 5,),
              Text(
                _userInfoEntity==null?"":_userInfoEntity.data.company,
                softWrap: true,
                style: _styleDark,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        Container(
          color: GlobalConfig.cardBackgroundColor,
          child: Row(
            children: <Widget>[
              Container(child: Text(
                GlobalConfig.commonWorkNo,
                softWrap: true,
                style: _styleGray,
                textAlign: TextAlign.right,
              ),
                width: _leftWidth,
              ),
              SizedBox(width: 5,),
              Text(
                _userInfoEntity==null?"":_userInfoEntity.data.workNumber,
                softWrap: true,
                style: _styleDark,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        listAbout,
        raisedButton,
      ],
    );
  }

  Future _loginOrLogout(BuildContext context) async {
    if(userName == null){
      //登录
      await DataUtils.getIsLogin().then((isLogin) {
        if (!isLogin) {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return LoginPage("VVOA");
          }));
        } else {
          print('已登录!');
        }
      });
    }else{
      DataUtils.clearLoginInfo();
      setState(() {
          userName = null;
        },
      );
      ///退出登录，直接回到登录页面
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return LoginPage("VVOA");
      }));
    }
  }
}
