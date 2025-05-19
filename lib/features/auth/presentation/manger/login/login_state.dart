part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final UserModel userModel;
  LoginSuccessState(this.userModel);
}

final class LoginFailureState extends LoginState {
  final String error;
  LoginFailureState(this.error);
}