import 'package:cat_akademik_kepolisian/presentation/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarAppbarWidget extends StatelessWidget {
  const AvatarAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.authState.maybeWhen(
          success: () => Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 12),
                Text('Hi, ${state.authDataEntity.username}'),
              ],
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
