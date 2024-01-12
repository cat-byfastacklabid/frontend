import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectorModules {
  @preResolve
  Future<SharedPreferences> get sharedPref async =>
      await SharedPreferences.getInstance();

  @lazySingleton
  Dio get client => Dio();
}
