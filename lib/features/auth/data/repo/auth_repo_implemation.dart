import 'package:cross_file/src/types/interface.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app_nti/core/network/api_helper.dart';
import '../../../../core/cache/ cache_helper.dart';
import '../../../../core/cache/cache_keys.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../models/login_model.dart';
import 'auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  // singleton
  AuthRepoImplementation._internal();
  static final AuthRepoImplementation _repo =
      AuthRepoImplementation._internal();
  factory AuthRepoImplementation() => _repo;

  ApiHelper apiHelper = ApiHelper();

  // TODO: Wrap api keys into separate file

  Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      ApiResponse response = await apiHelper.postRequest(
        endPoint: EndPoints.login,
        data: {'username': username, 'password': password},
      );
      LoginModel loginModel = LoginModel.fromJson(response.data);
      if (loginModel.status != null && loginModel.status == true) {
        // store tokens
        await CacheHelper.saveData(
          key: CacheKeys.accessToken,
          value: loginModel.accessToken,
        );
        await CacheHelper.saveData(
          key: CacheKeys.refreshToken,
          value: loginModel.refreshToken,
        );
        // return user model
        if (loginModel.user != null) {
          return Right(loginModel.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> register({
    required String username,
    required String password,
    required XFile? image,
  }) async {
    try {
      await apiHelper.postRequest(
        endPoint: EndPoints.register,
        data: {
          'username': username,
          'password': password,
          'image':
              image == null
                  ? null
                  : await MultipartFile.fromFile(
                    image.path,
                    filename: image.name,
                  ),
        },
      );
      return Right(null);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response?.data['message'] != null) {
          return Left(e.response?.data['message']);
        }
      }

      print("Error ${e.toString()}");
      return Left(e.toString());
    }
  }
}
