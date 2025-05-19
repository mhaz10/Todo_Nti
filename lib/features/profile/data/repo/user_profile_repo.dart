import 'package:dartz/dartz.dart';

abstract class UserProfileRepo {
  Future<Either<String, String>> updateUserProfile({required String name, imagePath});
  Future<Either<String, String>> changeUserPassword({required String oldPassWord, required String newPassWord, required String confirmPassWord});
}