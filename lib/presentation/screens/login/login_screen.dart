import 'package:auto_route/auto_route.dart';
import 'package:cat_akademik_kepolisian/common/storage/shared_preferences_config.dart';
import 'package:cat_akademik_kepolisian/di/injector.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/auth/auth_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/blocs/screen_size/screen_size_cubit.dart';
import 'package:cat_akademik_kepolisian/presentation/router/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    inject<SharedPreferencesConfig>().clearData();
  }

  bool obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.verticalView
              ? MediaQuery.sizeOf(context).width * .7
              : MediaQuery.sizeOf(context).width * .4,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              state.authState.maybeWhen(
                success: () =>
                    context.router.replaceNamed(PageRoutes.psikotest),
                orElse: () => const SizedBox.shrink(),
              );
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: state.usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: state.passwordController,
                    obscureText: obsecurePassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () => setState(
                          () => obsecurePassword = !obsecurePassword,
                        ),
                        icon: Icon(
                          obsecurePassword
                              ? Icons.lock_outline
                              : Icons.lock_open_outlined,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: context.read<AuthCubit>().logIn,
                    child: const Text('Login'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
