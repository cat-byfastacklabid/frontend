import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/presentation/router/page_routes.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => context.router.replaceNamed(PageRoutes.home),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(color: Colors.red);
}
