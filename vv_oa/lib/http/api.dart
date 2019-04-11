class Api {

  static const String BaseUrl = "http://172.16.1.122:4001/";

  //首页banner
  static const   String BANNER = "banner/json";
  static const   String FLOW_OVERVIEW = "api/flowOverview";

  //收藏文章列表
  static const   String COLLECT_LIST = "lg/collect/list/";

  //搜索
  static const   String ARTICLE_QUERY = "article/query/";

  //收藏,取消收藏
  static const   String COLLECT = "lg/collect/";
  static const   String UNCOLLECT_ORIGINID = "lg/uncollect_originId/";
  //我的收藏列表中取消收藏
  static const   String UNCOLLECT_LIST = "lg/uncollect/";

  //登录,注册
  static const   String LOGIN = "api/login/account";
  static const   String REGISTER = "user/register";

  //知识体系
  static const   String TREE = "tree/json";

  //常用网站
  static const   String FRIEND = "friend/json";
  //搜索热词
  static const   String HOTKEY = "hotkey/json";



}
