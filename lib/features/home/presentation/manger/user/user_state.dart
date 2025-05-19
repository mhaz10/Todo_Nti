part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class UserSuccessState extends UserState {
  final UserModel userModel;
  UserSuccessState({required this.userModel});
}

final class UserFailureState extends UserState {
  final String error;
  UserFailureState({required this.error});
}
