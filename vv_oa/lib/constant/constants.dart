import 'package:event_bus/event_bus.dart';


class Constants {

  ///菜单类型,一级目录
  static final String menuType = '0';
  ///子菜单类型，二级目录
  static final int subMenuType = 1;
  ///菜单，按钮类型
  static final int subMenuTypeButton = 2;
  ///菜单，api
  static final int subMenuTypeApi = 3;

  static final String END_LINE_TAG = "COMPLETE";

  static EventBus eventBus = new EventBus();

}