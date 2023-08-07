import 'package:dreambit/data/models/app_user.dart';
import 'package:dreambit/data/models/settings.dart';

class SettingsSingleton {
  static final SettingsSingleton _singleton = SettingsSingleton._internal();

  factory SettingsSingleton() {
    return _singleton;
  }

  SettingsSingleton._internal();

  Settings _settings = const Settings(gender: null, nationality: null);
  AppUser _appUser = const AppUser(name: null, birthDate: null);

  Settings get settings => _settings;
  AppUser get appUser => _appUser;

  set settings(Settings value) {
    _settings = value;
  }

  set appUser(AppUser value) {
    _appUser = value;
  }
}
