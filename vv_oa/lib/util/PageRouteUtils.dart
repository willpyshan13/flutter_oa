import 'package:flutter/material.dart';
import 'package:vv_oa/entity/work_wigdet_entity.dart';
import 'package:vv_oa/view/home_work/work_sub_menu_page.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_overtime.dart';
import 'package:vv_oa/view/webview/article_detail_page.dart';

///跳转到网页
routeWebView(BuildContext context, String title, String url) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new ArticleDetailPage(title: title, url: url);
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}

///正常跳转页面
routePagerNavigator(BuildContext context, Widget v) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return v;
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }));
}

///跳转页面，通过英文名
routePagerNavigatorByPath(BuildContext context, String path,String name,List<WorkWidgetEntity> categories) {
  ///跳转我的申请页面
  if(path == 'myApplication'){
    routePagerNavigator(context, WorkSubMenuPage(name,categories));
  }

}

///跳转页面，销毁原先页面
routePagerAndReplace(BuildContext context,Widget v){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    return v;
  }));
}
