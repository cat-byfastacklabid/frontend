import 'package:cat_akademik_kepolisian/domain/entities/auth/auth_entity.dart';
import 'package:cat_akademik_kepolisian/domain/use_cases/auth/log_in_use_case.dart';
import 'package:cat_akademik_kepolisian/state/view_state/view_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final LogInUseCase logInUseCase;

  AuthCubit(this.logInUseCase) : super(AuthState.initial());

  void logIn(AuthEntity authEntity) async {
    emit(state.copyWith(authState: const ViewState.loading()));

    final result = await logInUseCase.call(authEntity);

    result.when(
      success: (_) =>
          emit(state.copyWith(authState: const ViewState.success())),
      error: (message, errorCode) =>
          emit(state.copyWith(authState: ViewState.error(message, errorCode))),
    );
  }
}
