import 'package:dartz/dartz.dart';
import 'package:todo_app_nti/features/home/data/repo/home_repo.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../../../auth/data/models/login_model.dart';

class HomeRepoImplementation implements HomeRepo
{
  // singleton
  static final HomeRepoImplementation _instance = HomeRepoImplementation._internal();
  factory HomeRepoImplementation() => _instance;
  HomeRepoImplementation._internal();

  ApiHelper apiHelper = ApiHelper();
  @override
  Future<Either<String, UserModel>> getUserData() async
  {
    try
    {
      ApiResponse response = await apiHelper.getRequest(endPoint: EndPoints.getUserData, isProtected: true);
      LoginModel loginResponseModel = LoginModel.fromJson(response.data);
      if(loginResponseModel.status != null && loginResponseModel.status == true)
      {
        // return user model
        if(loginResponseModel.user != null)
        {
          return Right(loginResponseModel.user!);
        }
        else
        {
          throw Exception("Login Failed\nTry Again later");
        }
      }
      else
      {
        throw Exception("Login Failed\nTry Again later");
      }
    }
    catch(e)
    {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }

  }
}