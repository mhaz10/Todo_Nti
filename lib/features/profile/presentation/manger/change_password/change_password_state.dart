part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitialState extends ChangePasswordState {}

final class ChangePasswordSuccessState extends ChangePasswordState {
  final String message;
  ChangePasswordSuccessState({required this.message});
}

final class ChangePasswordFailureState extends ChangePasswordState {
  final String error;
  ChangePasswordFailureState({required this.error});
}
