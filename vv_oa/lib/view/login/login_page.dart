import 'package:dartin/dartin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vv_oa/constant/constants.dart';
import 'package:vv_oa/constant/v_http_status.dart';
import 'package:vv_oa/entity/common_response.dart';
import 'package:vv_oa/event/login_event.dart';
import 'package:vv_oa/util/PageRouteUtils.dart';
import 'package:vv_oa/view/vv_oa_page.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/util/dialog.dart';
import 'package:vv_oa/util/toast.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/viewmodel/login_provider.dart';
import 'package:provide/provide.dart';

///登陆页面，使用rxdart请求
///
///
class LoginPage extends PageProvideNode {
  final String title;

  LoginPage(this.title) {
    mProviders.provideValue(inject<LoginProvider>(params: [title]));
  }

  @override
  Widget buildContent(BuildContext context) {
    return _LoginContentPage();
  }
}

///内部登陆页面
class _LoginContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }
}

///内部状态内容
class _HomeContentState extends State<_LoginContentPage> with SingleTickerProviderStateMixin<_LoginContentPage> implements Presenter {

  LoginProvider _viewModel;
  TextEditingController _nameController = TextEditingController(text: '020');
  TextEditingController _passwordController = TextEditingController(text: '123456');
  AnimationController _controller;
  Animation<double> _animation;
  final _actionLogin = "login";

  final LoadingDialog loadingDialog = LoadingDialog();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 295.0, end: 48.0).animate(_controller)
      ..addListener(() {
        _viewModel.btnWidth = _animation.value;
      });
  }

  @override
  void dispose() {
    print('-------dispose-------');
    _controller.dispose();
    _viewModel.disposeBag();
    super.dispose();
  }

  @override
  void onClick(String action) {
    if (action == _actionLogin) {
      _login(_nameController.text,_passwordController.text);
    }
  }

  ///发起登陆请求
  ///forward 启动动画
  ///reverse 关闭动画
  ///listen 监听返回数据，登陆成功跳转首页
  _login(String name,String password) {
    final s = _viewModel.login().doOnListen(() {
      _controller.forward();
    }).doOnDone(() {
      _controller.reverse();
    }).doOnCancel(() {
      print("======cancel======");
    }).listen((value) {
      //success
      if(_viewModel.loginEntity.code == VHttpStatus.statusOk){
        DataUtils.saveLoginInfo(name,password,_viewModel.loginEntity.data,_viewModel.loginEntity.currentAuthority).then((r) {
          Constants.eventBus.fire(LoginEvent());
          routePagerAndReplace(context,VVOAApp());
        });
      }
      Toast.show(_viewModel.loginEntity.message, context, type: Toast.SUCCESS);
    }, onError: (e) {
      //error

    });
    _viewModel.plus(s);
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provide.value<LoginProvider>(context);
    print("--------build--------");
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.title),
      ),
      body: DefaultTextStyle(
        style: TextStyle(),
        child: Material(
          child: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.person),
                  labelText: 'Account',
                ),
                controller: _nameController,
                autofocus: false,
                onChanged: (str) => _viewModel.username = str,
              ),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                controller: _passwordController,
                autofocus: false,
                onChanged: (str) => _viewModel.password = str,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
              ),
              Provide<LoginProvider>(
                builder: (BuildContext context, Widget child, LoginProvider value) => CupertinoButton(
                      onPressed: value.loading ? null : () => onClick(_actionLogin),
                      pressedOpacity: 0.8,
                      child: Container(
                        alignment: Alignment.center,
                        width: value.btnWidth,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            gradient: LinearGradient(colors: [
                              Color(0xFF686CF2),
                              Color(0xFF0E5CFF),
                            ]),
                            boxShadow: [BoxShadow(color: Color(0x4D5E56FF), offset: Offset(0.0, 4.0), blurRadius: 13.0)]),
                        child: _buildChild(value),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChild(LoginProvider value) {
    if (value.loading) {
      return const CircularProgressIndicator();
    } else {
      return const FittedBox(
        fit: BoxFit.scaleDown,
        child: const Text(
          'Login With OA Account',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.white),
        ),
      );
    }
  }
}
