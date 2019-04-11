import 'package:vv_oa/model/vv_model_service.dart';
import 'package:vv_oa/model/vv_model_repository.dart';
import 'package:vv_oa/viewmodel/login_viewmodel.dart';
import 'package:vv_oa/viewmodel/home_message_viewmodel.dart';
import 'package:dartin/dartin.dart';

const testScope = DartInScope('test');

final viewModelModule = Module([
  factory<LoginViewModel>(({params}) => LoginViewModel(params.get(0), get<VVModelRepository>())),
  factory<HomeMessageViewModel>(({params}) => HomeMessageViewModel(params.get(0), get<VVModelRepository>())),
])
  ..addOthers(testScope, [
    ///other scope
  factory<HomeMessageViewModel>(({params}) => HomeMessageViewModel(params.get(0), get<VVModelRepository>())),
  ]);

final repoModule = Module([
  lazy<VVModelRepository>(({params}) => VVModelRepository(get<VVModelService>())),
]);

final remoteModule = Module([
  single<VVModelService>(VVModelService()),
]);

final appModule = [viewModelModule, repoModule, remoteModule];
