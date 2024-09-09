import 'package:clothes_app/data_layer/models/app_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setup() {
  getIt.registerSingleton<AppModel>(AppModel());
}
