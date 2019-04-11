import 'package:flutter/material.dart';
import 'package:vv_oa/constant/global_config.dart';
import 'package:vv_oa/widget/picker_widget.dart';

Widget getAttendanceTextItem(BuildContext context, String title) {
  return Container(
    color: GlobalConfig.cardBackgroundColor,
    child: FlatButton(
        onPressed: () {
//            _handleOnItemCollect(widget.itemData);
        },
        child: new Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                      TextSpan(
                          text: title, style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
              Text(
                '请选择',
                softWrap: true,
                style: TextStyle(color: Theme.of(context).accentColor),
                textAlign: TextAlign.left,
              ),
              Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        )),
  );
}

Widget getAttendanceTextItemNoIcon(
    BuildContext context, String title, String subTitle) {
  return Container(
    color: GlobalConfig.cardBackgroundColor,
    child: new FlatButton(
        onPressed: () {
//            _handleOnItemCollect(widget.itemData);
        },
        child: new Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                      TextSpan(
                          text: title, style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ),
              Text(
                subTitle,
                softWrap: true,
                style: TextStyle(color: Theme.of(context).accentColor),
                textAlign: TextAlign.left,
              )
            ],
          ),
        )),
  );
}

Widget getContainerText(BuildContext context, String title) {
  return Container(
    color: GlobalConfig.cardBackgroundColor,
    child: Container(
      margin: const EdgeInsets.only(left: 15.0),
      child: Text(
        title,
        softWrap: true,
        style: TextStyle(color: Theme.of(context).accentColor),
        textAlign: TextAlign.left,
      ),
    ),
  );
}

Widget getTextField(BuildContext context, String title) {
  return Container(
    color: GlobalConfig.cardBackgroundColor,
    padding: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
      children: <Widget>[
        Text(title,
            style: TextStyle(fontSize: 15.5, height: 1.2, color: Colors.blue),
            textAlign: TextAlign.left),
        TextField(
          keyboardType: TextInputType.text,
          maxLines: 3,
          maxLength: 70,
          decoration: InputDecoration(
            helperText: GlobalConfig.commonLeaveReasonInput,
          ),
        )
      ],
    ),
  );
}

Widget getImagePicker(BuildContext context) {
  return Container(
    color: GlobalConfig.cardBackgroundColor,
    padding: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
      children: <Widget>[
        Text(GlobalConfig.commonImageText,
            style: TextStyle(fontSize: 15.5, height: 1.2, color: Colors.blue),
            textAlign: TextAlign.left),
         Container(
          margin: const EdgeInsets.only(bottom: 6.0),
          child: CircleAvatar(
            radius: 20.0,
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    ),
  );
}
