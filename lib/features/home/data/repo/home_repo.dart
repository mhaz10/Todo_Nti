import 'package:dartz/dartz.dart';
import 'package:todo_app_nti/features/home/data/models/tasks_model.dart';
import 'package:todo_app_nti/features/home/data/models/update_task_model.dart';

import '../../../auth/data/models/login_model.dart';

abstract class HomeRepo {
  Future<Either<String, UserModel>> getUserData();
  Future<Either<String, String>> addNewTask({required String title, required String description, image});
  Future<Either<String, List<SingleTaskModel>>> getTasks();
  Future<Either<String, UpdateTaskModel>> updateTasks({required int id,required String title, required String description, image});
  Future<Either<String, String>> deleteTasks({required int id});
}