import 'package:flutter/material.dart';
import 'package:vv_oa/page/webview/article_detail_page.dart';

routeWebView(BuildContext context, String title, String url) {
//  Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//    return new ArticleDetailPage(title: title, url: url);
//  },));

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
