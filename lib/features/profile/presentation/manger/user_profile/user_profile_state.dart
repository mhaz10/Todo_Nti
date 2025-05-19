part of 'user_profile_cubit.dart';

@immutable
sealed class UserProfileState {}

final class UserProfileInitialState extends UserProfileState {}

final class UserProfileSuccessState extends UserProfileState {
  final String message;

  UserProfileSuccessState({required this.message});
}

final class UserProfileFailureState extends UserProfileState {
  final String error;

  UserProfileFailureState({required this.error});
}
