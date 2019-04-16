import 'package:flutter/material.dart';
import 'package:vv_oa/constant/work_item.dart';
import 'package:vv_oa/http/api.dart';
import 'package:vv_oa/http/default_http_util_with_cookie.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/util/PageRouteUtils.dart';
import 'package:vv_oa/util/StringUtils.dart';
import 'package:vv_oa/view/home_work/attendance/attendance_overtime_detail.dart';

///个人感觉条目比较复杂的话可以单独拿出来,而且可以复用.可以对比CollectListPage.dart中的item哪个更合理
class ArticleItem extends StatefulWidget {
  var itemData;

  //是否来自搜索列表
   bool isSearch;

  //搜索列表的id
  String id;

  ArticleItem(var itemData) {
    this.itemData = itemData;
    this.isSearch = false;
  }

  //命名构造函数,搜索列表的item和普通的item有些不一样
  ArticleItem.isFromSearch(var itemData, String id) {
//    this.itemData = itemData;
    this.isSearch = true;
    this.id = id;
  }

  @override
  State<StatefulWidget> createState() {
    return ArticleItemState();
  }
}

class ArticleItemState extends State<ArticleItem> {

  void _itemClick(BuildContext context,itemData) async {
    routePagerNavigator(context,AttendanceOvertimeDetailPage(itemData));
  }

  @override
  Widget build(BuildContext context) {

    Row author = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Text(
              widget.itemData.title,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        )),
        Text(widget.itemData.createTime,
          style: TextStyle(color: Theme.of(context).accentColor),)
      ],
    );

    Row title = Row(
      children: <Widget>[
        Expanded(
          child: Text.rich(
            TextSpan(text: widget.itemData.summary),
            softWrap: true,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            textAlign: TextAlign.left,
          ),
        )
      ],
    );

    Row chapterName = Row(
//      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          child: Text(
            WorkItem.flowOverviewType[int.parse(widget.itemData.type)],
            softWrap: true,
            style: TextStyle(color: Theme.of(context).accentColor),
            textAlign: TextAlign.left,
          ),
        ),
        Text(
            int.parse(widget.itemData.status)>=0?WorkItem.flowOverviewStatus[int.parse(widget.itemData.status)]:WorkItem.flowOverviewStatus[2],
            softWrap: true,
            style: TextStyle(color: Theme.of(context).accentColor),
            textAlign: TextAlign.left,
          ),

      ],
    );

    Column column = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: author,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
          child: title,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: chapterName,
        ),
      ],
    );

    return Card(
      elevation: 4.0,
      child: InkWell(
        child: column,
        onTap: () {
          _itemClick(context,widget.itemData);
        },
      ),
    );
  }
}
