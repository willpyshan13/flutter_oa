import 'package:flutter/material.dart';
import 'package:vv_oa/constant/constants.dart';
import 'package:vv_oa/event/login_event.dart';
import 'package:vv_oa/view/about/about_us_page.dart';
import 'package:vv_oa/view/login/login_page.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/util/PageRouteUtils.dart';

class HomePersonInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePersonInfoPageState();
  }
}

class HomePersonInfoPageState extends State<HomePersonInfoPage> with WidgetsBindingObserver {
  String userName;

  @override
  void initState() {
    super.initState();
    _getName();

    Constants.eventBus.on<LoginEvent>().listen((event) {
      _getName();
    });
  }

  void _getName() async {
    DataUtils.getUserName().then((username) {
      setState(() {
        userName = username;
        print('name:' + userName.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'images/ic_launcher_round.png',
      width: 100.0,
      height: 100.0,
    );

    Widget raisedButton = RaisedButton(
      child: Text(
        userName == null ? "请登录" : userName,
        style: TextStyle(color: Colors.white),
      ),
      color: Theme.of(context).accentColor,
      onPressed: () async {
        //登录
        await DataUtils.getIsLogin().then((isLogin) {
          if (!isLogin) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return LoginPage("VVOA");
            }));
          } else {
            print('已登录!');
          }
        });
      },
    );

    Widget listAbout = ListTile(
        leading: const Icon(Icons.info),
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
          DataUtils.clearLoginInfo();
          setState(() {
            userName = null;
          },);
          ///退出登录，直接回到登录页面
          routePagerNavigator(context, new LoginPage("VVOA"));
//          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//            return LoginPage("VVOA");
//          }));
        });

    return ListView(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      children: <Widget>[
        image,
        raisedButton,
        listAbout,
        listLogout,
      ],
    );
  }
}
