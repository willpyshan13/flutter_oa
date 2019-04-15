import 'dart:convert';

import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/constants.dart';
import 'package:vv_oa/event/login_event.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/viewmodel/home_work_provider.dart';

import 'package:vv_oa/entity/work_wigdet_entity.dart';
import 'work_widget_card.dart';

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

class _HomeWorkPageState extends State<_HomeWorkContentPage>
    with AutomaticKeepAliveClientMixin {
  HomeWorkProvider _homeWorkViewModel;
  List<WorkWidgetEntity> categories = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    renderCats();
  }

  void renderCats() {}

  Widget buildGrid() {
    /// 存放最后的widget
    List<Widget> tiles = [];
    for (WorkWidgetEntity item in categories) {
      tiles.add(new WorkWidgetCard(category: item));
    }
    return new ListView(
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    _homeWorkViewModel = Provide.value<HomeWorkProvider>(context);
    if (_homeWorkViewModel.userInfoEntity == null) {
      _getCurrentUser();
    }

    super.build(context);
    if (categories.length == 0) {
      return ListView(
        children: <Widget>[new Container()],
      );
    }
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.buildGrid(),
    );
  }

  ///获取当前用户权限，以及用户信息
  void _getCurrentUser() {
    final currentUser = _homeWorkViewModel
        .getCurrentUser()
        .doOnListen(() {})
        .doOnCancel(() {})
        .listen((t) {
      processMenu();
    }, onError: (e) {
      dispatchFailure(context, e);
    });
    _homeWorkViewModel.plus(currentUser);
  }

  ///处理个人信息中的权限列表
  void processMenu() {
    print("======listen======");
    print(_homeWorkViewModel.userInfoEntity.data.permissionList.length);
    DataUtils.saveUserInfo(json.encode(_homeWorkViewModel.userInfoEntity))
        .then((r) {
      print("======save success======");
      Constants.eventBus.fire(LoginEvent());
    });
    if (_homeWorkViewModel != null &&
        _homeWorkViewModel.userInfoEntity != null &&
        _homeWorkViewModel.userInfoEntity.data != null &&
        _homeWorkViewModel.userInfoEntity.data.permissionList != null &&
        _homeWorkViewModel.userInfoEntity.data.permissionList.length > 0) {
      ///先获取目录菜单
      for (int i = 0;
          i < _homeWorkViewModel.userInfoEntity.data.permissionList.length;
          i++) {
        if (_homeWorkViewModel.userInfoEntity.data.permissionList
                .elementAt(i)
                .pid ==
            Constants.menuType) {
          categories.add(WorkWidgetEntity(
              name: _homeWorkViewModel.userInfoEntity.data.permissionList
                  .elementAt(i)
                  .name,
              children: [],
              engName: _homeWorkViewModel.userInfoEntity.data.permissionList
                  .elementAt(i).international,
              desc: _homeWorkViewModel.userInfoEntity.data.permissionList
                  .elementAt(i)
                  .id));
          _homeWorkViewModel.userInfoEntity.data.permissionList.removeAt(i);
          i--;
        }
      }
      ///获取目录中的子菜单
      for (int j = 0; j < categories.length; j++) {
        for (int i = 0;
            i < _homeWorkViewModel.userInfoEntity.data.permissionList.length;
            i++) {
          if (_homeWorkViewModel.userInfoEntity.data.permissionList
                      .elementAt(i)
                      .type ==
                  Constants.subMenuType &&
              categories.elementAt(j).desc ==
                  _homeWorkViewModel.userInfoEntity.data.permissionList
                      .elementAt(i)
                      .pid) {
            categories.elementAt(j).children.add(WorkWidgetEntity(
                engName: _homeWorkViewModel.userInfoEntity.data.permissionList
                    .elementAt(i).international,
                name: _homeWorkViewModel.userInfoEntity.data.permissionList
                    .elementAt(i)
                    .name));
          }
        }
      }
    }
    setState(() {});
  }
}
