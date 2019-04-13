import 'dart:async';

import 'package:dartin/dartin.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:vv_oa/constant/constants.dart';
import 'package:vv_oa/util/dispatch_failure.dart';
import 'package:vv_oa/view/item/article_item.dart';
import 'package:vv_oa/view/base/base.dart';
import 'package:vv_oa/widget/end_line.dart';
import 'package:vv_oa/widget/slide_view.dart';
import 'package:vv_oa/viewmodel/home_message_provider.dart';

class HomeMessagePage extends PageProvideNode {
  HomeMessagePage() {
    mProviders.provideValue(inject<HomeMessageProvider>());
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _HomeContentPage();
  }
}

class _HomeContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeMessagePageState();
  }
}

class _HomeMessagePageState extends State<_HomeContentPage> {
  HomeMessageProvider _homeMessageViewModel;
  List listData = List();
  var bannerData;
  var curPage = 0;
  var listTotalSize = 0;

  ScrollController _controller = ScrollController();
  TextStyle titleTextStyle = TextStyle(fontSize: 15.0);
  TextStyle subtitleTextStyle = TextStyle(color: Colors.blue, fontSize: 12.0);

  _HomeMessagePageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;

      if (maxScroll == pixels && listData.length < listTotalSize) {
        _getHomeArticleList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    _controller.dispose();
    print("dispose");
    super.dispose();
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
//    getBanner();
    _getHomeArticleList();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    _homeMessageViewModel = Provide.value<HomeMessageProvider>(context);
//    _getHomeArticleList();
    if (listData == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      Widget listView = ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) => buildItem(i),
        controller: _controller,
      );

      return RefreshIndicator(child: listView, onRefresh: _pullToRefresh);
    }
  }

  SlideView _bannerView;

  ///用来展示公司公告布局，暂时没有请求网络
  void getBanner() {}

  void _getHomeArticleList() {
    final s = _homeMessageViewModel
        .getFlowOverview()
        .doOnListen(() {})
        .doOnCancel(() {
      print("======cancel======");
    }).listen((t) {
      //success
      print("======listen======");
//      Toast.show("login success", context, type: Toast.SUCCESS);
    }, onError: (e) {
      //error
      dispatchFailure(context, e);
    });
    _homeMessageViewModel.plus(s);
  }

  Widget buildItem(int i) {
    if (i == 0) {
      return Container(
        height: 180.0,
        child: _bannerView,
      );
    }
    i -= 1;

    var itemData;

    if (itemData is String && itemData == Constants.END_LINE_TAG) {
      return EndLine();
    }

    return ArticleItem(itemData);
  }
}
