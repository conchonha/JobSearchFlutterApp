import 'package:flutter_library/utils/shared_prefs.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled_folder/services/api_services.dart';

import 'db_utils.dart';


GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => DatabaseUtils());
}
