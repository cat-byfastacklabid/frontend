import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_data_entity.dart';
import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/auth/log_in_use_case.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/auth/save_token_use_case.dart';
import 'package:cat_akademik_kepolisian/state/view_state/view_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LogInUseCase logInUseCase;
  final SaveTokenUseCase saveTokenUseCase;

  AuthCubit(
    this.logInUseCase,
    this.saveTokenUseCase,
  ) : super(AuthState.initial());

  void logIn() async {
    emit(state.copyWith(authState: const ViewState.loading()));

    final result = await logInUseCase.call(
      AuthEntity(
        username: state.usernameController.text,
        password: state.passwordController.text,
      ),
    );

    result.when(
      success: (data) async {
        await saveTokenUseCase.call(data.data.token);
        emit(
          state.copyWith(
            authState: const ViewState.success(),
            authDataEntity: data.data,
          ),
        );
      },
      error: (message, errorCode) =>
          emit(state.copyWith(authState: ViewState.error(message, errorCode))),
    );
  }
}
