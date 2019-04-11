import 'package:flutter/material.dart';
import 'package:vv_oa/http/api.dart';
import 'package:vv_oa/http/default_http_util_with_cookie.dart';
import 'package:vv_oa/view/webview/article_detail_page.dart';
import 'package:vv_oa/view/search/search_page.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  HotPageState();
  }
}

class HotPageState extends State<HotPage> {
  List<Widget> hotKeyWidgets =  List();
  List<Widget> friendWidgets =  List();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: <Widget>[
         Padding(
            padding: EdgeInsets.all(10.0),
            child:  Text('大家都在搜',
                style:  TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20.0))),
         Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: hotKeyWidgets,
        ),
         Padding(
            padding: EdgeInsets.all(10.0),
            child:  Text('常用网站',
                style:  TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20.0))),
         Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: friendWidgets,
        ),
      ],
    );
  }
}
