import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/auth/auth_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/router/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<AuthCubit>(),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: context.verticalView
                ? MediaQuery.sizeOf(context).width * .7
                : MediaQuery.sizeOf(context).width * .4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () => context.router.replaceNamed(PageRoutes.home),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
