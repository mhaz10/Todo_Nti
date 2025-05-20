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

final class AddNewTaskSuccessState extends UserState {
  final String message;

  AddNewTaskSuccessState({required this.message});
}

final class AddNewTaskFailureState extends UserState {
  final String error;

  AddNewTaskFailureState({required this.error});
}

final class GetTasksSuccessState extends UserState {
  final List<SingleTaskModel> tasks;

  GetTasksSuccessState({required this.tasks});
}

final class GetTasksFailureState extends UserState {
  final String error;

  GetTasksFailureState({required this.error});
}

final class UpdateTaskSuccessState extends UserState {
  final UpdateTaskModel tasks;

  UpdateTaskSuccessState({required this.tasks});
}

final class UpdateTaskFailureState extends UserState {
  final String error;

  UpdateTaskFailureState({required this.error});
}

final class DeleteTaskSuccessState extends UserState {
  final String message;

  DeleteTaskSuccessState({required this.message});
}

final class DeleteTaskFailureState extends UserState {
  final String error;

  DeleteTaskFailureState({required this.error});
}