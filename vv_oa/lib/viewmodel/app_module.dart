import 'package:vv_oa/model/vv_model_service.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/viewmodel/work_menu_provider.dart';
import 'package:vv_oa/viewmodel/login_provider.dart';
import 'package:vv_oa/viewmodel/home_message_provider.dart';
import 'package:dartin/dartin.dart';
import 'package:vv_oa/viewmodel/overtime_provider.dart';
import 'package:vv_oa/viewmodel/work_sub_menu_provider.dart';

const testScope = DartInScope('test');

///提供model给main注册
///管理所有的module
///有添加新的provider，需要添加到这个里面来注册，生成依赖
final viewModelModule = Module([
  factory<LoginProvider>(
      ({params}) => LoginProvider(params.get(0), get<VVModelRepository>())),
  factory<WorkMenuProvider>(
          ({params}) => WorkMenuProvider(params.get(0), get<VVModelRepository>())),
  factory<OvertimeProvider>(
          ({params}) => OvertimeProvider(params.get(0), get<VVModelRepository>())),
  factory<WorkSubMenuProvider>(
          ({params}) => WorkSubMenuProvider(params.get(0), get<VVModelRepository>(),params.get(1))),
  factory<HomeMessageProvider>(({params}) =>
      HomeMessageProvider(params.get(0), get<VVModelRepository>())),
])
  ..addOthers(testScope, [
    ///other scope
  ]);

final repoModule = Module([
  lazy<VVModelRepository>(
      ({params}) => VVModelRepository(get<VVModelService>(),get<DataUtils>())),
]);

final remoteModule = Module([
  single<VVModelService>(VVModelService()),
]);

final appModule = [viewModelModule, repoModule, remoteModule,localModule];

DataUtils spUtil;

/// init
///
/// 初始化 [spUtil] 并启动[DartIn]
init() async {
  spUtil = await DataUtils.getInstance();
  // DartIn start
  startDartIn(appModule);
}

/// Local 模块
///
/// 定义数据库层及SharedPreference/KV等等本地存储的构造方式
final localModule = Module([
  single<DataUtils>(spUtil),
]);
