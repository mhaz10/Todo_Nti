import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        emit(UserSuccessState(userModel: userModel));
        return true;
      },
    );
  }

  Future<void> addNewTask({
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
}
