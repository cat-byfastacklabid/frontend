import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/domain/entities/screen_size/screen_size_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initInjector();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<ScreenSizeCubit>(),
      child: MaterialApp.router(
        routerConfig: AppRouter().config(),
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              context.readScreenSizeCubit.registerSize(
                ScreenSizeEntity(
                  maxHeight: constraints.maxHeight,
                  maxWidth: constraints.maxWidth,
                ),
              );

              return child ?? const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
