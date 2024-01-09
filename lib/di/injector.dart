import 'package:cat_akademik_kepolisian/di/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final inject = GetIt.I;

@InjectableInit()
void initInjector() => inject.init();
