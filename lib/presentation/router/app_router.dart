import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/domain/entities/answer/answer_response_entity.dart';
import 'package:cat_akademik_kepolisian/presentation/router/page_routes.dart';
import 'package:cat_akademik_kepolisian/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: PageRoutes.initial,
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: PageRoutes.psikotest,
          page: PsikotestRoute.page,
        ),
        AutoRoute(
          path: PageRoutes.result,
          page: ResultRoute.page,
        ),
      ];
}
