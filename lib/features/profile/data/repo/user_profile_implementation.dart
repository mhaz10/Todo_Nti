import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app_nti/core/network/api_helper.dart';
import 'package:todo_app_nti/features/profile/data/repo/user_profile_repo.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class UserProfileImplementation implements UserProfileRepo {

  // singleton
  static final UserProfileImplementation _instance = UserProfileImplementation._internal();
  factory UserProfileImplementation() => _instance;
  UserProfileImplementation._internal();

  ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<String, String>> updateUserProfile({required String name, imagePath}) async {
    try {
      ApiResponse response = await apiHelper.putRequest(
          endPoint: EndPoints.updateUserProfile,
          data: {
        'username': name,
        'image': imagePath == null ? null : await MultipartFile.fromFile( imagePath.path, filename: imagePath.name,),} ,isProtected: true);
      if (response.status) {
        // return user model
        if (response.data != null) {
          return Right(response.message);
        } else {
          throw Exception("Update Failed\nTry Again later");
        }
      } else {
        throw Exception("Update Failed\nTry Again later");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, String>> changeUserPassword({required String oldPassWord, required String newPassWord, required String confirmPassWord}) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
          endPoint: EndPoints.changeUserPassword,
          data: {
            'current_password': oldPassWord,
            'new_password': newPassWord,
            'new_password_confirm' : confirmPassWord,
          },
          isProtected: true);

      if (response.status) {
        // return user model
        if (response.data != null) {
          return Right(response.message);
        } else {
          throw Exception("Update Failed\nTry Again later");
        }
      } else {
        throw Exception("Update Failed\nTry Again later");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }
  
  
}