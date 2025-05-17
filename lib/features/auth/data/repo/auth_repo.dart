import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../models/login_model.dart';

abstract class AuthRepo {
  Future<Either<String, UserModel>>  login({ required String username, required String password,});
  Future<Either<String, void>>  register({ required String username, required String password, required XFile? image});
}