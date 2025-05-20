import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app_nti/features/home/data/models/tasks_model.dart';
import 'package:todo_app_nti/features/home/data/models/update_task_model.dart';
import 'package:todo_app_nti/features/home/data/repo/home_repo.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../../../auth/data/models/login_model.dart';

class HomeRepoImplementation implements HomeRepo {
  // singleton
  static final HomeRepoImplementation _instance =
      HomeRepoImplementation._internal();
  factory HomeRepoImplementation() => _instance;
  HomeRepoImplementation._internal();

  ApiHelper apiHelper = ApiHelper();
  @override
  Future<Either<String, UserModel>> getUserData() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.getUserData,
        isProtected: true,
      );
      LoginModel loginResponseModel = LoginModel.fromJson(response.data);
      if (loginResponseModel.status != null &&
          loginResponseModel.status == true) {
        // return user model
        if (loginResponseModel.user != null) {
          return Right(loginResponseModel.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, String>> addNewTask({
    required String title,
    required String description,
    image,
  }) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
        endPoint: EndPoints.addTask,
        data: {
          'title': title,
          'description': description,
          'image':
              image == null
                  ? null
                  : await MultipartFile.fromFile(
                    image.path,
                    filename: image.name,
                  ),
        },
        isProtected: true,
      );
      if (response.status) {
        // return user model
        if (response.data != null) {
          return Right(response.message);
        } else {
          throw Exception('Add Task Failed\nTry Again later');
        }
      } else {
        throw Exception('Add Task Failed\nTry Again later');
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, List<SingleTaskModel>>> getTasks() async {
    try {
      ApiResponse response = await apiHelper.getRequest(
        endPoint: EndPoints.getTasks,
        isProtected: true,
      );

      TasksModel tasksModel = TasksModel.fromJson(response.data);
      List<SingleTaskModel> tasksList = [];

      if (tasksModel.status != null) {
        if (tasksModel.tasks.isNotEmpty) {
          tasksModel.tasks.forEach((element) => tasksList.add(element),);
        }
        return Right(tasksList);
      } else {
        throw Exception('Get Task Failed\nTry Again later');
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, UpdateTaskModel>> updateTasks({required int id, required String title, required String description, image}) async {
    try {
      ApiResponse response = await apiHelper.putRequest(
        endPoint: EndPoints.updateTask + id.toString(),
        data: {
          'title': title,
          'description': description,
          'image':
          image == null
              ? null
              : await MultipartFile.fromFile(
            image.path,
            filename: image.name,
          ),
        },
        isProtected: true,
      );
      if (response.status) {
        UpdateTaskModel updateTaskModel = UpdateTaskModel.fromJson(response.data);
        return Right(updateTaskModel);
      } else {
        throw Exception('Update Task Failed\nTry Again later');
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, String>> deleteTasks({required int id}) async {
    try {
      ApiResponse response = await apiHelper.deleteRequest(
        endPoint: EndPoints.updateTask + id.toString(),
        isProtected: true,
      );
      if (response.status) {
        return Right(response.message);
      } else {
        throw Exception('Delete Task Failed\nTry Again later');
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
}
