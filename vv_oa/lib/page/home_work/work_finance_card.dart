import 'package:flutter/material.dart';
import 'package:vv_oa/constant//global_config.dart';

Widget getWorkFinanceCard(BuildContext context) {
  return new Container(
    color: GlobalConfig.cardBackgroundColor,
    margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
    padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
    child: new Column(
      children: <Widget>[
        new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(
                              GlobalConfig.financialManagement,
                              style: new TextStyle(
                                  color: GlobalConfig.fontColor,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.tv, color: Colors.white),
                              backgroundColor: new Color(0xFF088DB4),
                            ),
                          ),
                          new Container(
                            child: new Text(
                              GlobalConfig.financialPayment,
                              style: new TextStyle(
                                  color: GlobalConfig.fontColor,
                                  fontSize: 14.0),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
//                      routePageBuilder(context, GlobalConfig.push);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(bottom: 6.0),
                            child: new CircleAvatar(
                              radius: 20.0,
                              child: new Icon(Icons.radio, color: Colors.white),
                              backgroundColor: Colors.cyan,
                            ),
                          ),
                          new Container(
                            child: new Text(GlobalConfig.financialStandbyFund,
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
              new Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new FlatButton(
                    onPressed: () {
//                      routePageBuilder(context, GlobalConfig.resource);
                    },
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text("",
                                style: new TextStyle(
                                    color: GlobalConfig.fontColor,
                                    fontSize: 14.0)),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
