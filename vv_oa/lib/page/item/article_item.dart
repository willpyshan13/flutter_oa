import 'package:flutter/material.dart';
import 'package:vv_oa/http/api.dart';
import 'package:vv_oa/http/http_util_with_cookie.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/util/StringUtils.dart';

///个人感觉条目比较复杂的话可以单独拿出来,而且可以复用.可以对比CollectListPage.dart中的item哪个更合理
class ArticleItem extends StatefulWidget {
//  var itemData;

  //是否来自搜索列表
   bool isSearch;

  //搜索列表的id
  String id;

  ArticleItem(var itemData) {
//    this.itemData = itemData;
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
  void _handleOnItemCollect(itemData) {
    DataUtils.getIsLogin().then((isLogin) {
      if (!isLogin) {
        _login();
      } else {
        _itemCollect(itemData);
      }
    });
  }

  _login() {
//    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//      return LoginPage();
//    }));
  }

  void _itemClick(itemData) async {
//    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//      return ArticleDetailPage(
//        title: itemData['title'],
//        url: itemData['link'],
//      );
//    }));
  }

  //收藏/取消收藏
  void _itemCollect(var itemData) {
    String url;
    if (itemData['collect']) {
      url = Api.UNCOLLECT_ORIGINID;
    } else {
      url = Api.COLLECT;
    }
    url += '${itemData["id"]}/json';
    HttpUtil.post(url, (data) {
      setState(() {
        itemData['collect'] = !itemData['collect'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    bool isCollect = widget.itemData["collect"];

    Row author = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Text('作者:  '),
            Text(
              "title",
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ],
        )),
        Text("createTim",
          style: TextStyle(color: Theme.of(context).accentColor),)
      ],
    );

    Row title = Row(
      children: <Widget>[
        Expanded(
          child: Text.rich(
            TextSpan(text: "title"),
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
            "characterName",
            softWrap: true,
            style: TextStyle(color: Theme.of(context).accentColor),
            textAlign: TextAlign.left,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite ,
            color:Colors.red ,
          ),
          onPressed: () {
//            _handleOnItemCollect(widget.itemData);
          },
        )
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
//          _itemClick(widget.itemData);
        },
      ),
    );
  }
}
