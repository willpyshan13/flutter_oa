import 'package:flutter/cupertino.dart';

const List<String> coolColorNames = <String>[
  '年假', '事假', '病假', '调休', '产假', '陪产假', '婚假', '丧假', '哺乳假'
];
const double _kPickerSheetHeight = 216.0;
const double _kPickerItemHeight = 32.0;


///ios风格的选择框
Widget buildColorPicker(BuildContext context) {
  final FixedExtentScrollController scrollController =
  FixedExtentScrollController(initialItem: 0);

  return GestureDetector(
    onTap: () async {
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return _buildBottomPicker(
            CupertinoPicker(
              magnification:1.0, // 整体放大率
              //offAxisFraction:10.0,// 球面效果的透视系数,消失点位置
              scrollController: scrollController,// 用于读取和控制当前项的FixedxtentScrollController
              itemExtent: _kPickerItemHeight,// 所以子节点 统一高度
              backgroundColor: CupertinoColors.white,// 所有子节点下面的背景颜色
              useMagnifier:true,// 是否使用放大效果
              onSelectedItemChanged: (int)=>{

              },
              children: List<Widget>.generate(coolColorNames.length, (int index) {
                return Center(child:
                Text(coolColorNames[index]),
                );
              }),
            ),
          );
        },
      );
    },
    child: Text(
      '请选择',
      style: const TextStyle(
          color: CupertinoColors.inactiveGray
      ),
    ),
  );
}

Widget _buildBottomPicker(Widget picker) {
  return Container(
    height: _kPickerSheetHeight,
    padding: const EdgeInsets.only(top: 6.0),
    color: CupertinoColors.white,
    child: DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 22.0,
      ),
      child: GestureDetector(
        // Blocks taps from propagating to the modal sheet and popping.
        onTap: () {},
        child: SafeArea(
          top: false,
          child: picker,
        ),
      ),
    ),
  );
}