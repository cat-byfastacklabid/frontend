part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required ViewState authState,
    required AuthEntity userAuth,
    required AuthDataEntity authDataEntity,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState(
        authState: ViewState.initial(),
        userAuth: AuthEntity(password: '', username: ''),
        authDataEntity: AuthDataEntity(
          id: '',
          token: '',
          userCode: '',
          username: '',
        ),
      );
}
