import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_nti/features/home/data/models/tasks_model.dart';
import 'package:todo_app_nti/features/home/data/models/update_task_model.dart';
import '../../../../auth/data/models/login_model.dart';
import '../../../data/repo/home_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.repo) : super(UserInitialState());

  final HomeRepo repo;

  static UserCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getUserData({required UserModel user}) {
    userModel = user;
    emit(UserSuccessState(userModel: user));
  }

  Future<bool> getUserDataFromAPI() async {
    var response = await repo.getUserData();

    return response.fold(
      (error) {
        emit(UserFailureState(error: error));
        return false;
      },
      (userModel) {
        this.userModel = userModel;
        emit(UserSuccessState(userModel: userModel));
        return true;
      },
    );
  }

  void addNewTask({
    required String title,
    required String description,
    image,
  }) async {
    var response = await repo.addNewTask(title: title, description: description, image: image);

    return response.fold(
          (error) {
        emit(AddNewTaskFailureState(error: error));
      },
          (message) {
        emit(AddNewTaskSuccessState(message: message));
      },
    );
  }


  void getTasks () async {
    var response = await repo.getTasks();

    return response.fold(
          (error) {
        emit(GetTasksFailureState(error: error));
      },
          (tasks) {
        emit(GetTasksSuccessState(tasks: tasks));
      },
    );
  }

  void updateTasks({
    required int id,
    required String title,
    required String description,
    image,
  }) async {
    var response = await repo.updateTasks(id: id, title: title, description: description, image: image);

    return response.fold(
          (error) {
        emit(UpdateTaskFailureState(error: error));
      },
          (updateTaskModel) {
        emit(UpdateTaskSuccessState(tasks: updateTaskModel));
      },
    );
  }

  void deleteTasks({required int id}) async {
    var response = await repo.deleteTasks(id: id);

    return response.fold(
          (error) {
        emit(DeleteTaskFailureState(error: error));
      },
          (message) {
        emit(DeleteTaskSuccessState(message: message));
      },
    );
  }
}
