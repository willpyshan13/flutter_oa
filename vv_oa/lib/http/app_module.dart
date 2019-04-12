import 'package:vv_oa/model/vv_model_service.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:vv_oa/util/DataUtils.dart';
import 'package:vv_oa/viewmodel/home_work_viewmodel.dart';
import 'package:vv_oa/viewmodel/login_viewmodel.dart';
import 'package:vv_oa/viewmodel/home_message_viewmodel.dart';
import 'package:dartin/dartin.dart';

const testScope = DartInScope('test');

///提供model给main注册
///
final viewModelModule = Module([
  factory<LoginViewModel>(
      ({params}) => LoginViewModel(params.get(0), get<VVModelRepository>())),
  factory<HomeWorkViewModel>(
          ({params}) => HomeWorkViewModel(params.get(0), get<VVModelRepository>())),
  factory<HomeMessageViewModel>(({params}) =>
      HomeMessageViewModel(params.get(0), get<VVModelRepository>())),
])
  ..addOthers(testScope, [
    ///other scope
    factory<HomeMessageViewModel>(({params}) =>
        HomeMessageViewModel(params.get(0), get<VVModelRepository>())),
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
