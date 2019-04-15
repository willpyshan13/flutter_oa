import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/entity/work_wigdet_entity.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/view/home_work/widget/work_widget_card.dart';
import 'package:vv_oa/viewmodel/work_sub_menu_provider.dart';

import 'attendance/get_work_service_card.dart';
///工作子菜单界面
///
class WorkSubMenuPage extends PageProvideNode {
  final String title;
  final List<WorkWidgetEntity> categories;
  WorkSubMenuPage(this.title,this.categories) {
    mProviders.provideValue(inject<WorkSubMenuProvider>(params: [title,categories]));
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _WorkSubMenuContentPage();
  }
}

class _WorkSubMenuContentPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _WorkSubMenuPageState();
  }
}

class _WorkSubMenuPageState extends State<_WorkSubMenuContentPage> {
  WorkSubMenuProvider _homeWorkProvider;
  List<WorkWidgetEntity> categories = [];
  @override
  void initState() {
    super.initState();
  }

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
    _homeWorkProvider =Provide.value<WorkSubMenuProvider>(context);
    categories = _homeWorkProvider.categories;
    return new Scaffold(
        appBar: AppBar(
          title: Text(_homeWorkProvider.title),
        ),
        body: Container(
        color: Theme.of(context).backgroundColor,
    child: getWorkServiceCard(context),
    )
    );
  }
}