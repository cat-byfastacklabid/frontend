part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required ViewState authState,
    required AuthEntity userAuth,
    required AuthDataEntity authDataEntity,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        authState: const ViewState.initial(),
        userAuth: const AuthEntity(password: '', username: ''),
        authDataEntity: const AuthDataEntity(
          id: '',
          token: '',
          roleCode: '',
          username: '',
        ),
        usernameController: TextEditingController(),
        passwordController: TextEditingController(),
      );
}
