import 'package:dreambit/data/api_constants.dart';
import 'package:dreambit/data/dio_factory.dart';
import 'package:dreambit/data/repositories/liked_people_repository.dart';
import 'package:dreambit/data/repositories/people_view_api.dart';
import 'package:dreambit/data/repositories/settings_singleton.dart';
import 'package:get_it/get_it.dart';

final injection = GetIt.instance;

void setupInjection() {
  injection.registerSingleton<SettingsSingleton>(SettingsSingleton());

  injection.registerSingleton<DioFactory>(
      DioFactory(ApiConstants.baseUrl + ApiConstants.apiVersion));

  injection.registerSingleton<PeopleViewApi>(
      PeopleViewApi(injection.get<DioFactory>().create()));

  injection.registerSingleton<LikedPeopleRepository>(LikedPeopleRepository());
}
